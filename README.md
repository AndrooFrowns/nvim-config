# Neovim configuration

symlink this dir to ~/.config/nvim to use it

The nix home config I use _should_ pull this config automatically

To launch this directly from this folder for testing use:

```bash
nvim --cmd "set rtp+=$(dirname /path/to/your/nvim-config/init.lua)" -u /path/to/your/nvim-config/init.lua .
````
