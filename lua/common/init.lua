-- keymap config
require('common.keymaps')

-- options settings --
local v_opt = vim.opt

local v_options = {
  -- editor settings --
  cmdheight = 2,
  cursorline = true,
  completeopt = { 'menuone', 'noselect' },
  expandtab = true, -- convert tab to space
  hlsearch = true,
  mouse = 'a',
  ignorecase = true,
  number = true,
  numberwidth = 4,
  pumheight = 10,
  relativenumber = true,
  showtabline = 2,
  shiftwidth = 2,
  softtabstop = 0,
  scrolloff = 8,
  sidescrolloff = 8,
  showmode = false,
  smartcase = true, -- smartcase
  smarttab = true,
  smartindent = true, -- make indenting smarter again
  splitbelow = true,
  splitright = true,
  tabstop = 4,
  wrap = false,
  -- editorsettings --
  -- files settings
  backup = false, -- create backup files
  clipboard = "unnamedplus",
  conceallevel = 0,
  fileencoding = 'utf-8',
  swapfile = false, -- create swapfiles
  undofile = true,
  writebackup = false,
  termguicolors = true,
  timeoutlen = 0,
  -- files settings --
}
-- colorscheme
vim.cmd [[colorscheme carbonfox]]
vim.opt.shortmess:append "c"
vim.g.cursorhold_updatetime = 100

for k, v in pairs(v_options) do
  v_opt[k] = v
end
-- options settings --

-- cmd settings --
local v_cmd = vim.cmd
v_cmd "set whichwrap+=<,>,[,],h,l"
v_cmd [[set iskeyword+=-]]
-- cmd settings --
