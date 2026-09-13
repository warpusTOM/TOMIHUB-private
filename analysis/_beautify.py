import re, sys

NUM = re.compile(r'(?:0[xX][0-9A-Fa-f_]+|0[bB][01_]+|(?:\d[\d_]*\.?[\d_]*|\.\d[\d_]*)(?:[eE][+-]?\d+)?)')
NAME = re.compile(r'[A-Za-z_][A-Za-z0-9_]*')
OPS = ['...', '..=', '//=', '<<=', '>>=', '==', '~=', '<=', '>=', '::', '//', '<<', '>>',
       '..', '+=', '-=', '*=', '/=', '%=', '^=', '->', '+', '-', '*', '/', '%', '^', '#',
       '=', '<', '>', '(', ')', '{', '}', '[', ']', ';', ':', ',', '.', '&', '|', '~']

KEYWORDS = {'and','break','do','else','elseif','end','false','for','function','if','in',
            'local','nil','not','or','repeat','return','then','true','until','while','continue'}

def tokenize(src):
    toks = []
    i, n = 0, len(src)
    while i < n:
        c = src[i]
        if c in ' \t\r\n':
            i += 1; continue
        if c == '-' and src[i:i+2] == '--':
            j = src.find('\n', i)
            if j == -1: j = n
            toks.append(('COMMENT', src[i:j])); i = j; continue
        if c in '"\'':
            q = c; j = i + 1
            while j < n:
                if src[j] == '\\': j += 2; continue
                if src[j] == q: j += 1; break
                j += 1
            toks.append(('STR', src[i:j])); i = j; continue
        if c == '[' and src[i:i+2] in ('[[', '[='):
            m = re.match(r'\[(=*)\[', src[i:])
            if m:
                eq = m.group(1); close = ']' + eq + ']'
                j = src.find(close, i + m.end())
                j = n if j == -1 else j + len(close)
                toks.append(('STR', src[i:j])); i = j; continue
        m = NUM.match(src, i)
        if m and (c.isdigit() or (c == '.' and i+1 < n and src[i+1].isdigit())):
            toks.append(('NUM', m.group(0))); i = m.end(); continue
        m = NAME.match(src, i)
        if m:
            w = m.group(0)
            toks.append(('KW' if w in KEYWORDS else 'NAME', w)); i = m.end(); continue
        for op in OPS:
            if src.startswith(op, i):
                toks.append(('OP', op)); i += len(op); break
        else:
            toks.append(('OP', c)); i += 1
    return toks

VALUE_END = {'NAME','NUM','STR'}
DEDENT_BEFORE = {'end','else','elseif','until'}
NEWLINE_BEFORE = {'end','else','elseif','until','repeat'}
STMT_START = {'local','if','for','while','repeat','return','function','break','continue','do'}

NO_SPACE_BEFORE = {')',']','}',',',';',':','.','..','...'}
NO_SPACE_AFTER  = {'(','[','{','.','..','...',':','#','$'}
UNARY_PREV_OPS  = {'(','[','{',',',';','=','==','~=','<=','>=','<','>','+','-','*','/','%','^','..','..=','//','::'}
UNARY_PREV_KW   = {'and','or','not','return','then','do','else','elseif','while','until','in','local'}

def space_needed(p, c):
    if p is None: return False
    pt, pv = p; ct, cv = c
    if pt == 'COMMENT': return True
    if ct == 'OP' and cv in NO_SPACE_BEFORE: return False
    if pt == 'OP' and pv in NO_SPACE_AFTER: return False
    if pt == 'UNARY': return False
    if ct == 'OP' and cv in ('(', '['):
        if pt in ('NAME', 'STR', 'NUM') or (pt == 'OP' and pv in (')', ']', '}')):
            return False
    return True

def fmt(toks):
    out = []; ind = 0; func_paren = []; pdepth = 0; prev = None; fresh = True

    def nl():
        nonlocal fresh
        out.append('\n' + '    ' * ind); fresh = True

    for ti, (t, v) in enumerate(toks):
        nxt = toks[ti + 1] if ti + 1 < len(toks) else None
        if t == 'COMMENT':
            if not fresh: nl()
            out.append(v); fresh = False; prev = ('COMMENT', v); continue
        if t == 'KW' and v in DEDENT_BEFORE:
            ind = max(0, ind - 1)
        need_nl = False
        if t == 'KW' and v in NEWLINE_BEFORE:
            need_nl = True
        elif t == 'KW' and v in STMT_START:
            if prev and (prev[0] in VALUE_END
                         or (prev[0] == 'OP' and prev[1] in (')', ']', '}'))
                         or (prev[0] == 'KW' and prev[1] in ('end','true','false','nil','break','continue','return'))):
                need_nl = True
        elif t == 'NAME' and prev and (prev[0] in VALUE_END
                                       or (prev[0] == 'OP' and prev[1] in (')', ']', '}'))):
            need_nl = True
        if need_nl and not fresh:
            nl()
        cur = (t, v)
        if (not fresh) and space_needed(prev, cur):
            out.append(' ')
        out.append(v); fresh = False
        is_unary = False
        if t == 'OP' and v in ('-', '+'):
            if prev is None or prev[0] == 'UNARY' \
               or (prev[0] == 'OP' and prev[1] in UNARY_PREV_OPS) \
               or (prev[0] == 'KW' and prev[1] in UNARY_PREV_KW):
                is_unary = True
        if t == 'OP' and v == '(':
            pdepth += 1
        if t == 'KW' and v in ('then', 'do', 'repeat'):
            ind += 1; nl()
        elif t == 'KW' and v == 'else':
            ind += 1; nl()
        elif t == 'KW' and v in ('end', 'until'):
            if not (nxt and nxt[0] == 'OP' and nxt[1] in (')', ',', ';', ']', '}', '.', ':')):
                nl()
        elif t == 'KW' and v == 'function':
            func_paren.append(pdepth)
        elif t == 'OP' and v == ')':
            pdepth -= 1
            if func_paren and pdepth == func_paren[-1]:
                func_paren.pop(); ind += 1; nl()
        elif t == 'OP' and v == ';':
            nl()
        prev = ('UNARY', v) if is_unary else cur
    return ''.join(out)

if __name__ == '__main__':
    src = open(sys.argv[1], encoding='utf-8', errors='replace').read()
    toks = tokenize(src)
    res = fmt(toks)
    open(sys.argv[2], 'w', encoding='utf-8').write(res)
    print(f"{sys.argv[1]}: {len(src)} -> {len(res)} chars, {res.count(chr(10))} lines, {len(toks)} tokens")
