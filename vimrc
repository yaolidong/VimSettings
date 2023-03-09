"设置不要使用vi的键盘模式，用vim
set nocompatible

"编码设置
set langmenu=zh_CN.UTF-8
set helplang=cn
set encoding=utf8
set fileencodings=utf-8,ucs-bom,gbk,cp936,gb2312,gb18030

"显示颜色
"vim8不使用256设置
"set t_Co=256
set laststatus=2
set termguicolors


"定义<leader>键
"let mapleader = "\"

"共享剪切板
set clipboard=unnamed

"侦测文件类型
filetype on

" 允许插件
filetype plugin on
"加载相应语法和文件类型相关脚本
filetype plugin indent on

"语法高亮
syntax on

"自动缩进
set autoindent 

"智能选择对齐方式
set smartindent

"c/c++语言的自动缩进方式
set cindent

"设置具体缩进方式
set cinoptions=g0,:0,N-s,(0

"光标移动到顶部和底部时保持三行距离
set scrolloff=3

"设置命令行的高度
set cmdheight=2

"设置<esc>键响应时间
set ttimeoutlen=0

"在当前行显示一条下划线
"set cursorline

"Tab键的宽度
set tabstop=4

"统一缩进为4
set softtabstop=4
set shiftwidth=4

"高亮显示匹配的括号
set showmatch
"匹配括号高亮时间
set matchtime=1

"搜索忽略大小写
set ignorecase

"搜索逐字符高亮
set hlsearch
set incsearch

"禁止折行
set nowrap

"显示行号
set number

"在处理未保存文件和只读文件时，弹出确认
set confirm

"自动保存
set autowrite
"自动读取
set autoread

"禁止生成临时文件
set nobackup
set noswapfile

"不要用空格代替制表符
set noexpandtab

"允许在缓冲区的任何地方使用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key

"vim自身命令行模式的智能补全
set wildmenu
"设置快捷键快速编辑vimrc
nnoremap <leader>e :edit ~/.vimrc<CR>

"打开当前光标所在单词的vim帮助文档
nnoremap <leader>H :execute ":help".expand("<cword>")<CR>

"重新加载vimrc文件
nnoremap <leader>s :source ~/.vimrc<CR>

"分屏窗口移动
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"复制当前选中到系统剪切板
vmap <leader><leader>y "+y
"将系统剪切板内容粘贴到vim
nnoremap <leader><leader>p "+p


"打开文件类型检测，用于智能补全
set completeopt=longest,menu

"新建cpp文件时，调用SetTitle（）
autocmd BufNewFile *.cpp,*.c exec ":call SetTitle()"
"定义函数SetTitle()
func SetTitle()
		call setline(1,"//______________________________________________________________")
		call setline(2,"//_            File  Name   : ".expand("%"))
		call setline(3,"//_            Author       : Yaolidong")
		call setline(4,"//_            My   email   :yao401405972@gmail.com") 
		call setline(5,"//_            Created Time :".strftime("%c"))
		call setline(6,"//______________________________________________________________")
		call setline(7,"")
	if expand("%:e") =='cpp'
		call setline(8,"#include <iostream>")
		call setline(9,"using namespace std;")
	endif
	if expand("%:e") =='c'
		call setline(8,"#include <stdio.h>")
		call setline(9,"using namespace std;")
	endif
		call setline(10,"")
		call setline(11,"")
		call setline(12,"int main()")
		call setline(13,"{")
		call setline(14,"")
		call setline(15,"	return 0;")
		call setline(16,"}")
endfunc
	autocmd BufNewFile * normal 14G



"按\r键自动编译执行c\c++文件
"\r映射
map <leader>r  :call CompileRunGcc()<CR>

func! CompileRunGcc()
	exec "w"
	if expand("%:e") =='c'
		if !isdirectory('build')
			exec "!mkdir build"
		endif
		exec "!gcc  % -o %<"
		exec "!time ./build/%"
	elseif expand("%:e") =='cpp'
		if !isdirectory('build')
			exec "!mkdir build"
		endif
		exec "!g++ % -o %<"
		exec "!time ./%<"
	endif
endfunc




"vim-plug插件管理器安装插件
call plug#begin('~/.vim/plugged')
"Plug'powerline/fonts'

"Plug'joshdick/onedark.vim'

"死马当活马医
set linespace=0

"vim-airline安装
Plug'vim-airline/vim-airline'

"lightline设置
"Plug 'itchyny/lightline.vim'
"let g:lightline = {
"      \ 'colorscheme': 'onedark',
"      \ }
"--------------------Airline设置--------------------
set ttimeoutlen=50
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#symbol='!'
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'


"当只有一个窗口时，标签页显示所有缓冲区
let g:airline#extensions#tabline#enabled = 1
"let g:Powerline_symbols='fancy'

" 关闭空白符检测
let g:airline#extensions#whitespace#enabled=0

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"选项卡显示序号
let g:airline#extensions#tabline#buffer_nr_show=1

"映射切换buffers的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

"映射<leader>num到num buffer
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>


"airline主题插件
Plug'vim-airline/vim-airline-themes'
"设置airline主题为simple
let g:airline_theme='oceanicnext'

set ambiwidth=double

" 主题设置
set background=dark
let g:onedark_termcolors=256
set lazyredraw

colorscheme OceanicNext


"NERD tree目录树
Plug 'preservim/nerdtree'

"NERDTree 相关设置
"映射ctrl+t 
nnoremap<C-t> :NERDTreeToggle<CR>

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1         
let g:NERDTreeHighlightFoldersFullName = 1 

"启动NERD Tree，光标放在另一个窗口
autocmd VimEnter * NERDTree | wincmd p

"在没有文件参数的情况下，启动NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc()==0&&!exists('s:std_in')|NERDTree|endif

"当NERDTree是唯一的一个窗口，请退出Vim
autocmd BufEnter * if (tabpagenr('$')==1 && winnr('$') &&exists('b:NERDTree')&& b:NERDTree.isTabTree())| q |endif
"每个选项卡里都是相同的目录数
autocmd BufWinEnter * silent NERDTreeMirror

"是否显示隐藏文件
let NERDTreeShowHidden = 1
"显示目录树行号
let  NERDTreeShowLineNumbers = 1
"设置目录树宽度
let NERDTreeWinSize =25

"修改NERDTree图标
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▼'
let NERDTreeAutoCenter=1

"安装ctrlp搜索插件
Plug 'ctrlpvim/ctrlp.vim'

"调用ctrlp插件映射
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"设置开始目录
let g:ctrlp_working_path_mode = 'ra'
"定义标记
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']

"如果文件已经在窗口中打开，不会切换到现有窗口，而是创建新窗口重新打开
let g:ctrlp_switch_buffer = 'et'


"设置查找忽略类型文件 Linux and MacOs
set wildignore+=*/tmp/*,*.so,*.swp,*.zip  
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = 'find %s -type f'
"忽略文件中的.gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"安装YouCompleteMe插件
"Plug'Valloric/YouCompleteMe'
"YouCompleteMe插件设置
"set runtimepath+=~/vim/plugged/YouCompleteMe
"let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM 基于标签引擎
"let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
"let g:syntastic_ignore_files=[".*\.py$"]
"let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
"let g:ycm_complete_in_comments = 1
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键, 没有这个会拦截掉tab, 导致其他插件的tab不能用.
"let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
"let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
"let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
"let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
"let g:ycm_global_ycm_extra_conf='~/vim/.ycm_extra_conf.py'
"let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" |            " 回车即选中当前项
"nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|     " 跳转到定义处
"let g:ycm_min_num_of_chars_for_completion=2                 "
"从第2个键入字符就开始罗列匹配项

"coc补全插件安装
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"coc相关设置
 "TextEdit might fail if hidden is not set.
set hidden

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
 set updatetime=300
"
"" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
"
"" Always show the signcolumn, otherwise it would shift the text each time
"" diagnostics appear/become resolved.
if has("patch-8.1.1564")
"" Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


"LeaderF插件安装
"leaderF插件导致vim不能保存退出（死机）
"Plug 'Yggdroot/LeaderF'

""LeaderF相关设置
""不在平常模式中显示帮助
"let g:Lf_HideHelp = 1
"let g:Lf_UseCache = 0
"let g:Lf_UseVersionControlTool = 0
"let g:Lf_IgnoreCurrentBufferName = 1" 
""popup mode浮动模式
"let g:Lf_WindowPosition = 'popup'
"let g:Lf_PreviewInPopup = 1
"let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font':"DejaVu Sans Mono for Powerline" }
"let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
"
"let g:Lf_ShortcutF = "<leader>ff"
"noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
"noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
"noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
"noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
"
"noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ",expand("<cword>"))<CR>
"noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ",expand("<cword>"))<CR>
""search visually selected text literally
"noremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ",leaderf#Rg#visual())<CR>
"noremap go :<C-U>Leaderf! rg --recall<CR>
"
""should use `Leaderf gtags --update` first
"let g:Lf_GtagsAutoGenerate = 0
"let g:Lf_Gtagslabel = 'native-pygments'
"noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump",expand("<cword>"))<CR><CR>
"noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump",expand("<cword>"))<CR><CR>
"noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s","")<CR><CR>
"noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
"noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s","")<CR><CR>

"leaderF
"nnoremap <leader>f :LeaderfFile .<CR>
"let g:Lf_WildIgnore={
"			\'dir':['.svn','.git','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh'],
"			\'file':['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
"			\}
"let g:Lf_UseCache=0
Plug 'vim-latex/vim-latex'

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.

filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex

" can be called correctly.

" set shellslash

" OPTIONAL: This enables automatic indentation as you type.

filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to

" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.

" The following changes the default filetype back to 'tex':

let g:tex_flavor='latex'

" this is mostly a matter of taste. but LaTeX looks good with just a bit
 " of indentation.
 set sw=2

 " TIP: if you write your \label's as \label{fig:something}, then if you
 " type in \ref{fig: and press you will automatically cycle through
 " all the figure labels. Very useful!
 set iskeyword+=:


call plug#end()

