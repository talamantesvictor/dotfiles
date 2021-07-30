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
   " Quick comments
   Plug 'b3nj5m1n/kommentary'
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Right> :vertical resize +3<CR>
noremap <silent> <C-Left> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other Keybindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" `gf` opens file under cursor in a new vertical split
nnoremap gf :vertical wincmd f<CR>
" Telescope keybindings
nnoremap <leader>fe <cmd>Telescope file_browser<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
" Move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

