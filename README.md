# Customized Neovim with Lua
<p align="center">
  <img alt="Customized Neovim in React Typescript" width=900 src="https://i.postimg.cc/K8MYmgYR/react-example.png">
</p>

Use __Lua__ to configure the settings for text editor __Neovim__, injected modern editor functions like:
  - Code Completion
  - Language Server
  - Error Detection
  - Auto Formatting
  - File Searching
# General Purpose
The main use of this neovim setting is building for __Web Development__ (e.g. React.JS, Vue.JS, etc...).<br/>
However, you can basically write any languages you want thanks to __LSP Installer__.

<p align="center">
  <img alt="Menu" width=900 src="https://i.postimg.cc/8P358bN2/menu.png">
</p>

<p align="center">
  <img alt="LSP Supported Languages" width=900 src="https://i.postimg.cc/bv1d92XK/lspinstall.png">
</p>

<p align="center">
  <img alt="Telescope" width=900 src="https://i.postimg.cc/7YT4zrrR/telescope.png">
</p>

<p align="center">
  <img alt="Which-key" width=900 src="https://i.postimg.cc/9MM5FvBJ/which-key.png">
</p>

# Requirements
In order to apply the settings, you need to fulfill the requirement shown below:
  - Any operating systems that can install Neovim
  - [Neovim latest stable release](https://neovim.io/)
  - Python3 Provider
  - Node.js Provider

# Quickstart
1. Clone the repository.
```python
# Make sure you installed Neovim 0.8+ before cloning the repository.
git clone https://github.com/distepstar/custom_neovim_lua.git
```
2. Copy all the files to:
```python
# For Windows user
C:/User/<user_name>/AppData/Local/nvim/

# For MacOS / Linux user
~/.config/nvim/
```
3. Launch Neovim in termainl, LSP will setup the configuration automatically.
```python
nvim example.py
```
or
You can install the missing language server libraries after opened Neovim.
```python
# For checking the languages that LSP Support
:LspInstallInfo

# For language installation
:LspInstall language_name
```

You can also visit [LspConfig](https://github.com/neovim/nvim-lspconfig) for more details about the configuration that LSP support. The current settings may only satisfied my personal need, feel free to use it as a template if you want to install other plugins (e.g. debugger, colorscheme, popup terminal, etc...), I will mark down the file structure below.

# File Structure
```python
# > : __Root__, |-> : __Directory__, |-- : __File__

> nvim #config path
|-> lua
  |-> common # for basic vim configuration like keymaps
    |-- init.lua
    |-- keymaps.lua
  |-> lsp # lsp configuration
    |-> settings # custom language settings
      |-- name_of_language.lua # e.g. javascript.lua
    |-- config.lua # LspInstaller and language servers setup
    |-- handlers.lua # diagnostic, Lsp keybinds
    |-- init.lua # lsp settings import
    |-- null-ls.lua # formatter
  |-> nvimtree # nvim tree configuration
    |-- init.lua # configuration for nvimtree
  |-> treesitter # syntax highlighter
    |-- autopair_config.lua # autopair configuration
    |-- init.lua
  |-- alpha_nvim_config.lua # neovim dashboard
  |-- bufferline_config.lua # tab bar and buffer
  |-- completions.lua # cmp, autocomplete plugin
  |-- lualine_config.lua # status line in lua
  |-- neodev_config.lua # neovim dev
  |-- plugins.lua # packer, plugins installation file, put all the plugins install path here
|-> plugin
  |-- packer_compiled.lua # don't need to modify this file, the Packer plugin will handle all the changes automatically
|-- init.lua # plugin settings file import
```

# Keybinds
This setting has installed the __Which-Key__ plugin, I registered the most frequently used key binds into it so don't worry about the difficulty of learning all the keybinds. You can also change the `keymaps.lua` file in `/nvim/lua/common/` to change the key binds according to your practice.

1. Normal mode

| Key | Action |
| :--- | :---: |
| Space | Leader key |
| Space-e | Nvim Tree Toggle |
| Space-f | Telescope commands |
| Space-l | Lsp commands |
| Space-q | Close current buffer |
| Ctrl-h, j, k, l | Move between windows |
| Ctrl-Arrow-Up, Down, Left, Right | Resize Window |
| Shift-h, l | Move between buffers(tabs) |
| Alt-j, k | Move current line up and down |

2. Visual mode

| Key | Action |
| :--- | :---: |
| Shift-H, L | Move current line left and right |
| Alt-j, k | Move current line up and down |
| p | Paste from register |

3. Visual block mode

| Key | Action |
| :--- | :---: |
| J, K | Move current block up and down |

# Plugins
These are the plugins that I used for the neovim settings of the current repository, if you wanted to build your own Neovim with Lua, you can take it as a reference  depending on your needs.

1. Core
    -  Packer - [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim)
    -  Plenary - [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
    -  Lsp Installer - [williamboman/nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)
    -  Lsp Config - [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
    -  LuaSnip - [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)
    -  Lualine - [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
    -  Null-ls - [jose-elias-alvarez/null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
    -  Nvim-Treesitter - [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
    -  Nvim-cmp [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
       - Cmp-buffer [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
       - Cmp-path [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)
       - Cmp-nvim-lsp [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
       - Cmp-luasnip [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
    -  Popup - [nvim-lua/popup.nvim](https://github.com/nvim-lua/popup.nvim)

2. Layout
    -  Alpha-Nvim - [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim)
    -  Bufferline - [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
    -  Scope.nvim - [tiagovla/scope.nvim](https://github.com/tiagovla/scope.nvim)
    -  Nvim-Tree - [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
    -  Nvim-Tree-Webdev-Icon - [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-tree.lua)
    -  Which-Key - [folke/which-key.nvim](https://github.com/folke/which-key.nvim)

3. Useful tools
    -  Autopair - [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)
    -  Comment.nvim - [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)
    -  nvim-ts-context-commentstring - [JoosepAlviste/nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)
    -  telescope-fzf-native.nvim - [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
    -  Illuminate - [RRethy/vim-illuminate](https://github.com/RRethy/vim-illuminate)
    -  Friendly Snippets - [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
