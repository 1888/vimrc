set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/ 
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins 
"let path = '~/some/path/here' 
"call vundle#rc(path) 
" let Vundle manage Vundle, required 
"Plugin 'gmarik/vundle' 
Plugin 'VundleVim/Vundle.vim' 
" The following are examples of different formats supported. 
" Keep Plugin commands between here and filetype plugin indent on. 
" scripts on GitHub repos 
Plugin 'tpope/vim-fugitive' 
Plugin 'Lokaltog/vim-easymotion' 
Plugin 'tpope/vim-rails.git' 
" The sparkup vim script is in a subdirectory of this repo called vim. 
" Pass the path to set the runtimepath properly. 
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'} 
" scripts from http://vim-scripts.org/vim/scripts.html 
Plugin 'L9' 
"Plugin 'FuzzyFinder' 
" use ctrp repace fuzzyfinder
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<S-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|o|cmd)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }



" scripts not on GitHub 
"Plugin 'git://git.wincent.com/command-t.git' 
" git repos on your local machine (i.e. when working on your own plugin) 
" Plugin 'file:///home/gmarik/path/to/plugin' 
" ... 
Plugin 'majutsushi/tagbar'
"nmap <Leader>tb :TagbarToggle<CR> "快捷键设置 
"let g:tagbar_ctags_bin='ctags' "ctags程序的路径 
let g:tagbar_width=30 "窗口宽度的设置 
let g:tagbar_left=1
map <F2> :Tagbar<CR> 
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen() "如果是c语言的程序的话，tagbar自动开启
let g:tagbar_ctags_bin='/usr/bin/ctags'
" 设置当前目录下的tags文件作为索引,在一个新目录执行ctags -R ./ 生成ctags文件;
" 将光标移动到某个tag时，按键g]可以搜索出所有tag，输入序号跳转到制定tag
set tags+=./tags;
" 将F8映射成： esc进入normal模式，:!ctags -R <CR>执行这个命令，<CR>回到vim
map <silent> <F8> <ESC>:!ctags -R <CR><CR>


Plugin 'scrooloose/nerdtree'
let NERDTreeWinPos='right'
let NERDTreeWinSize=50
let NERDTreeShowHidden=1
let NERDTreeAutoCenter=1
" ignore filetype
let NERDTreeIgnore=[ '\.o','\~$','\.swp' ]
map <F3> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"Plugin 'fholgado/minibufexpl.vim'
"let g:miniBufExplMapWindowNavVim = 1 
"let g:miniBufExplMapWindowNavArrows = 1 
"let g:miniBufExplMapCTabSwitchBufs = 1 
"let g:miniBufExplModSelTarget = 1 
"let g:miniBufExplMoreThanOne=0
""
"map <F9> :MBEbp<CR>
"map <F10> :MBEbn<CR>
"map <F4> :MBEToggle<CR>
"
"Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
set t_Co=256
set laststatus=2
map <F4> <ESC>:AirlineToggle<CR>
map <F5> <ESC>:bp<CR>
map <F6> <ESC>:bn<CR>
"let g:airline_theme="luna"
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#buffer_nr_show= 1

call vundle#end() 
filetype plugin indent on
" To ignore plugin indent changes, instead use: 
"filetype plugin on 
" 
" Brief help 
" :PluginList - list configured plugins 
" :PluginInstall(!) - install (update) plugins 
" :PluginSearch(!) foo - search (or refresh cache first) for foo 
" :PluginClean(!) - confirm (or auto-approve) removal of unused plugins 
" 
" see :h vundle for more details or wiki for FAQ 
" NOTE: comments after Plugin commands are not allowed. 
" Put your stuff after this line

set nu
set hlsearch
set incsearch
set showmode
syntax on
set tabstop=4
"set shiftwidth=4
"set expandtab
autocmd FileType c,cpp,java set shiftwidth=4 | set expandtab
hi Search ctermfg=234 ctermbg=190

" close buffer without close window
map <F7> <ESC>:bp<CR><ESC>:bw #<CR>

" 折叠
set foldmethod=syntax
" 启动vim时关闭折叠代码
set nofoldenable
" za,打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠

