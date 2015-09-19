set nocompatible   " always be viM
filetype off

" Initialize Vundle
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Configure Vundle plugins
Plugin 'VundleVim/Vundle.vim'          " let Vundle manage Vundle - required
Plugin 'plasticboy/vim-markdown'       " syntax highlighting for markdown
" Plugin 'jnwhiteh/vim-golang'           " syntax highlighting for golang
" Plugin 'Valloric/YouCompleteMe'        " autocompletion
" Plugin 'Blackrush/vim-gocode'          " autocompletion + syntax for golang
Plugin 'fatih/vim-go'                  " ???
" Plugin 'nsf/gocode', {'rtp': 'vim/'}   " seems to be more maintained than vim-gocode
Plugin 'rust-lang/rust.vim'            " rust syntax et al
Plugin 'airblade/vim-gitgutter'	       " git diff status in the gutter
Plugin 'bling/vim-airline'             " better status line
" Plugin 'scrooloose/nerdtree'           " file browser
Plugin 'wincent/Command-T'	       " intelligent file opener
Plugin 'tpope/vim-fugitive'	       " git wrapper
Plugin 'rking/ag.vim'                  " wrap ag
Plugin 'elzr/vim-json'		       " JSON highlighting
"Plugin 'rhysd/vim-go-impl'	       " automatically generate method stubs for interfaces
let g:vim_json_syntax_conceal = 0      " don't hide quotes etc in JSON
let g:vim_markdown_folding_disabled=1  " never fold with markdown
let g:gitgutter_sign_column_always=1   " always show the gitgutter column
let g:gofmt_command='goimports'        " use goimports in place of gofmt
let g:go_doc_keywordprg_enabled = 1    " don't bind K

call vundle#end()

" Be able to toggle goimports on and off
command Gi let g:gofmt_command='goimports'
command Gf let g:gofmt_command='gofmt'
cnoreabbrev gi Gi
cnoreabbrev gf Gf

" Shortcut to Ag
cnoreabbrev ag Ag


" Display
colorscheme ron
set guifont=Monospace\ 16
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
" let &statusline = ''
" let &statusline .= '%3n ' " Buffer number
" let &statusline .= '%<%f ' " Filename
" let &statusline .= '%m%r%h%w' " Modified flag, Readonly flag, Preview flag
" let &statusline .= '%{"[" . (&fileencoding != "" ? &fileencoding :
" &encoding) . "][" . &fileformat . "][" . &filetype . "]"}'
" let &statusline .= '%=' " Spaces
" let &statusline .= '%l,%c%V' " Line number, Column number, Virtual column number
" let &statusline .= '%4P' " Percentage through file of displayed window.

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Search options
set hlsearch          " highlight search terms
set incsearch         " show search matches as you type
set smartcase         " ignore case if search pattern is all lowercase, case-sensitive otherwise

set backupdir=$HOME/.backup

" Toggle line numbers
nmap <C-l> :set invnumber<CR>

" Toggle NERDTree
" noremap <C-M> :NERDTreeToggle<CR>

" Hide buffers instead of closing them
set hidden
noremap <C-J> :bnext<CR>
noremap <C-K> :bprevious<CR>
noremap <C-Q> :bdelete<CR>

" Move between splits
noremap <C-L> <C-w><C-l>
noremap <C-H> <C-w><C-h>

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

" Tabs -> spaces for Python, JSON, C
autocmd FileType * set noexpandtab
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType json set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType c set tabstop=8|set shiftwidth=8|set expandtab

filetype on
set secure
