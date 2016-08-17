runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

if has("syntax")
  syntax on
endif

if has("autocmd")
	autocmd FileType * set formatoptions-=ro " 改行時にコメントしない
  autocmd BufNewFile,BufRead *.ejs set filetype=javascript " for Node.js
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown " for Markdown
  autocmd FileType markdown hi! def link markdownItalic LineNr
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

inoremap <silent> jj <ESC>
inoremap {<Enter> {}<Left><CR><ESC><S-o>

noremap <S-h>   ^
noremap <S-j>   }
noremap <S-k>   {
noremap <S-l>   $

nnoremap + <C-a>
nnoremap - <C-x>

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

nnoremap ; :
nnoremap : ;

noremap j gj
noremap k gk
nmap <Tab> gt
nmap <S-Tab> gT
nnoremap <ESC><ESC> :noh<CR>

if has("autocmd")
  filetype plugin indent on
endif

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

set guifont=DejaVu\ Sans\ Mono\ 10
set tabstop=4
set shiftwidth=4
set noexpandtab
set nobackup
set noswapfile
set number
set autoindent
set smartindent
set hlsearch
set splitbelow
set splitright

set t_Co=256
colorscheme lucius
set background=dark
highlight Normal ctermbg=none
autocmd FileType html,javascript colorscheme molokai
autocmd FileType json colorscheme af

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.vim') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/.dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file])
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

filetype plugin indent on
