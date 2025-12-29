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
*   **Editor:** [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter), [Auto-pairs](https://github.com/windwp/nvim-autopairs), [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim).
*   **IDE Features:** LSP (Language Server Protocol), [Blink.cmp](https://github.com/Saghen/blink.cmp) (Completion), [Conform](https://github.com/stevearc/conform.nvim) (Formatting), [nvim-lint](https://github.com/mfussenegger/nvim-lint) (Linting).
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

### LSP (Language Server Protocol)
*   `grd`: Go to **Definition**.
*   `grr`: Go to **References**.
*   `gri`: Go to **Implementation**.
*   `grt`: Go to **Type Definition**.
*   `grn`: **Rename** symbol.
*   `gra`: **Code Action**.
*   `gO`: Open **Document Symbols** (Outline).
*   `<leader>th`: Toggle **Inlay Hints**.
*   `<leader>f`: **Format** Buffer.

### Debugging (DAP)
*   `<F5>`: **Start/Continue** Debugging.
*   `<F1>`: Step **Into**.
*   `<F2>`: Step **Over**.
*   `<F3>`: Step **Out**.
*   `<leader>dt`: Toggle **Breakpoint**.
*   `<leader>dT`: Set **Conditional Breakpoint**.
*   `<F7>`: Toggle **Debugger UI**.

*(Tip: Press `<Space>` and wait a second to see a menu of all available `<leader>` keymaps via `which-key`.)*

## Structure

*   `init.lua`: Core configuration and plugin list.
*   `lua/kickstart/`: Modularized configurations for specific tools (LSP, Debug, etc.).
*   `lua/custom/plugins/`: Your added plugin configurations.

## Requirements

*   Neovim >= 0.10.0
*   Nerd Font (required for icons).
*   Rippergrep (`rg`) for Telescope grep.
*   Git and C compiler (for Treesitter).

## Workflow Guide & Tips

To get the most out of this configuration, try to adapt your workflow to these patterns:

### 1. Movement: Stop holding `hjkl`
*   **Short distances:** Use standard `w`, `b`, `f`, `t`.
*   **Medium/Long distances (On Screen):** Press `s` (**Flash**). You'll see labels on every word. Type the label character to jump instantly. It's faster than mouse or repeated `j`/`k`.
*   **Between buffers:** Instead of cycling with `Shift-h/l`, try `gb` (**Snipe**). It uses valid home-row keys to jump directly to the buffer you want.

### 2. Navigation: Fuzzy Find First
*   **Opening Files:** Habituate yourself to `<space>sf` (Search Files). It's faster than browsing the tree.
*   **Searching Code:** Use `<space>sg` (Grep) to find text across the whole project.
*   **Overview:** Use `<space>a` (**Aerial**) to see the "Table of Contents" of your code (functions, classes) and jump around.

### 3. Diagnostics & Fixing
*   **Don't hunt for errors:** If you see red, press `<space>xx` (**Trouble**). It gives you a nice list of every error in the project.
*   **Fixing things:**
    *   Cursor on error -> `gra` (Code Action) to see quick fixes.
    *   Cursor on variable -> `grn` (Rename) to rename it safely across all files.
*   **C++ Tip:** If you see "too many errors emitted", it means `clangd` doesn't know how to compile your project. Run `cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON .` in your build folder to generate a `compile_commands.json` file.

### 4. Terminal Management
*   **Don't alt-tab:** Need to run a quick command or build? Press `<C-t>`. It pops up a floating terminal. Do your thing, press `<C-t>` again to hide it. It stays running in the background.

### 5. Session Flow
*   **Resume where you left off:** When you open Neovim in a project folder, press `<space>qs` to restore your windows and files exactly as they were last time.

### 6. Dev Container Usage
If you work in a Docker/Dev Container environment, run Neovim **inside** the container to ensure the LSP can find all dependencies and headers.
*   **Map your config:** Add a bind mount to your `devcontainer.json` so you can use your host's Neovim configuration inside the container:
    ```json
    "mounts": [
      "source=${localEnv:HOME}/.config/nvim,target=/root/.config/nvim,type=bind"
    ]
    ```
    *(Adjust `target` if your container user is not root, e.g., `/home/vscode/.config/nvim`)*.
*   **Run it:** Use the `devcontainer` CLI to execute Neovim:
    ```bash
    devcontainer exec --workspace-folder . nvim .
    ```