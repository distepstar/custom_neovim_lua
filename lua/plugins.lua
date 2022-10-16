local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim"
  vim.cmd [[packadd packer.nvim]]
end

-- Auto reload neovim after plugins config changed
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Protected call to prevent error on start
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end


-- Pop up window for packer
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = "rounded" }
    end,
  }
}

-- Plugin install
return packer.startup(function(use)
  -- colorscheme
  use {
    'olivercederborg/poimandres.nvim',
    config = function()
      require('poimandres').setup {
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
      }
    end
  }
  use "EdenEast/nightfox.nvim"
  -- neodev for lua configuration
  use "folke/neodev.nvim"
  -- packer
  use 'wbthomason/packer.nvim'
  -- LSP
  use { "williamboman/nvim-lsp-installer", "neovim/nvim-lspconfig", }
  -- null-ls
  use { "jose-elias-alvarez/null-ls.nvim" }
  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  -- comment
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  -- plenary
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"
  -- illuminate
  use "RRethy/vim-illuminate"
  -- telescope
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- nvim tree
  use { 'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    tag = 'nightly'
  }
  -- which key
  use { "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- leave it empty to use the default settings
      }
    end
  }
  use { "antoinemadec/FixCursorHold.nvim" }
  -- friendly-snippets
  use "rafamadriz/friendly-snippets"
  -- cmp
  use { 'hrsh7th/nvim-cmp' }
  use({ "hrsh7th/cmp-buffer" }) -- buffer completions
  use({ "hrsh7th/cmp-path" }) -- path completions
  use({ "saadparwaiz1/cmp_luasnip" })
  use({ "hrsh7th/cmp-nvim-lsp" })
  use { 'L3MON4D3/LuaSnip' }
  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- start menu
  use { 'goolord/alpha-nvim' }
  -- bufferline
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
  use "tiagovla/scope.nvim"
  -- autopairs
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }


  -- bootstrap
  if PACKER_BOOSTRAP then
    require("packer").sync()
  end
end)
