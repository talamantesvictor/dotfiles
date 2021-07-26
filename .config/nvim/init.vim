" Customized init.vim for neovim (https://neovim.io)
" Victor Talamantes

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/autoload/plugged')
	" Better Syntax Support
	Plug 'sheerun/vim-polyglot'
	" Auto pairs for '(' '[' '{'
	Plug 'jiangmiao/auto-pairs'
	" Dracula Theme
	Plug 'dracula/vim',{'as': 'dracula'}
	" Auto suggestions
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" Status line
	Plug 'itchyny/lightline.vim'
	" Popups, plenary and Telescope fuzzy finder
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim' 
	" Multiple cursors
	Plug 'mg979/vim-visual-multi', {'branch': 'master'}
	" File explorer
	Plug 'preservim/nerdtree'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <SPACE> <nop>
let mapleader = " "        " Change leader key to space instead of \
set termguicolors          " True color
set number                 " Line numbers
set noshowmode             " Prevent modes showing below the status line (using lightline)
set noswapfile             " No swap
set smarttab               " Auto indent
set expandtab              " Spaces instead of tabs
set shiftwidth=3           " One tab == three spaces
set tabstop=3              " One tab == three spaces
set splitbelow splitright  " Open new window splits at the bottom or right
colorscheme dracula        " Color Theme
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap Keys
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap Esc Key
:imap ii <Esc>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy/Paste from X11 Clipboard
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap <leader>xy :!xclip -f -sel clip<CR>
map <leader>xp mz:-1r !xclip -o -sel clip<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other Keybindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" `gf` opens file under cursor in a new vertical split
nnoremap gf :vertical wincmd f<CR>
" NERDTree
nnoremap <leader>nf :NERDTreeFocus<CR>
nnoremap	<leader>nt :NERDTreeToggle<CR>
