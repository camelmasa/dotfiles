" 基本設定 {{{1

" モードラインを有効にする
set modeline

" 3行目までをモードラインとして検索する
set modelines=3

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

" 120文字で赤線
set textwidth=0
if exists('&colorcolumn')
  set colorcolumn=+1
  autocmd FileType sh,cpp,perl,vim,ruby,python,haskell,scheme setlocal textwidth=120
endif

" 行末にスペースがあれば赤く表示
highlight WhitespaceEOL ctermbg=red
matc WhitespaceEOL /\s\+$/

" ~/.vimrc.localの読み込み
if filereadable(expand('$HOME/.vimrc.local'))
  source ~/.vimrc.local
endif

" 保存していなくても別のファイルを開く
set hidden

" クリップボードに保存
set clipboard=unnamed


" プラグイン {{{1

" neobundle  {{{2

set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'Shougo/neobundle.vim'
    NeoBundle 'Shougo/vimproc'
    NeoBundle 'Shougo/neocomplcache.vim'
    NeoBundle 'Shougo/neosnippet'
    NeoBundle "Shougo/neosnippet-snippets"
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
    NeoBundle 'rking/ag.vim'
    NeoBundle 'ngmy/vim-rubocop'
    NeoBundle 'scrooloose/nerdtree'
    NeoBundle 'rizzatti/funcoo.vim'
    NeoBundle 'rizzatti/dash.vim'
    NeoBundle 'tpope/vim-dispatch'
    NeoBundle 'fatih/vim-go'
    NeoBundle 'thoughtbot/vim-rspec'
    NeoBundle 'udalov/kotlin-vim'
  call neobundle#end()
endif

filetype plugin indent on
filetype indent on

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

" ファイルが無かったらNERDTreeを開く
" autocmd vimenter * if !argc() | NERDTree | endif

" Ctrl-gでNERDTreeをトグル
map <C-g> :NERDTreeToggle<CR>


" vim-rspec.vim {{{2

let g:rspec_command = "Dispatch bundle exec rspec {spec}"
let g:rspec_runner = "os_x_iterm"

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>


" ag.vim {{{2

let g:agprg="ag --column"


" unite.vim {{{2

" insert modeで開始
let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" vim: foldmethod=marker
" vim: foldcolumn=3
" vim: foldlevel=0
