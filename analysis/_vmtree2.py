"""Walk the Luraph v14 opcode dispatch tree with a real interval domain.

The dispatch is a nested if/elseif/else binary decision tree on the opcode
variable E.  Walking it with *disjoint* intervals yields the opcode map.

Previous attempt reused the parent window for every `else` branch, which made
windows overlap and produced a fake "256 covered, no gaps".
"""
import sys, json
sys.path.insert(0, r"C:\Users\Administrator\WorkBuddy AI\2026-09-12-23-07-07\CloverHub")
from _beautify import tokenize

BASE = r"C:\Users\Administrator\WorkBuddy AI\2026-09-12-23-07-07\CloverHub"
SRC = BASE + r"\_vm_pretty.lua"
OUT_MD = BASE + r"\TOMIHUB\luraph-opcode-map.md"
OUT_JSON = BASE + r"\TOMIHUB\luraph-opcode-map.json"

OPENERS = {'function', 'if', 'do', 'repeat'}
CLOSERS = {'end', 'until'}
OPVAR = 'E'
CMP = ('==', '~=', '<=', '>=', '<', '>')

is_name = lambda t, v=None: t[0] == 'NAME' and (v is None or t[1] == v)
is_kw = lambda t, v: t[0] == 'KW' and t[1] == v
is_op = lambda t, v: t[0] == 'OP' and t[1] == v


def num(tok):
    s = tok[1].replace('_', '')
    try:
        if s[:2].lower() in ('0x', '0b'):
            return int(s, 0)
        if '.' in s or 'e' in s.lower():
            return int(float(s))
        return int(s)
    except ValueError:
        return None


# ---------------------------------------------------------------- interval set
def norm(iv):
    iv = sorted(x for x in iv if x[0] <= x[1])
    out = []
    for a, b in iv:
        if out and a <= out[-1][1] + 1:
            out[-1] = (out[-1][0], max(out[-1][1], b))
        else:
            out.append((a, b))
    return out


def inter(iv, a, b):
    return norm([(max(x, a), min(y, b)) for x, y in iv if max(x, a) <= min(y, b)])


def excl(iv, a, b):
    r = []
    for x, y in iv:
        if b < x or a > y:
            r.append((x, y)); continue
        if x < a:
            r.append((x, a - 1))
        if y > b:
            r.append((b + 1, y))
    return norm(r)


def size(iv):
    return sum(b - a + 1 for a, b in iv)


# ---------------------------------------------------------------- token parsing
src = open(SRC, encoding='utf-8', errors='replace').read()
toks = tokenize(src)
N = len(toks)

# --- pull the handler table: return ({ k = function ... , ... }) ---
start = next(i for i in range(N - 2)
             if is_kw(toks[i], 'return') and is_op(toks[i + 1], '(') and is_op(toks[i + 2], '{'))
# `start` is the index of `return`; step past `return ( {` to the first key
entries, i, brace = [], start + 3, 1
while i < N and brace > 0:
    t = toks[i]
    if is_op(t, '{'):
        brace += 1
    elif is_op(t, '}'):
        brace -= 1
        if brace == 0:
            break
    elif brace == 1 and is_name(t) and is_op(toks[i + 1], '=') and is_kw(toks[i + 2], 'function'):
        j, depth, body = i + 2, 0, []
        while j < N:
            tt = toks[j]
            if tt[0] == 'KW' and tt[1] in OPENERS:
                depth += 1
            elif tt[0] == 'KW' and tt[1] in CLOSERS:
                depth -= 1
            body.append(tt)
            if depth == 0 and tt[0] == 'KW' and tt[1] in CLOSERS:
                break
            j += 1
        entries.append((t[1], body)); i = j + 1; continue
    i += 1

core_name, core = max(entries, key=lambda e: len(e[1]))


def parse_block(t, i, stop):
    out, depth = [], 0
    while i < len(t):
        tok = t[i]
        if tok[0] == 'KW':
            if depth == 0 and tok[1] in stop:
                break
            if tok[1] in OPENERS:
                depth += 1
            elif tok[1] in CLOSERS:
                depth -= 1
        out.append(tok); i += 1
    return out, i


def read_cond(t, i):
    cond, depth = [], 0
    while i < len(t):
        tok = t[i]
        if tok[0] == 'KW' and tok[1] == 'then' and depth == 0:
            break
        if tok[0] == 'KW' and tok[1] in OPENERS:
            depth += 1
        elif tok[0] == 'KW' and tok[1] in CLOSERS:
            depth -= 1
        cond.append(tok); i += 1
    return cond, i


def parse_if(t, i):
    cond, j = read_cond(t, i + 1)
    body, k = parse_block(t, j + 1, {'elseif', 'else', 'end'})
    brs = [(cond, body)]
    while k < len(t) and is_kw(t[k], 'elseif'):
        cond, j = read_cond(t, k + 1)
        body, k = parse_block(t, j + 1, {'elseif', 'else', 'end'})
        brs.append((cond, body))
    eb = []
    if k < len(t) and is_kw(t[k], 'else'):
        eb, k = parse_block(t, k + 1, {'end'})
    return brs, eb, k + 1


# ------------------------------------------------------- condition -> intervals
def cond_split(cond):
    """Return (op, n) describing how E is bounded by this condition, or None.

    The operand adjacent to the comparison operator decides the direction —
    NOT the last token in the condition.
    """
    for k, t in enumerate(cond):
        if t[0] == 'OP' and t[1] in CMP:
            op = t[1]
            lhs = cond[k - 1] if k > 0 else None
            rhs = cond[k + 1] if k + 1 < len(cond) else None
            break
    else:
        return None

    if lhs is not None and lhs[0] == 'NUM':
        n, e_left = num(lhs), False
    elif rhs is not None and rhs[0] == 'NUM':
        n, e_left = num(rhs), True
    else:
        return None                      # comparison not against a literal
    if n is None:
        return None

    if not e_left:
        op = {'<': '>', '>': '<', '<=': '>=', '>=': '<=', '==': '==', '~=': '~='}[op]
    if any(is_kw(t, 'not') for t in cond):
        op = {'<': '>=', '>': '<=', '<=': '>', '>=': '<', '==': '~=', '~=': '=='}[op]
    return op, n


def apply(op, n, iv, want_true):
    if op == '==':
        r = inter(iv, n, n) if want_true else excl(iv, n, n)
    elif op == '~=':
        r = excl(iv, n, n) if want_true else inter(iv, n, n)
    elif op == '<':
        r = inter(iv, -10**9, n - 1) if want_true else inter(iv, n, 10**9)
    elif op == '<=':
        r = inter(iv, -10**9, n) if want_true else inter(iv, n + 1, 10**9)
    elif op == '>':
        r = inter(iv, n + 1, 10**9) if want_true else inter(iv, -10**9, n)
    elif op == '>=':
        r = inter(iv, n, 10**9) if want_true else inter(iv, -10**9, n - 1)
    else:
        return iv
    return r


leaves, unknown = [], []


def descend(body, iv):
    if body and is_kw(body[0], 'if'):
        brs, eb, _ = parse_if(body, 0)
        walk(brs, eb, iv)
    else:
        leaves.append((iv, body))


def walk(brs, eb, iv):
    for cond, body in brs:
        sp = cond_split(cond)
        if sp is None:
            unknown.append(' '.join(t[1] for t in cond))
            descend(body, iv)          # unknown -> keep window (over-approximate)
            continue
        t_iv = apply(sp[0], sp[1], iv, True)
        if size(t_iv):
            descend(body, t_iv)
        iv = apply(sp[0], sp[1], iv, False)   # complement for the following elseif
        if not size(iv):
            break
    if eb and size(iv):
        descend(eb, iv)


# --- locate dispatch: while true do local E = ... then the if-chain ---
loop_at = None
for k in range(len(core) - 1):
    if is_kw(core[k], 'while') and is_kw(core[k + 1], 'true'):
        for m in range(k, min(k + 40, len(core) - 3)):
            if is_name(core[m], OPVAR) and is_op(core[m + 1], '='):
                loop_at = m; break
        if loop_at is not None:
            break
chain = next(k for k in range(loop_at, len(core)) if is_kw(core[k], 'if'))
brs, eb, _ = parse_if(core, chain)
walk(brs, eb, [(0, 255)])

# ---------------------------------------------------------------- classification
READERS = ('readu8', 'readu16', 'readi32', 'readi16', 'readi8', 'readf64', 'readf32', 'readu32')


def summarize(body):
    opv = [t[1] for t in body if t[0] == 'OP']
    kws = [t[1] for t in body if t[0] == 'KW']
    names = [t[1] for t in body if t[0] == 'NAME']
    srcs = [f'{body[k][1]}[{body[k+2][1]}]' for k in range(len(body) - 3)
            if body[k][0] == 'NAME' and is_op(body[k + 1], '[')
            and body[k + 2][0] in ('NAME', 'NUM') and is_op(body[k + 3], ']')]
    writes = []
    for k in range(len(body) - 1):
        if body[k][0] == 'NAME' and is_op(body[k + 1], '['):
            d = 0
            for m in range(k + 1, min(k + 9, len(body))):
                if is_op(body[m], '['):
                    d += 1
                elif is_op(body[m], ']'):
                    if d == 0:
                        if m + 1 < len(body) and is_op(body[m + 1], '='):
                            writes.append(f'{body[k][1]}[…]')
                        break
                    d -= 1
    tags = []
    if any(r in names for r in READERS):
        tags.append('bytecode-read')
    if any(w.startswith('D[') for w in writes) or any(s.startswith('D[') for s in srcs):
        tags.append('reg-file')
    if any(s.startswith('Z[') for s in srcs):
        tags.append('const-table')
    for pre, tag in (('c[', 'operand-c'), ('s[', 'operand-s'), ('i[', 'operand-i')):
        if any(s.startswith(pre) for s in srcs):
            tags.append(tag)
    if any(n == 26 for n in (num(t) for t in body if t[0] == 'NUM' if num(t) is not None)):
        tags.append('argpack?')
    if any(k in ('for', 'while', 'repeat') for k in kws):
        tags.append('loop')
    if 'return' in kws:
        tags.append('return')
    if any(o in ('+', '-', '*', '/', '%', '^') for o in opv):
        tags.append('arith')
    if any(o in ('==', '~=', '<', '>', '<=', '>=') for o in opv):
        tags.append('cmp')
    if any(o in ('&', '|', '<<', '>>', '~') for o in opv):
        tags.append('bitwise')
    if '#' in opv:
        tags.append('len')
    if '(' in opv:
        tags.append('call')
    return sorted(set(srcs))[:6], sorted(set(writes))[:4], sorted(set(tags)), len(body)


rows = []
for iv, body in leaves:
    if not size(iv):
        continue
    srcs, writes, tags, n = summarize(body)
    rows.append(dict(iv=iv, vals=[v for a, b in iv for v in range(a, b + 1)],
                     tags=tags, reads=srcs, writes=writes, toks=n))
rows.sort(key=lambda r: (r['vals'][0], len(r['vals'])))

covered = sorted({v for r in rows for v in r['vals']})
dupes = sorted(v for v in covered if sum(1 for r in rows if v in r['vals']) > 1)

L = ['# Luraph v14 VM - opcode map (recovered by walking the dispatch tree)', '']
L.append(f'Interpreter core `{core_name}` - {len(core):,} tokens. The `while true` loop fetches')
L.append('`E = e[n]` and dispatches through a nested if/elseif/else binary decision tree.')
L.append('Walking that tree with disjoint opcode intervals yields the map below.')
L.append('')
L.append(f'- leaves reached: **{len(rows)}**')
L.append(f'- distinct opcodes covered: **{len(covered)}**')
L.append(f'- unparseable (non-`E`) branch conditions: **{len(unknown)}**')
if unknown:
    L.append('')
    L.append('Branches the walker could not bound (window carried through, so those')
    L.append('leaves over-approximate their opcode range):')
    L.append('')
    for c in sorted(set(unknown)):
        L.append(f'- `{c}`')
    L.append('')
L.append(f'- opcodes claimed by more than one leaf: **{len(dupes)}**')
L.append('')
L.append('| opcode(s) | handler reads | writes | body ops | toks |')
L.append('|---|---|---|---|---|')
for r in rows:
    v = r['vals']
    lbl = f'`{v[0]}`' if len(v) == 1 else f'`{v[0]}`-`{v[-1]}`' + ('' if len(v) <= 8 else f' ({len(v)})')
    L.append(f"| {lbl} | {', '.join('`'+s+'`' for s in r['reads']) or '-'} | "
             f"{', '.join('`'+s+'`' for s in r['writes']) or '-'} | "
             f"{', '.join(r['tags']) or '-'} | {r['toks']} |")
L.append('')
L.append(f'**Opcodes covered:** {len(covered)}')
if covered:
    L.append(f'**Range:** `{covered[0]}` - `{covered[-1]}`')
    missing = [n for n in range(covered[0], covered[-1] + 1) if n not in covered]
    L.append(f'**Gaps in range:** {missing if missing else "none"}')
open(OUT_MD, 'w', encoding='utf-8').write('\n'.join(L))
json.dump([{k: v for k, v in r.items() if k != 'body'} for r in rows],
          open(OUT_JSON, 'w', encoding='utf-8'), indent=1)

print(f'core: {core_name} ({len(core):,} tokens)   leaves: {len(rows)}   '
      f'opcodes: {len(covered)}   unparseable branches: {len(unknown)}')
if covered:
    print(f'range: {covered[0]}..{covered[-1]}   overlapping opcodes: {len(dupes)}')
print(f'wrote {OUT_MD}')
