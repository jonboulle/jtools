set nocompatible   " always be viM
filetype off

" Initialize Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Configure Vundle plugins
Plugin 'gmarik/vundle'                 " let Vundle manage Vundle - required
Plugin 'plasticboy/vim-markdown'       " syntax highlighting for markdown
Plugin 'jnwhiteh/vim-golang'           " syntax highlighting for golang
Plugin 'Valloric/YouCompleteMe'        " autocompletion
Plugin 'airblade/vim-gitgutter'	       " git diff status in the gutter
Plugin 'scrooloose/nerdtree'           " file browser
let g:vim_markdown_folding_disabled=1  " never fold with markdown

" Display
colorscheme ron
set guifont=Monospace\ 14
syntax on             " syntax highlighing
set ruler             " show the cursor position all the time
set visualbell t_vb=  " turn off error beep/flash
set novisualbell      " turn off visual bell
set title             " show title in console title bar
set ttyfast           " improve smoothness of redrawing
set ls=2              " always show status line
set scrolloff=5       " keep 5 lines when scrolling
set showcmd           " display incomplete commands
set showmatch         " show matching parenthesis
let g:is_posix = 1    " don't highlight $(...) as error
set wrap              " wrap text display

" Status line
let &statusline = ''
let &statusline .= '%3n ' " Buffer number
let &statusline .= '%<%f ' " Filename
let &statusline .= '%m%r%h%w' " Modified flag, Readonly flag, Preview flag
"let &statusline .= '%{"[" . (&fileencoding != "" ? &fileencoding :
" &encoding) . "][" . &fileformat . "][" . &filetype . "]"}'
let &statusline .= '%=' " Spaces
let &statusline .= '%l,%c%V' " Line number, Column number, Virtual column number
let &statusline .= '%4P' " Percentage through file of displayed window.

" Search options
set hlsearch          " highlight search terms
set incsearch         " show search matches as you type
set smartcase         " ignore case if search pattern is all lowercase, case-sensitive otherwise

" Toggle line numbers
nmap <C-l> :set invnumber<CR>

" Toggle NERDTree
" noremap <C-M> :NERDTreeToggle<CR>


" Hide buffers instead of closing them
set hidden

set autoindent	      " copy indent from current line when starting a new line
filetype plugin indent on

" History
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

" Movement
noremap J 5j
noremap K 5k
noremap j gj
noremap k gk
noremap gj gj
noremap gk gk

" Allow backspacing over autoindents, line breaks, and start of an insert
set backspace=indent,eol,start 

set whichwrap&
set whichwrap+=<,>,[,],h,l " allow these characters to wrap around to next line

filetype on
set secure
