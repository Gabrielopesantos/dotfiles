local function set_augroup()
  vim.api.nvim_command("augroup WrapInMarkdown")
  vim.api.nvim_command("autocmd!")
  vim.api.nvim_command("autocmd FileType markdown setlocal wrap")
  vim.api.nvim_command("augroup END")
end

local function set_vim_g()
  vim.g.mapleader = " "
end

local function set_vim_o()
  local settings = {
    backup = false,
    errorbells = false,
    expandtab = true,
    hidden = true,
    scrolloff = 8,
    softtabstop = 4,
    showmode = false,
    termguicolors = true
  }

  -- Generic vim.o
  for k, v in pairs(settings) do
    vim.o[k] = v
  end

  -- Custom vim.o
  vim.o.clipboard = 'unnamedplus'
  vim.o.shortmess = vim.o.shortmess .. 'c'

  -- Not yet in vim.o (Some of these might be already)
  vim.cmd('set encoding=utf8')
  vim.cmd('set nowritebackup')
  vim.cmd('set shiftwidth=4')
  vim.cmd('set secure')
  vim.cmd('set splitright')
  vim.cmd('set tabstop=4')
  vim.cmd('set updatetime=300')
  vim.cmd('set colorcolumn=80')
  vim.cmd('set list')
  vim.cmd('set mouse=a')
  vim.cmd('set cursorline')
  vim.cmd('set laststatus=3')
  vim.cmd('set winbar=%=%m\\ %f')
  vim.cmd('command W w')
end

local function set_vim_wo()
  vim.wo.number = true
  vim.wo.relativenumber = true
  vim.wo.wrap = false
end

local function set_keymaps()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = false }

  map('n', '<leader>h', '<CMD>wincmd h<CR>', options)
  map('n', '<leader>j', '<CMD>wincmd j<CR>', options)
  map('n', '<leader>k', '<CMD>wincmd k<CR>', options)
  map('n', '<leader>l', '<CMD>wincmd l<CR>', options)

  map('n', '<leader>1', '1gt', options)
  map('n', '<leader>2', '2gt', options)
  map('n', '<leader>3', '3gt', options)
  map('n', '<leader>4', '4gt', options)
  map('n', '<leader>,', ':tabprevious<CR>', options)
  map('n', '<leader>.', ':tabnext<CR>', options)
end


local function init()
  set_augroup()
  set_vim_g()
  set_vim_o()
  set_vim_wo()
  set_keymaps()
end

return {
  init = init,
}
