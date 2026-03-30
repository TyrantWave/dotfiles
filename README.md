# dotfiles

Personal configuration files managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Packages

| Package | Stow target | What it configures |
|---------|-------------|-------------------|
| `nvim`  | `~/.config/nvim` | Neovim with lazy.nvim, LSP, Treesitter, Telescope, Catppuccin Macchiato |
| `tmux`  | `~/.tmux.conf` | tmux with TPM, Catppuccin Macchiato theme, vi keys, Ctrl-a prefix |
| `zshrc` | `~/.zshrc` | Zsh with Oh My Zsh, Powerlevel10k, Catppuccin Macchiato syntax highlighting, autosuggestions |
| `ghostty` | `~/.config/ghostty/` | Ghostty terminal — Catppuccin Macchiato theme, JetBrainsMono Nerd Font 12pt |
| `lazygit` | `~/.config/lazygit/` | lazygit with Catppuccin Macchiato theme |
| `claude` | `~/.claude/` | Global Claude Code config — CLAUDE.md and agent definitions |
| `gemini` | `~/.gemini/` | Global Gemini CLI config — GEMINI.md, settings and agent definitions |

---

## Quick install

```bash
git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

The script handles everything: system packages (including Node.js and Go), JetBrainsMono Nerd Font, Oh My Zsh, Powerlevel10k, Catppuccin zsh syntax highlighting, TPM, Neovim python venv, Claude Code, Gemini CLI, and stowing all packages. Supports Debian/Ubuntu, Arch, and macOS.

**After the script completes:**

| Step | Command |
|------|---------|
| Configure prompt | `p10k configure` |
| Install tmux plugins | Start tmux, then `Ctrl-a + I` |
| Install Neovim plugins | Open `nvim` — lazy.nvim auto-installs on first launch |
| Install LSP servers | `:MasonInstall <server>` inside Neovim |
| Authenticate Claude | `claude` (follow prompts on first launch) |
| Authenticate Gemini | `gemini` (follow prompts on first launch) |

---

## Manual install

If you prefer to stow individual packages:

```bash
git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles
cd ~/dotfiles

stow nvim
stow tmux
stow zshrc
stow ghostty
stow lazygit
stow claude
stow gemini
```

### Claude agents
The `claude` package symlinks `~/.claude/CLAUDE.md` and `~/.claude/agents/` globally.
Agents are available in any project without any per-project config.

**Go agents:** `backend-go`, `qa-go`, `devops-go`, `security-go`, `review-go`
**Python agents:** `backend-python`, `planning-python`, `qa-python`, `review-python`, `security-python`

### Gemini agents
The `gemini` package symlinks `~/.gemini/GEMINI.md` and `~/.gemini/agents/` globally.
Agents are available in any project without any per-project config.

**Agents:** `backend`, `planning`, `qa`, `review`, `security`

---

## How Stow works

Stow symlinks the **contents** of a package directory into the target directory (default: the parent of the dotfiles repo, i.e. `~`).

```
dotfiles/
  tmux/
    .tmux.conf       →  ~/.tmux.conf
  nvim/
    .config/
      nvim/          →  ~/.config/nvim
  claude/
    .claude/
      CLAUDE.md      →  ~/.claude/CLAUDE.md
      agents/        →  ~/.claude/agents/
  ghostty/
    .config/
      ghostty/       →  ~/.config/ghostty/
  lazygit/
    .config/
      lazygit/       →  ~/.config/lazygit/
  gemini/
    .gemini/
      GEMINI.md      →  ~/.gemini/GEMINI.md
      settings.json  →  ~/.gemini/settings.json
      agents/        →  ~/.gemini/agents/
```

To remove symlinks for a package:
```bash
stow -D tmux
```

To simulate what stow would do without making changes:
```bash
stow -n -v tmux
```

If stow reports a conflict, the target file already exists. Back it up and remove it first:
```bash
mv ~/.tmux.conf ~/.tmux.conf.bak
stow tmux
```
