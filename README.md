# Neovim Configuration

This is a customized Neovim configuration based on [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). It aims to provide a modern, feature-rich development environment with a focus on usability and aesthetics.

## Installation

1.  Clone this repository to your config directory:
    ```bash
    git clone <your-repo-url> ~/.config/nvim
    ```

2.  Start Neovim:
    ```bash
    nvim
    ```
    The plugin manager (`lazy.nvim`) will automatically bootstrap and install all plugins.

## Key Features & Plugins

*   **UI:** [Tokyo Night](https://github.com/folke/tokyonight.nvim), [Alpha](https://github.com/goolord/alpha-nvim) (Dashboard), [Lualine](https://github.com/nvim-lualine/lualine.nvim) (Status Line), [Bufferline](https://github.com/akinsho/bufferline.nvim) (Tabs), [Noice](https://github.com/folke/noice.nvim) (Modern UI).
*   **Navigation:**
    *   [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) (File Explorer).
    *   [Telescope](https://github.com/nvim-telescope/telescope.nvim) (Fuzzy Finder).
    *   [Flash](https://github.com/folke/flash.nvim) (On-screen Jumping).
    *   [Aerial](https://github.com/stevearc/aerial.nvim) (Code Outline).
    *   [Trouble](https://github.com/folke/trouble.nvim) (Diagnostics & References List).
    *   [Snipe](https://github.com/leath-dub/snipe.nvim) (Fast Buffer Jumping).
    *   [Spelunk](https://github.com/EvWilson/spelunk.nvim) (Mark Stack).
*   **Session Management:** [Persistence](https://github.com/folke/persistence.nvim) (Auto-save/restore sessions).
*   **Editor:** [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter), [Auto-pairs](https://github.com/windwp/nvim-autopairs), [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim), [Context](https://github.com/nvim-treesitter/nvim-treesitter-context) (Sticky headers).
*   **IDE Features:** LSP, [Blink.cmp](https://github.com/Saghen/blink.cmp) (Completion), [Conform](https://github.com/stevearc/conform.nvim) (Formatting), [nvim-lint](https://github.com/mfussenegger/nvim-lint) (Linting), [Refactoring.nvim](https://github.com/ThePrimeagen/refactoring.nvim).
*   **Languages:** Support for Lua, C/C++, Rust, Python, Go, JS/TS, HTML/CSS, Bash, Docker, CMake, and more.
*   **Debugging:** [nvim-dap](https://github.com/mfussenegger/nvim-dap) with UI and adapter support for Go, Python, C++, and Rust.

## Keybindings Cheat Sheet

### General & UI
*   `<Space>`: **Leader Key**.
*   `\`: Toggle **File Explorer** (Neo-tree).
*   `<Esc>`: Clear search highlights.
*   `<leader>nd`: **Dismiss All Notifications** (Popups).
*   `<leader>q`: Open diagnostic **Quickfix list**.

### Buffer & Session Management
*   `<S-h>` (Shift + h): Go to **Previous Buffer**.
*   `<S-l>` (Shift + l): Go to **Next Buffer**.
*   `<leader>bd`: **Close** current buffer.
*   `gb`: **Snipe** (Fast jump to any open buffer).
*   `<leader>qs`: **Restore Session** (Current project).
*   `<leader>ql`: **Restore Last Session**.

### Code Navigation & Discovery
*   `s`: **Flash Jump** (Jump to any word on screen).
*   `S`: **Flash Treesitter** (Select code block).
*   `<leader>a`: Toggle **Aerial** (Code Outline/Structure).
*   `<leader>xx`: Toggle **Trouble** (Project Diagnostics).
*   `<leader>xX`: Toggle **Buffer Diagnostics**.
*   `<leader>cs`: Toggle **Symbols** (Trouble).
*   `<leader>cl`: Toggle **LSP Definitions/Refs** (Trouble).

### Fuzzy Finder (Telescope)
*   `<leader>sf`: Search **Files**.
*   `<leader>sg`: Search by **Grep** (global search).
*   `<leader>sw`: Search current **Word**.
*   `<leader>s.`: Search **Recent Files**.
*   `<leader><leader>`: Search **Open Buffers**.
*   `<leader>sn`: Search **Neovim Config** files.
*   `<leader>sh`: Search **Help** documentation.
*   `<leader>sk`: Search **Keymaps**.
*   `<leader>/`: Fuzzily search in **Current Buffer**.

### Terminal (ToggleTerm)
*   `<C-t>`: **Toggle Terminal** (Last used mode).
*   `<leader>tt`: Toggle **Floating** Terminal.
*   `<leader>tv`: Toggle **Vertical** Terminal.
*   `<leader>tH`: Toggle **Horizontal** Terminal.

### LSP & Refactoring
*   `grd`: Go to **Definition**.
*   `grr`: Go to **References**.
*   `gri`: Go to **Implementation**.
*   `grn`: **Rename** symbol.
*   `gra`: **Code Action**.
*   `<leader>ci`: **Incoming Calls** (Who calls this?).
*   `<leader>co`: **Outgoing Calls** (What does this call?).
*   `<leader>re` (Visual): **Extract Function**.
*   `<leader>rv` (Visual): **Extract Variable**.
*   `<leader>ri` (Normal): **Inline Variable**.
*   `<leader>f`: **Format** Buffer.

### Debugging (DAP)
*   `<F5>`: **Start/Continue** Debugging.
*   `<F1>`: Step **Into**.
*   `<F2>`: Step **Over**.
*   `<F3>`: Step **Out**.
*   `<leader>dt`: Toggle **Breakpoint**.
*   `<leader>dT`: Set **Conditional Breakpoint**.
*   `<F7>`: Toggle **Debugger UI**.

## Workflow Guide & Tips

To get the most out of this configuration, try to adapt your workflow to these patterns:

### 1. Hardcore C++ Debugging (Mutex/OOM/UB)
*   **Static Analysis:** `clang-tidy` is enabled by default. If you see warnings about "concurrency" or "bugprone", fix them immediately. They often point to UB or race conditions.
*   **Finding Contention:** Put your cursor on a mutex or shared variable and press `<leader>ci` (Incoming Calls). This shows you every function that touches that mutex, making it easy to map out the lock order and find deadlocks.
*   **Out of Memory:** Use the Debugger (`<F5>`). While debugging, use the DAP UI (`<F7>`) to inspect variables and memory state.
*   **Refactoring for Decoupling:** Use Visual Mode to select a chunk of code and press `<leader>re` to extract it to a function. This is the first step in breaking up "God Classes" and tightly coupled logic.

### 2. Movement & Navigation
*   **Medium/Long distances (On Screen):** Press `s` (**Flash**). You'll see labels on every word. Type the label character to jump instantly.
*   **Between buffers:** Try `gb` (**Snipe**) to jump directly to any open buffer.
*   **Sticky Context:** Look at the top of your screen as you scroll—the current function/class header will "stick" there so you always know where you are.

### 3. Build & Diagnostics
*   **C++ Fix:** If you see "too many errors emitted", it means `clangd` doesn't know how to compile your project. Run `cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON .` in your build folder to generate a `compile_commands.json` file.
*   **Trouble:** Press `<space>xx` to see a project-wide list of errors. Much better than scrolling and looking for red squiggles.

### 4. Dev Container Usage
If you work in a Docker/Dev Container environment, run Neovim **inside** the container to ensure the LSP can find all dependencies and headers.
*   **Map your config:** Add a bind mount to your `devcontainer.json`:
    ```json
    "source"="${localEnv:HOME}/.config/nvim,target=/root/.config/nvim,type=bind"
    ```
*   **Run it:** Use `devcontainer exec --workspace-folder . nvim .`

### 5. Terminal Management
*   **Don't alt-tab:** Press `<C-t>` to pop up a floating terminal. Do your thing, press `<C-t>` again to hide it. It stays running in the background.
