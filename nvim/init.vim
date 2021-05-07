call plug#begin("~/.config/nvim/plugged")

" Plebvim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'

" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Debugger Plugins
"Plug 'puremourning/vimspector'
"Plug 'szw/vim-maximizer'

" THANKS BFREDL
"Plug '/home/mpaulson/personal/contextprint.nvim'
"Plug '/home/mpaulson/personal/af-pluth-pluth'

"Plug 'rust-lang/rust.vim'
"Plug 'tweekmonster/gofmt.vim'
Plug 'tpope/vim-fugitive'
"Plug 'junegunn/gv.vim'
"Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
"Plug 'vuciv/vim-bujo'
"Plug 'tpope/vim-dispatch'
"Plug 'theprimeagen/vim-be-good'
"Plug '/home/theprimeagen/personal/af-pluth-pluth'
Plug 'gruvbox-community/gruvbox'
"Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'tpope/vim-projectionist'


" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"Plug '/home/theprimeagen/personal/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

"Plug 'colepeters/spacemacs-theme.vim'
"Plug 'sainnhe/gruvbox-material'
"Plug 'phanviet/vim-monokai-pro'
"Plug 'flazz/vim-colorschemes'
"Plug 'chriskempson/base16-vim'
"Plug 'dracula/vim', { 'as': 'dracula' }

" Harpoon
Plug 'ThePrimeagen/harpoon'

" prettier
Plug 'sbdchd/neoformat'

call plug#end()

lua require("lua_stuff")
lua require'nvim-treesitter.configs'.setup {highlight = {enable = true } }

let mapleader=" "

"remaps

nnoremap <leader>t :Ex<CR>
"nnoremap <leader>- :vertical resize -5<CR>
"nnoremap <leader>+ :vertical resize +5<CR>
"nnoremap <leader>rp :resize 100<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gc=gv

au BufReadPost,BufNewFile *.yml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
