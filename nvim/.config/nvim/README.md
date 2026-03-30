# 🚀 Neovim Quickstart Guide

Welcome back to your Neovim setup! This configuration is built on `lazy.nvim` as the plugin manager and utilizes powerful tools like Telescope, LSP, Treesitter, and Neo-tree.

## 🌟 The Golden Rules
1. **The Leader Key is `<Space>`**. This is the starting point for most of your custom commands.
2. **When in doubt, press `<Space>` and wait.** You have `which-key.nvim` installed. If you press the leader key and pause for a fraction of a second, a popup will appear at the bottom of the screen showing you all available key combinations.
3. **Escape Insert Mode:** Instead of stretching for `<Esc>`, you have mapped `jj` in insert mode to quickly return to normal mode. Pressing `<Esc>` in normal mode will clear your search highlights.

---

## 📁 1. File & Project Navigation

### The Dashboard (Snacks)
When you open Neovim by typing just `nvim` in your terminal (without a `.`), you will be greeted by the Snacks dashboard.
- This displays your **most recently opened files** across the project and system.
- You can simply type the number (`0`, `1`, `2`, etc.) next to a file to instantly open it, bypassing the file tree completely.

### The File Tree (Neo-tree)
You are using Neo-tree to browse your file system (opens on the **right**). 
- **Open / Close (Toggle) the file tree:** Press `<Space> + n`. 
- **Alternative Close:** While your cursor is inside the Neo-tree window, you can also just press `q` to close it.

### Buffer (Tab) Navigation & Management
In Neovim, the "tabs" at the top of your screen are actually open files called "Buffers".
- `Shift + l` (or uppercase `L`): Go to the **next** tab (right).
- `Shift + h` (or uppercase `H`): Go to the **previous** tab (left).
- `<Space> + b + d`: **Close** the current buffer safely without breaking the window layout.

### 🪄 Auto-Save
You no longer need to spam `:w`! This configuration features PyCharm-like automatic saving.
Your file will instantly auto-save whenever you:
- Leave Insert Mode (e.g. hitting `jj` or `Esc`)
- Switch to a different tab or Neovim split
- Lose focus on the terminal window

### Fuzzy Finding (Telescope)
Telescope is your primary way to jump around your project quickly without using the file tree.
- `<Space> + s + f`: **S**earch **F**iles (Find files by name)
- `<Space> + s + g`: **S**earch by **G**rep (Search for text/code *inside* all files)
- `<Space> + <Space>`: Find existing/open buffers (tabs)
- `<Space> + /`: Fuzzily search for text within your *current* file.
- `<Space> + s + w`: **S**earch current **W**ord (Searches the whole project for the word currently under your cursor)
- `<Space> + g + o`: **G**it **O**pen all modified files (Instantly loads all modified, staged, and untracked files into buffers/tabs, similar to opening a changelist in PyCharm).

---

## 💻 2. Writing & Editing Code

### Commenting Code (Native Neovim)
You use Neovim's native commenting features (introduced in Neovim v0.10). It automatically detects the language and applies the correct comment syntax (e.g., `//` vs `#`).
- `gcc`: Comment or uncomment the current line.
- `gc` + `motion`: Comment a specific block (e.g., `gc4j` to comment the next 4 lines).
- **Visual Mode**: Highlight lines in visual mode (`v` or `V`) and press `gc` to comment them all.

### Collapsing/Folding Code (Treesitter)
Your code folding is powered by Treesitter, meaning it intelligently folds based on functions, classes, and loops rather than just indentation.
- `zc`: **C**lose the fold under the cursor.
- `zo`: **O**pen the fold under the cursor.
- `za`: Toggle the fold under the cursor.
- `zM`: Close **all** folds in the file.
- `zR`: Open **all** folds in the file.

---

## 🪟 3. Window Splits & Tmux Navigation

By default, new splits will open to the right (`:vsplit`) and below (`:split`).

### Neovim Splits
You have custom keybinds to smoothly move your cursor between Neovim splits without needing the standard `Ctrl-w` prefix:
- `Ctrl + h`: Move left
- `Ctrl + l`: Move right
- `Ctrl + j`: Move down
- `Ctrl + k`: Move up

### Tmux Navigation
Your Tmux prefix is heavily customized.
- **Tmux Prefix:** `Ctrl + a` (You unbound the default `Ctrl-b`).
- **Moving between Tmux Panes:** `Ctrl + a` followed by standard vim keys (`h`, `j`, `k`, `l`).
  - Example: `Ctrl + a`, then `h` to move to the left Tmux pane.
- **Reload Tmux config:** `Ctrl + a`, then `r`.
- *Note: Your Tmux has mouse support enabled, so you can also just click panes or scroll.*

---

## 🧠 4. Language Servers (LSP) & Mason

### How Mason Works
Mason (`:Mason`) is your package manager for external language tools (Language Servers, formatters, and linters).
- Your setup automatically detects and installs Language Servers for nearly all major languages (Python, Go, Rust, C/C++, Web/TS, Docker, Terraform, SQL, Java, Ruby, PHP, etc.) the moment you open a relevant file.
- Formatters and linters (like `prettier`, `stylua`, `ruff`, `golangci-lint`) are also guaranteed via `mason-tool-installer`.
- **To manage tools:** Type `:Mason` in command mode. Press `g?` for keybindings.

### LSP Keybindings
When you are in a file supported by an LSP (like Python or Go), these keys unlock IDE-like features:
- `gd`: **G**o to **D**efinition (Jumps to where the function/variable is defined. Use `Ctrl + t` to jump back).
- `gr`: **G**o to **R**eferences (Opens Telescope to show everywhere this symbol is used).
- `K`: Hover Documentation (Shows tooltips, parameters, and docstrings for the code under your cursor).
- `<Space> + r + n`: **R**e**n**ame (Renames the variable/function across the whole project).
- `<Space> + c + a`: **C**ode **A**ction (Fixes errors, auto-imports, etc.).

### Diagnostics (Errors & Warnings)
- `[d`: Go to the previous error/warning.
- `]d`: Go to the next error/warning.
- `<Space> + e`: Show a floating popup explaining the current error under the cursor.

---

## 🐞 5. Debugging (DAP)

You have a fully configured Debug Adapter Protocol (DAP) setup with a beautiful UI and a custom Extensible Environment Runner that automatically loads local `.env` files and overrides variables for Docker-less local testing (e.g., forcing `DB_HOSTNAME=localhost`).

### Using the Debugger
Your configuration automatically detects your filetype (Python or Go) and routes to the correct debugger.
- `<leader>dt`: **D**ebug **T**est (Runs the method/function under your cursor).
- `<leader>dc`: **D**ebug **C**lass (Runs the entire class, Python primarily).
- `<F5>`: Start or Continue debugging.
- `<F1>`: Step Into.
- `<F2>`: Step Over.
- `<F3>`: Step Out.
- `<leader>b`: Toggle Breakpoint.
- `<leader>B`: Set Conditional Breakpoint.
- `<F7>`: Toggle DAP UI (Useful to see previous session output on unhandled crashes).

### How to Add a New Debugger
If you start working in a new language (e.g., Node/TS), follow these steps to add debugger support:
1. **Find the DAP Adapter:** Find the relevant `nvim-dap` plugin (e.g., `mxsdev/nvim-dap-vscode-js`).
2. **Add to dependencies:** Open `lua/plugins/debugging.lua` and add it to the `dependencies` block.
3. **Add to Extensible Runner:** Inside the `run_debug_test(target)` function, add an `elseif filetype == "your_language"` block that triggers the specific adapter's test runner.

---

## 🧪 7. Testing (Neotest)

You have the industry standard `neotest` plugin installed for seamless test running and output visualization. It shares the same Extensible Environment Runner as the debugger, so `.env` files are automatically loaded.

### Using the Test Runner
- `<leader>tr`: **T**est **R**un Nearest (Runs the test your cursor is currently inside).
- `<leader>tf`: **T**est **F**ile (Runs every test in the current file).
- `<leader>ts`: **T**est **S**ummary (Opens a 60-column wide side panel showing a tree of all tests and their pass/fail status).
- `<leader>tp`: **T**est **P**anel (Opens a persistent terminal split at the bottom streaming the full standard output and tracebacks of your tests).
- `<leader>to`: **T**est **O**utput (Opens a quick hover window to see the output/error for the test under your cursor).
- `<leader>ta`: **T**est **A**ttach (Attaches to the running test, useful for debugging realtime output).
- `o`: Pressing this inside the Summary (`<leader>ts`) tree will pop open the specific output for that one test.

### How to Add a New Test Runner
1. **Find the Neotest Adapter:** Search for the neotest adapter (e.g., `neotest-rust` or `neotest-jest`).
2. **Add to dependencies:** Open `lua/plugins/testing.lua` and add the github repo to the `dependencies` list.
3. **Enable Adapter:** In the `neotest.setup({ adapters = { ... } })` block, add a `require("your-new-adapter")({})` line.

---

## 💻 7. Terminal

You have a floating terminal powered by Snacks.

- `<Space> + ;`: **Toggle** the terminal open/closed.
- `Esc Esc`: Close the terminal from within it.

---

## 🌿 8. Git Integration (LazyGit) & Conflict Resolution

You have LazyGit integrated via Snacks, alongside `git-conflict.nvim` for resolving merge conflicts natively in your editor.

### Using LazyGit
- **Open LazyGit:** `<Space> + g + g`
- **Open current file in GitHub:** `<Space> + g + b`
- This opens a full-screen floating window. Inside LazyGit:
  - `Space`: Stage / Unstage a file or line.
  - `c`: Commit (opens a prompt for your message).
  - `P`: Push to remote.
  - `p`: Pull from remote.
  - `q`: Quit LazyGit and return to Neovim.

### ⚔️ Resolving Merge Conflicts

When you hit a merge conflict (e.g., during a `git pull` or `git merge`), you have a very fast, VS Code-like inline resolution workflow combining LazyGit and Neovim:

1. **Spot the Conflict in LazyGit:** Open LazyGit (`<Space> + g + g`). Conflicted files will show up under the "Files" section in red.
2. **Open the File in Neovim:** Select the conflicted file and press `e` (Edit). This will drop you out of LazyGit and open the file directly in Neovim.
3. **Navigate & Resolve (git-conflict.nvim):** The conflicted sections will be highlighted in bright colors.
   - `]x` : Jump to the **next** conflict.
   - `[x` : Jump to the **previous** conflict.
   - `co` : Choose **Ours** (current branch).
   - `ct` : Choose **Theirs** (incoming branch).
   - `cb` : Choose **Both**.
   - `c0` : Choose **None** (clears the conflict markers so you can manually rewrite it).
4. **Save & Finish:** Once all conflicts in the file are resolved, save it (`:w`), and jump back into LazyGit (`<Space> + g + g`).
5. **Stage:** In LazyGit, press `Space` on the resolved file to stage it.
6. **Complete the Merge:** Press `c` to commit and finalize the merge!

---

## 📝 9. Markdown Rendering

You have `render-markdown.nvim` installed, which completely transforms how Markdown files look *inside* Neovim without needing an external browser.

- **How it works:** It dynamically hides raw markdown syntax (like `#`, `*`, `>`) while you are not editing that line, and replaces them with clean visual elements, beautiful headings, visual checkboxes (`[ ]` to `󰄱`), and proper bullet points.
- **Toggle View:** If you need to see the raw, underlying syntax everywhere to edit something complex, simply press `<Space> + t + m` (**T**oggle **M**arkdown) to turn the rendering off and on.

## 🤖 10. AI Assistance (GitHub Copilot)

You have the lightweight, pure-Lua GitHub Copilot plugin (`zbirenbaum/copilot.lua`) installed for seamless VS Code-like inline suggestions.

- **Authentication:** Run `:Copilot auth` to log in for the first time.
- `<Tab>`: **Accept** the current inline suggestion.
- `<Alt-]>` (or `<Option-]>`): Cycle to the **next** suggestion.
- `<Alt-[>` (or `<Option-[>`): Cycle to the **previous** suggestion.
- `<Ctrl-]>`: **Dismiss** the suggestion.
