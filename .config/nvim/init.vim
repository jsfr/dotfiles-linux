" install vim-plug if it is missing
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin('~/.config/nvim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'mbbill/undotree'
Plug 'airblade/vim-rooter'
Plug 'scrooloose/nerdcommenter'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'neomake/neomake'
Plug 'benjie/neomake-local-eslint.vim'
Plug 'easymotion/vim-easymotion'
call plug#end()

set background=dark
colorscheme solarized
let g:airline_powerline_fonts = 1

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set esckeys             " Cursor keys in insert mode.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

set hlsearch            " Highlight search results.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set incsearch           " Incremental search.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).
set notimeout           " Remove timeout on key sequences

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

let mapleader = " "

" Use ; for commands.
nnoremap ; :
vnoremap ; :

" Spacemacs inspired keybings
nnoremap <leader>wj <C-W><C-J>
nnoremap <leader>wk <C-W><C-K>
nnoremap <leader>wl <C-W><C-L>
nnoremap <leader>wh <C-W><C-H>
nnoremap <leader>w= <C-W>=
nnoremap <leader>wr <C-W>R
nnoremap <leader>wt <C-W>T
nnoremap <leader>wo <C-W>o
nnoremap <leader>wq <C-w>q
"nnoremap <leader>w/ :splitv<CR>
"nnoremap <leader>w- :split<CR>
"nnoremap <leader>w| <C-W>|
"nnoremap <leader>w_ <C-W>_
nnoremap <leader>pf :GFiles<CR>
nnoremap <leader>ff :Files ~<CR>
nnoremap <leader>fr :History<CR>
nnoremap <leader>fs :w<CR>
nnoremap <leader>ln :lnext<CR>
nnoremap <leader>lp :lprev<<CR>
nnoremap <leader>ll :ll<CR>
nnoremap <leader>lo :lopen<CR>
nnoremap <leader><tab> :b#<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bb :Buffers<CR>

" See http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" ???
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
"nnoremap n nzz

" Stay out of insert
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
" inoremap fd <Esc>

" Fix st issue with DEL key
map <F1> <del>
map! <F1> <del>

nnoremap U :UndotreeShow<CR>:UndotreeFocus<CR>

" javascript-libraries-syntax
let g:used_javascript_libs = 'react'

" System clipboard
set clipboard^=unnamedplus

" vim-closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js"

" vim-jsx
let g:jsx_ext_required = 0

" Use deoplete.
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" Disable macro recording on q
map q <Nop>

" Change to home directory from non-project files
let g:rooter_change_directory_for_non_project_files = 'home'

" setup neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
autocmd! BufWritePost,BufEnter *.js Neomake

" NERDCommenter setup
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
