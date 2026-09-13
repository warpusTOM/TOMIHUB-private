import re, sys, json
sys.path.insert(0, r"C:\Users\Administrator\WorkBuddy AI\2026-09-12-23-07-07\CloverHub")
from _beautify import tokenize

SRC = r"C:\Users\Administrator\WorkBuddy AI\2026-09-12-23-07-07\CloverHub\_vm_pretty.lua"
OUT = r"C:\Users\Administrator\WorkBuddy AI\2026-09-12-23-07-07\CloverHub\TOMIHUB\luraph-vm-opcodes.md"

OPENERS = {'function', 'if', 'do', 'repeat'}
CLOSERS = {'end', 'until'}

src = open(SRC, encoding='utf-8', errors='replace').read()
toks = tokenize(src)
N = len(toks)

def is_name(t, v=None): return t[0] == 'NAME' and (v is None or t[1] == v)
def is_kw(t, v): return t[0] == 'KW' and t[1] == v
def is_op(t, v): return t[0] == 'OP' and t[1] == v

# --- locate the interpreter core: the largest top-level handler ---
start = None
for i in range(N - 2):
    if is_kw(toks[i], 'return') and is_op(toks[i+1], '(') and is_op(toks[i+2], '{'):
        start = i + 2; break

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
        j = i + 2; depth = 0; body = []
        while j < N:
            tt = toks[j]
            if tt[0] == 'KW' and tt[1] in OPENERS: depth += 1
            elif tt[0] == 'KW' and tt[1] in CLOSERS: depth -= 1
            body.append(tt)
            if depth == 0 and tt[0] == 'KW' and tt[1] in CLOSERS: break
            j += 1
        entries.append((t[1], body)); i = j + 1; continue
    i += 1

core_name, core = max(entries, key=lambda e: len(e[1]))
print(f'handlers: {len(entries)}  |  interpreter core: {core_name} ({len(core)} tokens)')

# --- opcode variable ---
OPVAR = 'E'
fetch = None
for k in range(len(core) - 3):
    if is_name(core[k], OPVAR) and is_op(core[k+1], '=') and is_op(core[k+2], '('):
        fetch = k
        break

# --- collect comparisons on the opcode variable ---
cmps = []
k = 0
while k < len(core) - 2:
    if is_name(core[k], OPVAR) and core[k+1][0] == 'OP' and core[k+1][1] in ('<', '>', '<=', '>=', '==', '~='):
        if core[k+2][0] == 'NUM':
            cmps.append((core[k+1][1], int(float(core[k+2][1]))))
            k += 3; continue
    if core[k][0] == 'NUM' and core[k+1][0] == 'OP' and core[k+1][1] in ('<', '>', '<=', '>=', '==', '~=') and is_name(core[k+2], OPVAR):
        cmps.append((core[k+1][1], int(float(core[k][1]))))
        k += 3; continue
    k += 1

bounds = sorted({n for _, n in cmps})
exact = sorted({n for op, n in cmps if op in ('==', '~=')})
print(f'opcode comparisons: {len(cmps)}  |  distinct boundary constants: {len(bounds)}')
print(f'boundaries: {bounds}')

# --- operand arrays referenced inside the interpreter ---
operand_arrays = {}
for k in range(len(core) - 3):
    if core[k][0] == 'NAME' and is_op(core[k+1], '[') and core[k+2][0] == 'NAME' and is_op(core[k+3], ']'):
        key = f'{core[k][1]}[{core[k+2][1]}]'
        operand_arrays[key] = operand_arrays.get(key, 0) + 1

# --- VM registers / state touched ---
state = {}
for k in range(len(core)):
    if core[k][0] == 'NAME' and k + 1 < len(core) and is_op(core[k+1], '['):
        state[core[k][1]] = state.get(core[k][1], 0) + 1

L = []
L.append('# Luraph VM — opcode space\n')
L.append(f'Interpreter core: handler `{core_name}` — **{len(core):,} tokens** (largest of {len(entries)} handlers)\n')
L.append('## Architecture, read off the core\n')
L.append('```')
L.append('e[n]        -> opcode fetch        (e = bytecode stream, n = pc)')
L.append('E = e[n]    -> the opcode value')
L.append('c[n] s[n] i[n] -> operand streams   (parallel arrays, same pc)')
L.append('D[...]      -> register file (the VM stack frame)')
L.append('Z[y + d]    -> constants / upvalue table, y = frame base')
L.append('J[26]       -> arg-packing helper (builds a call argument list)')
L.append('J[60]       -> return-adjust helper')
L.append('J[4]        -> closure/thread spawn used for the main loop')
L.append('```')
L.append('')
L.append(f'Opcode dispatch is a **binary-search comparison tree** on `E` — {len(cmps)} comparisons,')
L.append(f'{len(bounds)} distinct boundary constants. That set *is* the opcode space.\n')
L.append('## Opcode boundary constants\n')
L.append('| op | constant |')
L.append('|---|---|')
for op, n in cmps[:80]:
    L.append(f'| `E {op}` | {n} |')
if len(cmps) > 80:
    L.append(f'| … | _{len(cmps)-80} more_ |')
L.append('')
L.append(f'**Boundaries:** `{bounds}`\n')
L.append(f'**Exact-equality opcodes (`==` / `~=`):** `{exact}`\n')
L.append('## Operand / state arrays referenced in the core\n')
L.append('| expression | refs |')
L.append('|---|---|')
for k, v in sorted(operand_arrays.items(), key=lambda x: -x[1])[:25]:
    L.append(f'| `{k}` | {v} |')
L.append('')
L.append('## VM state variables (indexed access)\n')
L.append('| var | refs |')
L.append('|---|---|')
for k, v in sorted(state.items(), key=lambda x: -x[1])[:20]:
    L.append(f'| `{k}` | {v} |')
L.append('')
open(OUT, 'w', encoding='utf-8').write('\n'.join(L))
print(f'wrote {OUT}')
