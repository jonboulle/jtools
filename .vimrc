set nocompatible   " always be viM
filetype off

" Initialize Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Configure Vundle plugins
Plugin 'gmarik/vundle'                 " let Vundle manage Vundle - required
Plugin 'plasticboy/vim-markdown'       " syntax highlighting for markdown
" Plugin 'jnwhiteh/vim-golang'           " syntax highlighting for golang
Plugin 'Valloric/YouCompleteMe'        " autocompletion
Plugin 'Blackrush/vim-gocode'          " autocompletion + syntax for golang
Plugin 'airblade/vim-gitgutter'	       " git diff status in the gutter
Plugin 'scrooloose/nerdtree'           " file browser
Plugin 'wincent/Command-T'	       " intelligent file opener
let g:vim_markdown_folding_disabled=1  " never fold with markdown
let g:gitgutter_sign_column_always=1   " always show the gitgutter column
let g:gofmt_command='goimports'        " use goimports in place of gofmt

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

" Highlight tabs and 2+spaces (or trailing whitespace)
autocmd ColorScheme * highlight Whitespace cterm=underline gui=underline ctermbg=NONE guibg=NONE ctermfg=darkgreen
highlight Whitespace cterm=underline gui=underline ctermbg=NONE guibg=NONE ctermfg=darkgreen
call matchadd('Whitespace', '  \+')
call matchadd('Whitespace', ' \+$')
autocmd ColorScheme * highlight Tabspace cterm=underline gui=underline ctermbg=NONE guibg=NONE ctermfg=darkblue
highlight Tabspace cterm=underline gui=underline ctermbg=NONE guibg=NONE ctermfg=darkblue
call matchadd('Tabspace', '\t')
command Stripbs :%s/\s\+$//

" Don't show the preview window for omni-completion
set completeopt-=preview

" When the auto-complete menu is visible, make enter accept the currently
" highlighted suggestion
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Shortcuts
nnoremap ; :

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
noremap <C-L> :bnext<CR>
noremap <C-H> :bprevious<CR>

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
