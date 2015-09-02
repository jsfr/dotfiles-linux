" Run the following first:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Then run :PlugInstall to install all plugins.
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'bling/vim-airline'
Plug 'terryma/vim-expand-region'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go'
" Plug 'lervag/vimtex'
" Plug 'kien/ctrlp.vim'
" Plug 'FelikZ/ctrlp-py-matcher'
call plug#end()

set term=xterm
set background=dark
colorscheme solarized
let g:airline_theme='solarized'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''
set wildignore=''
set laststatus=2
set hidden

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  "     allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set noswapfile
filetype plugin indent on

let mapleader = "\<Space>"

inoremap fd <Esc>
nnoremap n nzz
nnoremap <Leader>q :q<CR>
nnoremap <Leader>d :bdelete<CR>

" See http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity
nnoremap <Leader>w :w<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader><Leader> V
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" Golang
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

" Folding
inoremap <Leader>f <C-O>za
nnoremap <Leader>f za
onoremap <Leader>f <C-C>za
vnoremap <Leader>f zf

" let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
"       \ --ignore .git
"       \ --ignore .svn
"       \ --ignore .hg
"       \ --ignore .DS_Store
"       \ --ignore "**/*.pyc"
"       \ -g ""'
" let g:ctrlp_max_files=0
" let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
