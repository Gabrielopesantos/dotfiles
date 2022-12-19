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
        termguicolors = true,
        completeopt = 'menuone,noselect',
        ignorecase = true,
        smartcase = true
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
    vim.cmd('set colorcolumn=80,120')
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
    vim.wo.signcolumn = 'yes'
end

-- Keymaps for better default experience

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in place after J
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in middle when moving
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor in middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Replace without replacing content
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to global registry
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Replace word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

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
