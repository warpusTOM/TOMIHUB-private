import re, sys

NUM = re.compile(r'(?:0[xX][0-9A-Fa-f_]+|0[bB][01_]+|(?:\d[\d_]*\.?[\d_]*|\.\d[\d_]*)(?:[eE][+-]?\d+)?)')

def to_num(t):
    t = t.replace('_', '')
    if t[:2].lower() == '0x': return int(t, 2) if False else int(t, 16)
    if t[:2].lower() == '0b': return int(t, 2)
    return float(t) if ('.' in t or 'e' in t.lower()) else int(t)

def fmt(v):
    if isinstance(v, int): return str(v)
    if v == int(v): return str(int(v))
    return repr(round(v, 10))

def skip_ws(s, i):
    while i < len(s) and s[i] in ' \t\r\n': i += 1
    return i

def parse_num(s, i):
    m = NUM.match(s, i)
    if not m: return None
    return (to_num(m.group(0)), m.end())

def parse_primary(s, i):
    i = skip_ws(s, i)
    if i < len(s) and s[i] == '(':
        r = parse_expr(s, i + 1)
        if r is None: return None
        v, j = r; j = skip_ws(s, j)
        if j < len(s) and s[j] == ')': return (v, j + 1)
        return None
    if i < len(s) and s[i] in '+-':
        r = parse_primary(s, i + 1)
        if r is None: return None
        v, j = r
        return ((-v if s[i] == '-' else v), j)
    return parse_num(s, i)

def parse_term(s, i):
    r = parse_primary(s, i)
    if r is None: return None
    v, j = r
    while True:
        k = skip_ws(s, j)
        if k < len(s) and s[k] in '*/%':
            op = s[k]; r2 = parse_primary(s, k + 1)
            if r2 is None: break
            v2, j2 = r2
            try:
                if op == '*': v = v * v2
                elif op == '/': v = v / v2
                else: v = v % v2
            except ZeroDivisionError:
                break
            j = j2
        else: break
    return (v, j)

def parse_expr(s, i):
    r = parse_term(s, i)
    if r is None: return None
    v, j = r
    while True:
        k = skip_ws(s, j)
        if k < len(s) and s[k] in '+-':
            op = s[k]; r2 = parse_term(s, k + 1)
            if r2 is None: break
            v2, j2 = r2
            v = v + v2 if op == '+' else v - v2
            j = j2
        else: break
    return (v, j)

IDCH = set('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_')

def fold(src):
    out = []; i = 0; n = len(src)
    while i < n:
        c = src[i]
        if c == '[' and src[i:i+2] in ('[[', '[='):
            m = re.match(r'\[(=*)\[', src[i:])
            if m:
                close = ']' + m.group(1) + ']'
                j = src.find(close, i + m.end())
                j = n if j == -1 else j + len(close)
                out.append(src[i:j]); i = j; continue
        if c in '"\'':
            q = c; j = i + 1
            while j < n:
                if src[j] == '\\': j += 2; continue
                if src[j] == q: j += 1; break
                j += 1
            out.append(src[i:j]); i = j; continue
        prev = src[i-1] if i > 0 else ''
        start_ok = (c.isdigit()
                    or (c == '.' and i+1 < n and src[i+1].isdigit())
                    or c == '('
                    or (c in '+-' and prev not in IDCH and prev not in ')]}'))
        if start_ok and prev not in IDCH:
            r = parse_expr(src, i)
            if r is not None:
                v, j = r
                after = src[j] if j < n else ''
                span = src[i:j]
                if after not in IDCH:
                    new = fmt(v)
                    if span.strip() != new:
                        # never let a folded sign fuse with an adjacent sign into
                        # '--' (a Lua comment) or '++' — keep the tokens separate
                        if out and out[-1] and new[0] in '+-' and out[-1][-1] == new[0]:
                            out.append(' ')
                        out.append(new); i = j; continue
        out.append(c); i += 1
    return ''.join(out)

if __name__ == '__main__':
    src = open(sys.argv[1], encoding='utf-8', errors='replace').read()
    res = fold(src)
    open(sys.argv[2], 'w', encoding='utf-8').write(res)
    print(f"{sys.argv[1]}: {len(src)} -> {len(res)} chars")
