-- declare keymap
local function keymap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- leader key -- 
keymap("", "<Space>", '<cmd>lua require("which-key").show(" ", {mode = "n", auto = true})<cr>')
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- leader key -- 


-- normal --
-- which-key registering
local wk = require('which-key')

wk.register({
  ["<leader>"] = {
    -- Telescope
    f = {
      name = "Telescope",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      b = { "<cmd>Telescope buffers<cr>", "Open Buffer File" },
      n = { "<cmd>enew<cr>", "New File" },
    },
    -- nvimtree
    e = { "<cmd>NvimTreeToggle<cr>", "Open Explorer" },
    q = { "<cmd>bdelete<cr>", "Close Tab"},
    -- bufferline
    b = {
      name = "Bufferline",
      h = { "<cmd>h bufferline-configuration<cr>", "Configuration" },
    },
  },
})
-- navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>")
keymap("n", "<C-Down>", ":resize +2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>")
keymap("n", "<S-h>", ":bprevious<CR>")
-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>")
keymap("n", "<A-k>", "<Esc>:m .-2<CR>")
-- normal --

-- visual --
-- Stay in indent mode
keymap("v", "H", "<gv")
keymap("v", "L", ">gv")

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==")
keymap("v", "<A-k>", ":m .-2<CR>==")
keymap("v", "p", '"_dP')
-- visual --

-- visual block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv")
keymap("x", "K", ":move '<-2<CR>gv-gv")
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv")
-- visual block --
