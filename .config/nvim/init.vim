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
Plug 'tpope/vim-sensible'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'qpkorr/vim-bufkill'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-vinegar'
Plug 'takac/vim-hardtime'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-eunuch'

" JS/Web plugs
Plug 'alvan/vim-closetag'
Plug 'jaawerth/neomake-local-eslint-first'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" Rust plugs
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

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
" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/
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
nnoremap <leader>bd :BD<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bb :Buffers<CR>

command! PU PlugUpdate | PlugUpgrade
nnoremap <leader>_r :source $MYVIMRC<CR>
nnoremap <leader>_d :e $MYVIMRC<CR>
nnoremap <leader>_pi :PlugInstall<CR>
nnoremap <leader>_pu :PU<CR>
nnoremap <leader>_pc :PlugClean<CR>


" See http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" ???
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Stay out of insert
inoremap fd <Esc>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>

" Fix st issue with DEL key
map <F1> <del>
map! <F1> <del>

" Show undotree
nnoremap U :UndotreeShow<CR>:UndotreeFocus<CR>

" Disable macro recording on q
map q <Nop>

" Save current buffer as root
command! SaveAsRoot w !sudo tee %

" Add persistent undo
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" JS(X)/Web setup
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js" " Enable vim-closetag
let g:jsx_ext_required = 0 " Enable vim-jsx for .js files

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
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Neomake setup
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
autocmd! BufWritePost,BufEnter *.js Neomake

" NERDCommenter setup
let g:NERDSpaceDelims = 1            " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1        " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'      " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDCommentEmptyLines = 1      " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting

" vim-surround setup
xmap s <Plug>VSurround

" rust setup
let g:rustfmt_autosave = 1

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" enable hardtime
let g:hardtime_default_on = 1
let g:hardtime_ignore_quickfix = 1
let g:hardtime_maxcount = 2
nnoremap <leader>h :HardTimeToggle<CR>
let g:list_of_normal_keys = ["h", "j", "k", "l"]
let g:list_of_visual_keys = ["h", "j", "k", "l"]
let g:list_of_insert_keys = []
let g:list_of_disabled_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
