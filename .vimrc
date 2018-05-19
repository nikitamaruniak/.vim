" Load plugins using pathogen.
if has("win32")
	source ~\.vim\bundle\vim-pathogen\autoload\pathogen.vim
	execute pathogen#infect('~\.vim\bundle\{}')
else
	if has("unix")
		source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim
		execute pathogen#infect('~/.vim/bundle/{}')
	endif
endif

" Store all backup files in a separated directory.
if has("win32")
        set backupdir=~\.vim\backup\\
        set directory=~\.vim\swap\\
        set undodir=~\.vim\undo\\
else
	if has("unix")
            set backupdir=~/.vim/backup//
            set directory=~/.vim/swap//
            set undodir=~/.vim/undo//
	endif
endif
" Use UTF-8 character encoding inside Vim.
set encoding=UTF-8

if has("unix") && has("x11")
    " Use X11 clipboard by default.
    set clipboard=unnamedplus
else
    " Use system clipboard by default.
    set clipboard=unnamed
endif

" While typing a search command, show immediately where the so far
" typed pattern matches. The matched string is highlighted.
set incsearch
" When there is a previous search pattern, highlight all its matches.
set hlsearch

" Ignore case in search pattern by default.
set ignorecase
" Ignore case if pattern is written in lower case or perform case sensitive search otherwise.
set smartcase

" When a bracket is inserted, briefly jump to the matching one. 
set showmatch
" Include '<' and '>' pair to 'showmatch'.
set matchpairs+=<:>

" Make <Tab> and <BS> to use 4 spaces instead of tab character without
" changing how existing tab characters are displayed.
set expandtab
set shiftwidth=4
set softtabstop=-1
" Make indentation commands align to multiples of 4.
set shiftround

" Do smart autoindenting when starting a new line.  Works for C-like
" programs, but can also be used for other languages.
set smartindent
" Copy indent from current line when starting a new line (typing <CR>
" in Insert mode or when using the "o" or "O" command).
set autoindent

" Display line number in the first column.
set number

" Display line and row numbers in the status line.
set ruler

" Highlight 80th column.
set colorcolumn=80

" Show statusline.
set laststatus=2

" This specifies where in Insert mode the <BS> is allowed to delete the
" character in front of the cursor.  The three items, separated by commas, tell
" Vim to delete the white space at the start of the line, a line break and the
" character before where Insert mode started.
set backspace=indent,eol,start

" Extending default symbols in 'list' mode to show tab characters as >--->---.
set listchars=eol:$,tab:>-

" Map comma (,) as Leader key
let mapleader=","

" Ctrl-Shift-F12 goto next error.
nmap <C-S-F12> :cn<CR>

" Format current buffer or selection as XML document.
nmap <F9> :%s/>\s*</>\r</eg<CR>:set filetype=xml<CR>gg=G<CR>
vmap <F9> :s/>\s*</>\r</eg<CR><ESC>:set filetype=xml<CR>gv=<CR>

" Pretify JSON.
nmap <F10> :%!python -m json.tool<CR>
vmap <F10> :!python -m json.tool<CR>

" Clear search highlights
nmap <Leader><Space> :nohl<Enter>

" Enable syntax coloring.
syntax on

" Enable filetype plugins (required by NERD Commenter)
filetype plugin on

" netrw options
nmap <Leader>. :Explore %:p:h<Enter>
let g:netrw_banner=0
let g:netrw_browse_split=0
let g:netrw_liststyle=4

" Ignore whitespace in diff mode
set diffopt+=iwhite

" Open diff mode using the vertical split.
set diffopt+=vertical

" Set Solarized color scheme.
let g:solarized_visibility="low"
set background=light
colorscheme solarized

" Add the current git branch name to the default statusline.
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

if has("gui_running")
    " Hide toolbar.
    set guioptions-=T

    " Hide menu bar.
    set guioptions-=m

    " Default window size.
    set lines=50
    set columns=100

    if has("win32")
        set guifont=Consolas:h11
    endif
endif
