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
" Theming
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Misc
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'mbbill/undotree'
Plug 'mileszs/ack.vim'
Plug 'myusuf3/numbers.vim'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdcommenter'
Plug 'takac/vim-hardtime'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'

" 70+ syntax plugs
Plug 'sheerun/vim-polyglot'

" JS/Web
Plug 'alvan/vim-closetag'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'valloric/MatchTagAlways'

" Rust
Plug 'sebastianmarkow/deoplete-rust'

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
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
set nostartofline       " Do not jump to first character with page commands.
set display+=lastline   " Show latest command/pressed keys (i think)
set scrolloff=10        " Show next 10 lines while scrolling.
set sidescrolloff=10    " Show next 10 columns while side-scrolling.
" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.
set hlsearch            " Highlight search results.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set incsearch           " Incremental search.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).
set hidden              " Don't unload buffers when they are abandoned
set clipboard^=unnamedplus " System clipboard
set spelllang=en
set spellfile=$HOME/.config/nvim/spell/en.utf-8.add
set timeoutlen=250                  " Shorter timeout length

set notimeout
autocmd InsertEnter * set timeout   " Enable timeout in insert
autocmd InsertLeave * set notimeout " Disable timeout in other modes

" Use <CR> or <esc> to clear the highlighting of :set hlsearch.
nnoremap <silent> <esc> :noh<CR><esc>
nnoremap <silent> <CR> :noh<CR><CR>

let mapleader = " "

" Use ; for commands.
nnoremap ; :
vnoremap ; :

" Spacemacs inspired keybings
nnoremap <leader>w= <C-W>=
nnoremap <leader>wr <C-W>R
nnoremap <leader>wt <C-W>T
nnoremap <leader>wo <C-W>o
nnoremap <leader>wq <C-w>q
nnoremap <leader>wc <C-w>q
nnoremap <leader>wd <C-w>q
nnoremap <leader>w<tab> <C-w>p
nnoremap <leader>ww :Windows<CR>
nnoremap <leader>w/ :vsplit<CR>
nnoremap <leader>w- :split<CR>
nnoremap <leader>w\| <C-W>\|
nnoremap <leader>w_ <C-W>_

nnoremap <leader>ff :Files ~<CR>
nnoremap <leader>fr :History<CR>
nnoremap <leader>fs :w<CR>
nnoremap <leader>fp :GFiles<CR>
nnoremap <leader>fg :GFiles?<CR>

nnoremap <leader>ln :lnext<CR>
nnoremap <leader>lp :lprev<<CR>
nnoremap <leader>ll :ll<CR>
nnoremap <leader>lo :lopen<CR>

nnoremap <leader><tab> :b#<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bb :Buffers<CR>

command! PU PlugUpdate | PlugUpgrade
nnoremap <leader>_r :source $MYVIMRC<CR>
nnoremap <leader>_d :e $MYVIMRC<CR>
nnoremap <leader>_pi :PlugInstall<CR>
nnoremap <leader>_pu :PU<CR>
nnoremap <leader>_pc :PlugClean<CR>

" Indent entire buffer
map <leader>= mzgg=G`z

" See http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Fix st issue with DEL key
map <F1> <del>
map! <F1> <del>

" Show undotree
nnoremap U :UndotreeShow<CR>:UndotreeFocus<CR>

" Disable macro recording on q
map q <Nop>

" Add persistent undo
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" JS(X)/Web setup
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js" " Enable vim-closetag
let g:mta_filetypes = {'html' : 1, 'xhtml' : 1, 'xml' : 1, 'jinja' : 1, 'javascript.jsx' : 1}
nnoremap <leader>% :MtaJumpToOtherTag<cr>
let g:mta_use_matchparen_group = 0
let g:mta_set_default_matchtag_color = 0
highlight MatchTag ctermfg=red ctermbg=NONE

" Deoplete setup
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
" racer
let g:deoplete#sources#rust#racer_binary='/usr/bin/racer'
let g:deoplete#sources#rust#rust_source_path='~/repos/rust/src/'
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Neomake setup
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_scss_enabled_makers = ['stylelint']
let g:neomake_scss_stylelint_maker = { 'exe': 'stylelint', 'errorformat': '%+P%f,' . '%*\s%l:%c  %t  %m,' . '%-Q' }
autocmd! BufWritePost,BufEnter * Neomake

" NERDCommenter setup
let g:NERDSpaceDelims = 1            " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1        " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'      " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDCommentEmptyLines = 1      " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting

" vim-surround setup
xmap s <Plug>VSurround

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Hardtime
inoremap fd <Esc>
inoremap jj <Esc>
nnoremap <leader>h :HardTimeToggle<CR>
let g:hardtime_allow_different_key = 1
let g:hardtime_default_on = 1
let g:hardtime_ignore_buffer_patterns = [ "undotree*", ".git*" ]
let g:hardtime_ignore_quickfix = 1
let g:hardtime_maxcount = 2
let g:list_of_disabled_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = []
let g:list_of_normal_keys = ["h", "j", "k", "l"]
let g:list_of_visual_keys = ["h", "j", "k", "l"]

" sneak setup
let g:sneak#s_next = 1
"replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
"replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

" Use trash instead of rm for netrw
let g:netrw_localrmdir='trash'
