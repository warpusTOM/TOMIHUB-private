"""Context-aware rebrand: CloverHub / VoidHub -> TOMI HUB.

The first pass was a blind str.replace over the whole file, which glued a
space into identifiers:

    _G.CloverHub_FastAgeBreak   ->  _G.TOMI HUB_FastAgeBreak   (invalid Lua)

This version walks the source and applies different rules per context:

  * string literals + comments  -> free text substitution
  * identifiers                 -> whole-name or prefix substitution only

Identifiers are never given a space, so the output always parses.
"""
import re
import sys

BASE = r"C:\Users\Administrator\WorkBuddy AI\2026-09-12-23-07-07\CloverHub"

# --- applied inside string literals and comments (ordered, specific first) ---
# Note the two "glued" rules: a brand immediately followed by an identifier
# character is a compound name ("CloverHubOverlayCatcher"), so it must rebrand
# without a space.  Only a free-standing brand becomes "TOMI HUB".
STR_SUB = [
    (re.compile(r"CloverHub\(StealAnEgg\)\.lua"), "TOMIHUB(StealAnEgg).lua"),
    (re.compile(r"__CloverHubLoading"),           "__TomiHubLoading"),
    (re.compile(r"__VoidHubUIActive"),            "__TomiHubUIActive"),
    (re.compile(r"VoidHub-TW"),                   "TOMIHUB-TW"),
    (re.compile(r"CloverHub(?=[A-Za-z0-9_])"),    "TOMIHUB"),
    (re.compile(r"VoidHub(?=[A-Za-z0-9_])"),      "TOMIHUB"),
    (re.compile(r"VOIDHUB(?=[A-Za-z0-9_])"),      "TOMIHUB"),
    (re.compile(r"voidhub(?=[A-Za-z0-9_])"),      "tomihub"),
    (re.compile(r"CloverHub"),                    "TOMI HUB"),
    (re.compile(r"VoidHub"),                      "TOMI HUB"),
    (re.compile(r"VOIDHUB"),                      "TOMI HUB"),
    (re.compile(r"voidhub"),                      "tomi hub"),
]

# --- applied to identifier tokens only --------------------------------------
ID_EXACT = {
    "CloverHub":          "TOMIHUB",
    "VoidHub":            "TOMIHUB",
    "VOIDHUB":            "TOMIHUB",
    "voidhub":            "tomihub",
    "__CloverHubLoading": "__TomiHubLoading",
    "__VoidHubUIActive":  "__TomiHubUIActive",
    "CloverHubLoading":   "TomiHubLoading",
    "VoidHubUIActive":    "TomiHubUIActive",
}
ID_PREFIX = [
    ("__CloverHub", "__TomiHub"),
    ("__VoidHub",   "__TomiHub"),
    ("CloverHub_",  "TOMIHUB_"),
    ("VoidHub_",    "TOMIHUB_"),
    ("CloverHub",   "TOMIHUB"),
    ("VoidHub",     "TOMIHUB"),
]

IDENT = re.compile(r"[A-Za-z_][A-Za-z0-9_]*")
LONG_OPEN = re.compile(r"\[(=*)\[")


def sub_str(text):
    for pat, rep in STR_SUB:
        text = pat.sub(rep, text)
    return text


def sub_ident(name):
    if name in ID_EXACT:
        return ID_EXACT[name]
    for pre, rep in ID_PREFIX:
        if name.startswith(pre):
            return rep + name[len(pre):]
    return name


def rebrand(src):
    out, i, n = [], 0, len(src)
    while i < n:
        c = src[i]

        # ---- long-bracket string  [=[ ... ]=] ----
        if c == '[' and src[i:i + 2] in ('[[', '[='):
            m = LONG_OPEN.match(src, i)
            if m:
                close = ']' + m.group(1) + ']'
                j = src.find(close, i + m.end())
                j = n if j == -1 else j + len(close)
                out.append(sub_str(src[i:j])); i = j; continue

        # ---- comment ----
        if src[i:i + 2] == '--':
            m = re.match(r'--\[(=*)\[', src[i:])
            if m:
                close = ']' + m.group(1) + ']'
                j = src.find(close, i + m.end())
                j = n if j == -1 else j + len(close)
                out.append(sub_str(src[i:j])); i = j; continue
            j = src.find('\n', i)
            j = n if j == -1 else j
            out.append(sub_str(src[i:j])); i = j; continue

        # ---- short string ----
        if c in '"\'':
            q, j = c, i + 1
            while j < n:
                if src[j] == '\\':
                    j += 2; continue
                if src[j] == q:
                    j += 1; break
                j += 1
            out.append(sub_str(src[i:j])); i = j; continue

        # ---- identifier ----
        m = IDENT.match(src, i)
        if m:
            out.append(sub_ident(m.group(0))); i = m.end(); continue

        out.append(c); i += 1
    return ''.join(out)


JOBS = [
    (BASE + r"\_pretty_GardenWorld.lua",  BASE + r"\TOMIHUB\GardenWorld.lua"),
    (BASE + r"\_pretty_TradingWorld.lua", BASE + r"\TOMIHUB\TradingWorld.lua"),
    (BASE + r"\_pretty_void.lua",         BASE + r"\TOMIHUB\void.lua"),
    (BASE + r"\main.lua",                 BASE + r"\TOMIHUB\TOMIHUB(loader).lua"),
]

if __name__ == '__main__':
    for src_p, dst_p in JOBS:
        src = open(src_p, encoding='utf-8', errors='replace').read()
        dst = rebrand(src)
        open(dst_p, 'w', encoding='utf-8').write(dst)

        # any 'TOMI HUB' still touching an identifier char is a bug
        bad = re.findall(r'[A-Za-z0-9_]TOMI HUB|TOMI HUB[A-Za-z0-9_]', dst)
        left = len(re.findall(r'CloverHub|VoidHub|VOIDHUB|voidhub', dst))
        print(f"{dst_p.split(chr(92))[-1]:<24} {len(src):>8,} -> {len(dst):>8,}   "
              f"glued={len(bad)}  brand-left={left}")
        if bad:
            print("     !! ", sorted(set(bad))[:6])
