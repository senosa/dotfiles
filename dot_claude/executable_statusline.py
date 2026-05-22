#!/usr/bin/env python3
"""Status line:
Line 1: model │ cwd branch │ +add/-del
Line 2: Ctx │ 5h (h:mm) │ 7d (Nd h:mm)
"""

import json
import os
import re
import subprocess
import sys
from datetime import datetime, timezone

data = json.load(sys.stdin)

BRAILLE = " ⣀⣄⣤⣦⣶⣷⣿"
R = "\033[0m"
# Catppuccin Mocha
TEXT = "\033[38;2;205;214;244m"  # #cdd6f4  model など主テキスト
SUBTEXT1 = "\033[38;2;186;194;222m"  # #bac2de  branch
SUBTEXT0 = "\033[38;2;166;173;200m"  # #a6adc8  ラベル (Ctx / 5h / 7d)
OVERLAY1 = "\033[38;2;127;132;156m"  # #7f849c  残り時間 (h:mm)
OVERLAY0 = "\033[38;2;108;112;134m"  # #6c7086  │ セパレータ
GREEN = "\033[38;2;166;227;161m"  # #a6e3a1  +insertions
PINK = "\033[38;2;235;160;172m"  # #eba0ac  -deletions
MAUVE = "\033[38;2;203;166;247m"  # #cba6f7  cwd
SEP = f" {OVERLAY0}│{R} "


def gradient(pct):
    colors = [
        (0, (180, 190, 254)),
        (20, (116, 199, 236)),
        (40, (166, 227, 161)),
        (60, (249, 226, 175)),
        (80, (250, 179, 135)),
        (100, (243, 139, 168)),
    ]
    pct = min(max(pct, 0), 100)
    for i in range(len(colors) - 1):
        p1, c1 = colors[i]
        p2, c2 = colors[i + 1]
        if p1 <= pct <= p2:
            t = (pct - p1) / (p2 - p1) if p2 != p1 else 0
            r = int(c1[0] + (c2[0] - c1[0]) * t)
            g = int(c1[1] + (c2[1] - c1[1]) * t)
            b = int(c1[2] + (c2[2] - c1[2]) * t)
            return f"\033[38;2;{r};{g};{b}m"
    return ""


def braille_bar(pct, width=8):
    pct = min(max(pct, 0), 100)
    level = pct / 100
    bar = ""
    for i in range(width):
        seg_start = i / width
        seg_end = (i + 1) / width
        if level >= seg_end:
            bar += BRAILLE[7]
        elif level <= seg_start:
            bar += BRAILLE[0]
        else:
            frac = (level - seg_start) / (seg_end - seg_start)
            bar += BRAILLE[min(int(frac * 7), 7)]
    return bar


def fmt(label, pct, suffix=""):
    p = round(pct)
    return f"{SUBTEXT0}{label}{R} {gradient(pct)}{braille_bar(pct)}{R} {p}%{suffix}"


def remaining_str(resets_at_val):
    if not resets_at_val:
        return ""
    try:
        if isinstance(resets_at_val, (int, float)):
            resets_at = datetime.fromtimestamp(resets_at_val, tz=timezone.utc)
        else:
            ts = resets_at_val.replace("Z", "+00:00")
            resets_at = datetime.fromisoformat(ts)
        now = datetime.now(timezone.utc)
        delta = resets_at - now
        if delta.total_seconds() <= 0:
            return ""
        total_min = int(delta.total_seconds() // 60)
        days = total_min // (24 * 60)
        hours = (total_min % (24 * 60)) // 60
        mins = total_min % 60
        if days > 0:
            return f" {OVERLAY1}({days}d {hours}:{mins:02d}){R}"
        return f" {OVERLAY1}({hours}:{mins:02d}){R}"
    except Exception:
        return ""


# ── Line 1: model │ cwd branch │ +add/-del ─────────────────────────

model = data.get("model", {}).get("display_name", "Claude")
cwd_raw = data.get("cwd") or os.getcwd()
cwd_name = os.path.basename(cwd_raw.rstrip("/"))

git_data = data.get("git") or {}
branch = git_data.get("branch")
if not branch:
    try:
        r = subprocess.run(
            ["git", "branch", "--show-current"],
            capture_output=True,
            text=True,
            cwd=cwd_raw,
            timeout=2,
        )
        branch = r.stdout.strip() or None
    except Exception:
        pass

diff_stats = git_data.get("diff_stats") or {}
ins = diff_stats.get("insertions")
dels = diff_stats.get("deletions")
if ins is None and dels is None:
    try:
        r = subprocess.run(
            ["git", "diff", "--shortstat", "HEAD"],
            capture_output=True,
            text=True,
            cwd=cwd_raw,
            timeout=2,
        )
        m_i = re.search(r"(\d+) insertion", r.stdout)
        m_d = re.search(r"(\d+) deletion", r.stdout)
        ins = int(m_i.group(1)) if m_i else 0
        dels = int(m_d.group(1)) if m_d else 0
    except Exception:
        pass

cwd_part = f"{MAUVE}{cwd_name}{R}"
cwd_branch = f"{cwd_part} {SUBTEXT1}{branch}{R}" if branch else cwd_part

l1 = [f"{TEXT}{model}{R}", cwd_branch]
if ins is not None or dels is not None:
    l1.append(f"{GREEN}+{ins or 0}{R}/{PINK}-{dels or 0}{R}")

line1 = SEP.join(l1)

# ── Line 2: Ctx │ 5h (h:mm) │ 7d (Nd h:mm) ───────────────────────────

l2 = []

ctx = data.get("context_window", {}).get("used_percentage")
if ctx is not None:
    l2.append(fmt("Ctx", ctx))

five_d = data.get("rate_limits", {}).get("five_hour") or {}
five = five_d.get("used_percentage")
if five is not None:
    l2.append(fmt("5h", five, remaining_str(five_d.get("resets_at"))))

week_d = data.get("rate_limits", {}).get("seven_day") or {}
week = week_d.get("used_percentage")
if week is not None:
    l2.append(fmt("7d", week, remaining_str(week_d.get("resets_at"))))

line2 = SEP.join(l2)

print(f" {line1}\n {line2}", end="")
