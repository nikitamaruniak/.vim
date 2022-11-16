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

" Display relative line number to ease navigation
set relativenumber

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

if has('ide')
    set ideajoin

    map <Leader>f <Action>(RefactoringMenu)
    map <Leader>v <Action>(Vcs.QuickListPopupAction)
    map <Leader>t <Action>(Vcs.UpdateProject)
    map <Leader>r <Action>(Run)
    map <Leader>R <Action>(ChooseRunConfiguration)
    map <Leader>d <Action>(Debug)
    map <Leader>D <Action>(ChooseDebugConfiguration)
    map <Leader>k <Action>(CheckinProject)
    map <Leader>K <Action>(Vcs.Push)
    map <Leader>b <Action>(ToggleLineBreakpoint)
endif
