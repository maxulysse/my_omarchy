" ~/.vimrc - Vim configuration file

" Disable compatibility with vi
set nocompatible

" Enable file type detection
filetype on
filetype plugin on
filetype indent on

" Syntax highlighting
syntax on

" Line numbers
set number
set relativenumber

" Highlight cursor line
set cursorline

" Tab settings
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" Search settings
set incsearch
set ignorecase
set smartcase
set hlsearch

" Display settings
set showcmd
set showmode
set showmatch
set ruler

" Command line completion
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Encoding
set encoding=utf-8

" Backup and swap files
set nobackup
set noswapfile
set nowritebackup

" Undo settings
set undofile
set undodir=~/.vim/undodir

" Color scheme
colorscheme desert
set background=dark

" Enable mouse support
set mouse=a

" Split settings
set splitbelow
set splitright

" Clipboard
set clipboard=unnamedplus

" Status line
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Key mappings
let mapleader = ","

" Easy window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Clear search highlighting
nnoremap <leader><space> :nohlsearch<CR>

" Quick save
nnoremap <leader>w :w<CR>

" Quick quit
nnoremap <leader>q :q<CR>

" Toggle line numbers
nnoremap <leader>n :set number! relativenumber!<CR>

" Toggle paste mode
set pastetoggle=<F2>

" Spell checking
nnoremap <leader>s :setlocal spell! spelllang=en_us<CR>

" File type specific settings
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType css setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType json setlocal tabstop=2 shiftwidth=2 expandtab

" Auto-create undo directory if it doesn't exist
if !isdirectory($HOME."/.vim/undodir")
    call mkdir($HOME."/.vim/undodir", "p", 0700)
endif

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
