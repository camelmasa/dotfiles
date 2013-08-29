" 基本設定 {{{1
" エンコード
set encoding=utf-8

" ステータスラインの表示
set laststatus=2

" シンタックスを有効
syntax enable

" タブ幅の設定
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

"検索の設定
set ignorecase
set smartcase
set wrapscan
set hlsearch
set noincsearch

" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" 80文字で赤線
set textwidth=0
if exists('&colorcolumn')
  set colorcolumn=+1
  autocmd FileType sh,cpp,perl,vim,ruby,python,haskell,scheme setlocal textwidth=80
endif

" 行末にスペースがあれば赤く表示
highlight WhitespaceEOL ctermbg=red
matc WhitespaceEOL /\s\+$/

" ~/.vimrc.localの読み込み
if filereadable(expand('$HOME/.vimrc.local'))
  source ~/.vimrc.local
endif


" プラグイン {{{1

" neobundle  {{{2

set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-pathogen'
NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'itchyny/landscape.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'ngmy/vim-rubocop'
NeoBundle 'scrooloose/nerdtree'

filetype plugin indent on
filetype indent on

NeoBundleCheck


" neocomplcache {{{2

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 2

" let g:neocomplete#enable_at_startup = 1


" lightline.vim {{{2

if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

" set guifont=Inconsolata-dz\ for\ Powerline:h15
" set guifont=InconsolataForPowerline-dz:h15
" let g:Powerline_symbols = 'fancy'


" nerdtree.vim {{{2

" ファイルが無かったらNERDTreeを開かない
autocmd vimenter * if !argc() | NERDTree | endif

" Ctrl-gでNERDTreeをトグル
map <C-g> :NERDTreeToggle<CR>



" vim: foldmethod=marker
" vim: foldcolumn=3
" vim: foldlevel=0
