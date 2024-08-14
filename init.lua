vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Enable line numbers by default
vim.opt.number = true

-- Enable relative line numbers by default
-- vim.opt.relativenumber = true

-- Set tab width vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Enable syntax highlighting
vim.cmd('syntax on')

-- Enable auto-indentation
vim.cmd('filetype plugin indent on')

-- Set clipboard to use system clipboard
vim.opt.clipboard = 'unnamedplus'

-- Set a better status line
vim.opt.laststatus = 2

-- Set color scheme
-- vim.cmd('colorscheme desert')
-- vim.cmd('colorscheme elflord')
-- vim.cmd('colorscheme evening')
-- vim.cmd('colorscheme industry')
-- vim.cmd('colorscheme desert')
-- vim.cmd('colorscheme desert')

-- Remove M characters 
vim.cmd [[command! RemoveM %s/\r//g]]

-- Packer configuration
vim.cmd [[packadd packer.nvim]]

-- Define autocmd to set nonumber and norelativenumber in terminal buffers
vim.cmd([[
  augroup TerminalSettings
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
  augroup END
]])

-- Map Escape in terminal to exit terminal mode
vim.cmd('tnoremap <Esc> <C-\\><C-n>')

-- Auto change directory to current file's directory when opening a buffer
vim.cmd([[
  autocmd BufEnter,BufWinEnter * lcd %:p:h
]])

-- Define a custom command to split and open terminal
vim.cmd [[command! SplitTerm split | terminal | startinsert]]
vim.cmd[[
  command! SplitTerm call StartSplitTerm()
  function! StartSplitTerm()
    split
    terminal bash 
    startinsert
  endfunction
]]

-- Load plugins using Packer
require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-commentary'
  use 'b3nj5m1n/kommentary'    
  use 'preservim/nerdtree'
  -- use 'tanvirtin/monokai.nvim'
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }}
  -- install without yarn or npm
  -- use({
  --   "iamcco/markdown-preview.nvim",
  --   run = function() vim.fn["mkdp#util#install"]() end,
  -- })

  -- use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
end)

local custom_gruvbox = require'lualine.themes.gruvbox'

-- Change the background of lualine_c section for normal mode
custom_gruvbox.normal.c.bg = '#112233'

require('lualine').setup {
  options = { theme  = custom_gruvbox },
}
-- require('monokai').setup {}
-- require('monokai').setup { palette = require('monokai').pro }
-- require('monokai').setup { palette = require('monokai').soda }
-- require('monokai').setup { palette = require('monokai').ristretto }
