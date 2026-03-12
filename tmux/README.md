# Tmux Quick Reference

This README provides a quick refresher for tmux, specifically tailored to the customizations in this dotfiles repository (`.tmux.conf`).

## Core Concepts
Tmux relies on a **Prefix key**. You press and release the Prefix key, then press a command key.

**Your Custom Prefix Key:** `Ctrl + a` (The default `Ctrl + b` has been remapped).

## 🚀 Session Management (From the Terminal)
*   **Start a new session:** `tmux`
*   **Start a named session:** `tmux new -s <name>`
*   **List sessions:** `tmux ls`
*   **Attach to a session:** `tmux attach -t <name>`
*   **Kill a session:** `tmux kill-session -t <name>`

## 🪟 Window Management (Tabs)
*Think of windows like browser tabs.*
*   **Create window:** `Prefix` + `c`
*   **Rename current window:** `Prefix` + `,`
*   **Go to window number:** `Prefix` + `1`, `2`, `3`, etc. *(Note: Your config starts counting at 1, not 0)*
*   **Go to next/previous window:** `Prefix` + `n` / `Prefix` + `p`
*   **List windows (interactive):** `Prefix` + `w`
*   **Close window:** `Prefix` + `&`

## ◫ Pane Management (Splits)
*Think of panes as split screens within a window.*
*   **Split vertically (left/right):** `Prefix` + `%`
*   **Split horizontally (top/bottom):** `Prefix` + `"`
*   **Navigate panes (Vim style):** `Prefix` + `h`, `j`, `k`, `l` *(Custom mapping)*
*   **Navigate panes (Arrows):** `Prefix` + `Up`, `Down`, `Left`, `Right`
*   **Zoom pane (fullscreen toggle):** `Prefix` + `z`
*   **Close current pane:** `Prefix` + `x`

## 🛠️ Custom Dotfile Specifics
*   **Prefix Key:** `Ctrl + a`
*   **Mouse Mode:** **ON** (You can click to select panes/windows, and scroll normally).
*   **Base Index:** Windows and Panes start at `1` instead of `0`.
*   **Reload Config:** `Prefix` + `r`
*   **Copy Mode:** Uses `vi` keybindings (`Prefix` + `[` to enter copy mode).
*   **Theme:** Catppuccin with a top status bar.
