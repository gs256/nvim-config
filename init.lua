-- Sets

vim.opt.scrolloff = 8
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- ignore case when searching
vim.opt.ignorecase = true

vim.g.mapleader = " "


-- Remaps

vim.keymap.set('n', '<S-h>', ':tabprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-l>', ':tabnext<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })

vim.keymap.set('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true, silent = true })


-- Bootstrap and setup lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
  spec = {
    { "navarasu/onedark.nvim", lazy = false, priority = 1000 },
    { 'numToStr/Comment.nvim' },
  },
  install = { colorscheme = { "onedark" } },
  checker = { enabled = true },
})


-- Plugins config and startup

require("onedark").setup({ style = "darker" })
require("onedark").load()

require("Comment").setup({
  toggler = {
      line = "<C-_>",
  },
  opleader = {
      line = "<C-_>",
  },
})

