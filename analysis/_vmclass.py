import re, sys, csv
sys.path.insert(0, r"C:\Users\Administrator\WorkBuddy AI\2026-09-12-23-07-07\CloverHub")
from _beautify import tokenize

SRC = r"C:\Users\Administrator\WorkBuddy AI\2026-09-12-23-07-07\CloverHub\_vm_pretty.lua"
OUT_MD = r"C:\Users\Administrator\WorkBuddy AI\2026-09-12-23-07-07\CloverHub\TOMIHUB\luraph-vm-handlers.md"
OUT_CSV = r"C:\Users\Administrator\WorkBuddy AI\2026-09-12-23-07-07\CloverHub\TOMIHUB\luraph-vm-handlers.csv"

OPENERS = {'function', 'if', 'do', 'repeat'}
CLOSERS = {'end', 'until'}
ARITH = {'+', '-', '*', '/', '%', '^'}
CMP = {'==', '~=', '<', '>', '<=', '>='}
BIT = {'&', '|', '<<', '>>', '~'}
READERS = ('readu8', 'readu16', 'readi32', 'readi16', 'readi8', 'readf64', 'readf32', 'readu32')

src = open(SRC, encoding='utf-8', errors='replace').read()
toks = tokenize(src)
N = len(toks)

def is_name(t):  return t[0] == 'NAME'
def is_kw(t, v): return t[0] == 'KW' and t[1] == v
def is_op(t, v): return t[0] == 'OP' and t[1] == v

# locate the outer return ( { ... } )
start = None
for i in range(N - 2):
    if is_kw(toks[i], 'return') and is_op(toks[i+1], '(') and is_op(toks[i+2], '{'):
        start = i + 2
        break
if start is None:
    sys.exit('outer table not found')

# collect top-level "NAME = function" entries inside the outer table
entries = []
i = start + 1
brace = 1
while i < N and brace > 0:
    t = toks[i]
    if is_op(t, '{'): brace += 1
    elif is_op(t, '}'):
        brace -= 1
        if brace == 0: break
    elif brace == 1 and is_name(t) and is_op(toks[i+1], '=') and is_kw(toks[i+2], 'function'):
        name = t[1]
        # walk the function body: depth from the 'function' token
        j = i + 2
        depth = 0
        body = []
        while j < N:
            tt = toks[j]
            if tt[0] == 'KW' and tt[1] in OPENERS: depth += 1
            elif tt[0] == 'KW' and tt[1] in CLOSERS: depth -= 1
            body.append(tt)
            if depth == 0 and tt[0] == 'KW' and tt[1] in CLOSERS:
                break
            j += 1
        entries.append((name, body))
        i = j + 1
        continue
    i += 1

rows = []
for idx, (name, body) in enumerate(entries):
    ops = [t for t in body if t[0] == 'OP']
    kws = [t[1] for t in body if t[0] == 'KW']
    names = [t[1] for t in body if t[0] == 'NAME']
    strs = [t for t in body if t[0] == 'STR']
    nums = [t for t in body if t[0] == 'NUM']
    opv = [t[1] for t in ops]
    arith = sum(1 for o in opv if o in ARITH)
    cmp_ = sum(1 for o in opv if o in CMP)
    bit = sum(1 for o in opv if o in BIT)
    idx_ = opv.count('[')
    call = sum(1 for k in range(1, len(body))
               if is_op(body[k], '(') and (body[k-1][0] in ('NAME',) or is_op(body[k-1], ')') or is_op(body[k-1], ']')))
    rets = kws.count('return')
    loops = sum(kws.count(k) for k in ('for', 'while', 'repeat'))
    assigns = opv.count('=')
    reader = any(r in names for r in READERS)
    nret = kws.count('return')
    rows.append(dict(
        idx=idx, name=name, tokens=len(body),
        arith=arith, cmp=cmp_, bit=bit, index=idx_, call=call,
        ret=rets, loop=loops, assign=assigns,
        reader='yes' if reader else '',
        strings=len(strs), nums=len(nums),
    ))

# rough classification
def klass(r):
    tags = []
    if r['reader']: tags.append('bytecode-reader')
    if r['loop']: tags.append('loop/control')
    if r['cmp'] >= 2: tags.append('compare/branch')
    if r['bit']: tags.append('bitwise')
    if r['arith'] >= 3: tags.append('arithmetic')
    if r['index'] >= 4: tags.append('table-index')
    if r['call'] >= 3: tags.append('call-heavy')
    if r['ret'] >= 1: tags.append('returns-value')
    if r['assign'] >= 3: tags.append('mutates-state')
    return ', '.join(tags) if tags else 'unclassified'

for r in rows:
    r['class'] = klass(r)

with open(OUT_CSV, 'w', newline='', encoding='utf-8') as f:
    w = csv.DictWriter(f, fieldnames=list(rows[0].keys()))
    w.writeheader(); w.writerows(rows)

lines = []
lines.append('# Luraph VM — dispatch-table classification\n')
lines.append(f'Source: `TOMIHUB(StealAnEgg).vm-beautified.lua`  ·  **{len(rows)} handlers**\n')
lines.append('Each entry is one opcode handler in the VM dispatch table `return({...})`.')
lines.append('Feature columns are token counts inside that handler body.\n')
lines.append('| # | handler | toks | arith | cmp | bit | index | call | ret | loop | assign | reader | class |')
lines.append('|---|---|---|---|---|---|---|---|---|---|---|---|---|')
for r in rows:
    lines.append('| {idx} | `{name}` | {tokens} | {arith} | {cmp} | {bit} | {index} | {call} | {ret} | {loop} | {assign} | {reader} | {class} |'.format(**r))

from collections import Counter
cc = Counter(r['class'] for r in rows)
lines.append('\n## Class histogram\n')
for k, v in cc.most_common():
    lines.append(f'- {v:3d}  {k}')

lines.append('\n## Reader-bearing handlers (bytecode consumers)\n')
for r in rows:
    if r['reader']:
        lines.append(f"- `{r['name']}` (#{r['idx']}) — {r['tokens']} tokens, class: {r['class']}")

open(OUT_MD, 'w', encoding='utf-8').write('\n'.join(lines))
print(f'handlers: {len(rows)}')
print(f'wrote {OUT_MD}')
print(f'wrote {OUT_CSV}')
print('classes:')
for k, v in cc.most_common():
    print(f'  {v:3d}  {k}')
