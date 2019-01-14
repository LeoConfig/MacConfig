""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                "
"                                                                "
"             ____         __     ___                            "
"            |  _ \ _ __ __\ \   / (_)_ __ ___                   "
"            | |_) | '__/ _ \ \ / /| | '_ ` _ \                  "
"            |  __/| | | (_) \ V / | | | | | | |                 "
"            |_|   |_|  \___/ \_/  |_|_| |_| |_|                 "
"                                                                "
"                                                                "
"                               Email: liyang.ok@outlook.com     "
"                                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"ReadMe{{{                                                             "
"  安装插件方法(本方案采用Vundle管理插件):                       "
"                                                                "
"     bundle分为三类，比较常用就是第二种：
"
"       1.在Github vim-scripts 用户下的repos,只需要写出repos名称
"       2.在Github其他用户下的repos, 需要写出”用户名/repos名”
"       3.不在Github上的插件，需要写出git全路径
"
"  将安装的插件在~/.vimrc配置，但是我是将插件配置信息放在
"  ~/.vimrc.bundles，所以你会在我的～／.vimrc.bundles里看
"  到我装的插件。
"
"  插件的下载安装：
"
"       1. 终端输入vim，打开vim，正常模式下输入
"               :BundleInstall  回车
"       2.  在终端中直接运行  vim +BundleInstall +qall
"
"  插件更新：
"               :PluginUpdate
"  显示已安装的插件列表：
"               :PluginList
"  清理未使用的插件：
"               :PluginClean
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim快捷键记录
"
"   折叠代码(Normal)：
"       折叠{}内: zf%
"       折叠到86行：zf86G
"       空格键
"
"
"   多行锁进(Visul)：
"       选择多行，按ctrl+v进入visul模式，用>或<缩进或缩出（shift+,)
"
"   显示隐藏历史记录undo：F2
"   显示隐藏左侧nerdtree目录：F3
"   显示隐藏右侧tagbar目录：F4
"   编译：F5
"   显示隐藏内置终端：F6
"   调试：F8
"
"   选中自动补全：\<tab>
"   复制：y是复制2行
"         ny是复制n+1行
"         yy：复制当前行
"         nyy：n表示大于1的数字，复制n行
"         yw：从光标处复制至一个单子/单词的末尾，包括空格
"         ye：从光标处复制至一个单子/单词的末尾，不包括空格
"         y$：从当前光标复制到行末
"         y0：从当前光标位置（不包括光标位置）复制之行首
"         y3l：从光标位置（包括光标位置）向右复制3个字符
"         y5G：将当前行（包括当前行）至第5行（不包括它）复制
"         y3B：从当前光标位置（不包括光标位置）反向复制3个单词
"   粘贴：p
"
"   选择：v+h/j/k/l---d:剪切 y:复制 p:粘贴 ^  --------选中当前行，光标位置到行首（或者使用键盘的HOME键）$  --------选中当前行，光标位置到行尾（或者使用键盘的END键）
"
"   剪切：dd：剪切当前行
"         ndd：n表示大于1的数字，剪切n行
"         dw：从光标处剪切至一个单子/单词的末尾，包括空格
"         de：从光标处剪切至一个单子/单词的末尾，不包括空格
"         d$：从当前光标剪切到行末
"         d0：从当前光标位置（不包括光标位置）剪切之行首
"         d3l：从光标位置（包括光标位置）向右剪切3个字符
"         d5G：将当前行（包括当前行）至第5行（不包括它）剪切
"         d3B：从当前光标位置（不包括光标位置）反向剪切3个单词
"         dH：剪切从当前行至所显示屏幕顶行的全部行
"         dM：剪切从当前行至命令M所指定行的全部行
"         dL：剪切从当前行至所显示屏幕底的全部行
"
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}



"Plugin Config{{{{

    set nocompatible              " be iMproved, required
    filetype off                  " required

    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'vim-airline/vim-airline'
    Plugin 'majutsushi/tagbar'
    Plugin 'luochen1990/rainbow' "彩虹括号
    Plugin 'jiangmiao/auto-pairs'
    Plugin 'Yggdroot/indentLine'
    "代码片段补全
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'

    Plugin 'mbbill/undotree'
    Plugin 'kien/ctrlp.vim'
    Plugin 'tacahiroy/ctrlp-funky'
    Plugin 'tpope/vim-fugitive'
    Plugin 'scrooloose/nerdcommenter'

    Plugin 'DoxygenToolkit.vim'
    Plugin 'tenfyzhong/CompleteParameter.vim'

    Plugin 'davidhalter/jedi-vim'

    Plugin 'mattn/emmet-vim'
    Plugin 'pangloss/vim-javascript'



call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
set noshowmode      " necessary for plugin echodoc.vim


"nerdtree{{{
    autocmd vimenter * NERDTree  
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    let g:NERDTreeDirArrowExpandable = '▸'
    let g:NERDTreeDirArrowCollapsible = '▾'
    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
    let NERDTreeChDirMode=0
    let NERDTreeQuitOnOpen=0
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_gui_startup=0
    map <F3> :NERDTreeToggle<CR>
    autocmd VimEnter * NERDTree
    wincmd w
    autocmd VimEnter * wincmd w
"}}}

"nerdcommenter{{{
    " 注释的时候自动加个空格, 强迫症必配
    let g:NERDSpaceDelims=1
"}}}

"tagbar{{{
    nmap <F4> :TagbarToggle<CR>
    let g:tagbar_ctags_bin='/usr/local/bin/ctags' "设置tagbar使用的ctags的插件,必须要设置对
    let g:tagbar_width=24  "设置tagbar的窗口宽度
    let g:tagbar_left=0  "设置tagbar的窗口显示的位置
"}}}


"doxygen{{{

    let g:DoxygenToolkit_briefTag_pre=" @brief  "
    let g:DoxygenToolkit_paramTag_pre=" @Param "
    let g:DoxygenToolkit_returnTag=" @Returns   "
    let g:DoxygenToolkit_blockHeader=""
    let g:DoxygenToolkit_blockFooter=""
    let g:DoxygenToolkit_authorName=" ly"
    let g:DoxygenToolkit_licenseTag=" ly license"
"}}}

"airline{{{
    " 关闭空白符检测
    let g:airline#extensions#whitespace#enabled=0
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_nr_show = 0
    let g:airline#extensions#whitespace#symbol = '!'

    let g:airline_left_sep = '|'
    let g:airline_left_alt_sep = '|'
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = '|'
"}}}


"rainbow{{{
    let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
"}}}



"CompleteParameter{{{
    inoremap <silent><expr> ( complete_parameter#pre_complete("(")
    smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
    imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
    smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
    imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
    "日志
    let g:complete_parameter_log_level = 5
    let g:complete_parameter_use_ultisnips_mapping = 0
    let g:complete_parameter_echo_signature = 1
    let g:complete_parameter_py_remove_default = 1

    let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
    inoremap <buffer><silent> ) <C-R>=AutoPairsInsert(')')<CR>


"}}}

" UltiSnips {{{
    let g:UltiSnipsExpandTrigger="<leader><tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
    let g:UltiSnipsEditSplit="vertical"
    let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

"}}}

"youcompleteme{{{
    let g:ycm_autoclose_preview_window_after_completion=1
    map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

    let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
    let g:ycm_add_preview_to_completeopt = 0
    let g:ycm_show_diagnostics_ui = 0
    let g:ycm_server_log_level = 'info'
    let g:ycm_min_num_identifier_candidate_chars = 2
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    let g:ycm_complete_in_strings=1
    let g:ycm_max_num_candidates=30
    let g:ycm_max_num_identifier_candidates=30
    let g:ycm_max_diagnostics_to_display=30

    " YCM 补全菜单配色
    " 菜单
    "highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
    "选中项
    "highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
    let g:ycm_complete_in_comments=1      " 补全功能在注释中同样有效

    let g:ycm_confirm_extra_conf=0        " 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示

    let g:ycm_collect_identifiers_from_tags_files=1        " 开启 YCM 标签补全引擎

    "inoremap <leader><tab> <C-x><C-o>           " YCM 集成 OmniCppComplete 补全引擎，设置其快捷键

    set completeopt-=menu,menuone                  " 补全内容不以分割子窗口形式出现，只显示补全列表

    let g:ycm_min_num_of_chars_for_completion=2     " 从第一个键入字符就开始罗列匹配项

    let g:ycm_cache_omnifunc=0        " 禁止缓存匹配项，每次都重新生成匹配项

    let g:ycm_seed_identifiers_with_syntax=1       " 语法关键字补全

    let g:ycm_collect_identifiers_from_tags_files=1      " 开启 YCM 标签引擎

    set tags+=/data/misc/software/misc./vim/stdcpp.tags       " 引入 C++ 标准库tags

    "
    "inoremap <leader>; <C-x><C-o>

    let g:ycm_semantic_triggers =  {
        \   'c' : ['->','.','re![_a-zA-z0-9]'],
        \   'cpp,objcpp' : ['->', '.', '::'],
        \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s', 're!\[.*\]\s'],
        \   'ocaml' : ['.', '#'],
        \   'perl' : ['->'],
        \   'php' : ['->', '::'],
        \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
        \   'ruby' : ['.', '::'],
        \   'lua' : ['.', ':'],
        \   'erlang' : [':'],
        \ }

"}}}


"IndentLine{{{
    let g:indentLine_char = '┆'
"}}}


"Undo{{{
    nnoremap <F2> :UndotreeToggle<cr>
"}}}


"ctrlp{{{
    "<Leader>p搜索当前目录下文件
    let g:ctrlp_map = '<Leader>p'
    let g:ctrlp_cmd = 'CtrlP'
    "<Leader>f搜索MRU文件
    nmap <Leader>f :CtrlPMRUFiles<CR>
    "<Leader>b显示缓冲区文件，并可通过序号进行跳转
    nmap <Leader>b :CtrlPBuffer<CR>
    "设置搜索时忽略的文件
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
        \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
        \ }
    let g:ctrlp_working_path_mode = 0
    let g:ctrlp_match_window_bottom = 1
    "修改QuickFix窗口显示的最大条目数
    let g:ctrlp_max_height = 15
    let g:ctrlp_match_window_reversed = 0
    "设置MRU最大条目数为500
    let g:ctrlp_mruf_max = 500
    let g:ctrlp_follow_symlinks = 1
    "默认使用全路径搜索，置1后按文件名搜索，准确率会有所提高，可以用<C-d>进行切换
    let g:ctrlp_by_filename = 1
    "默认不使用正则表达式，置1改为默认使用正则表达式，可以用<C-r>进行切换
    let g:ctrlp_regexp = 0
    "自定义搜索列表的提示符
    let g:ctrlp_line_prefix = '♪ '
"}}}
"{{{
autocmd QuickFixCmdPost *grep* cwindow
"}}}

"emmet{{{
    "let g:user_emmet_leader_key='<ctrl->'  "切换<ctrl-y>,
    "let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n"))
"}}}


"web{{{

   " let g:javascript_plugin_jsdoc = 1
   " let g:javascript_plugin_ngdoc = 1
   " let g:javascript_plugin_flow = 1

    "let g:javascript_conceal_function             = "ƒ"
    "let g:javascript_conceal_null                 = "ø"
    "let g:javascript_conceal_this                 = "@"
    "let g:javascript_conceal_return               = "⇚"
    "let g:javascript_conceal_undefined            = "¿"
    "let g:javascript_conceal_NaN                  = "ℕ"
    "let g:javascript_conceal_prototype            = "¶"
    "let g:javascript_conceal_static               = "•"
    "let g:javascript_conceal_super                = "Ω"
    "let g:javascript_conceal_arrow_function       = "⇒"
    "let g:javascript_conceal_noarg_arrow_function = "🞅"
    "let g:javascript_conceal_underscore_arrow_function = "🞅"


"}}}



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}}



"general{{{{  

    "set dictionary-=~/.vim/dict.txt dictionary+=~/.vim/dict.txt
    "set complete-=k complete+=k

    "Enable omni completion.
    "autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    "autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    "autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    "autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    "autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    "autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
    "set completeopt-=preview
set cmdheight=2
    syntax on "高亮代码
    set mouse=a "设置光标随鼠标移动
    "set modifiable    "
    set autowrite                       " Automatically write a file when leaving a modified buffer
    set autoread
    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    set hidden                          " Allow buffer switching without saving
    set iskeyword-=.                    " '.' is an end of word designator 让'.' 作为单词分割符
    set iskeyword-=#                    " '#' is an end of word designator
    set iskeyword-=-                    " '-' is an end of word designator
    set iskeyword+=.,_,$,@,%,#,-        "" 带有如下符号的单词不要被换行分割
    set backspace=indent,eol,start  " Backspace for dummies

    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode
    "highlight clear CursorLineNr    " Remove highlight color from current line number
    set cursorline                  " 高亮当前行


    if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

    set showcmd "右下角命令回显

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set list                       "show tab
    set listchars=tab:>\ ,trail:●,extends:#,nbsp:. " Highlight problematic whitespace
    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    "set matchpairs+=<:>             " Match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
    set rnu                         "相对行号
    set number                      " Line numbers on
    augroup relative_numbser        "normal模式时使用相对行号,insert模式绝对行号
        autocmd!
        autocmd InsertEnter * :set norelativenumber
        autocmd InsertLeave * :set relativenumber
    augroup END
    "自动保存折叠码
    set foldmethod=marker
    au FileType c set foldmethod=syntax
    au FileType cpp set foldmethod=syntax
    au FileType java set foldmethod=syntax
    au FileType python set foldmethod=indent
    au FileType css set foldmethod=syntax
    au FileType html set foldmethod=indent
    au FileType javascript set foldmethod=indent

    set foldenable " 开始折叠
    set foldcolumn=4 " 设置折叠区域的宽度
    setlocal foldlevel=20 " 设置折叠层数为
    nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>   " 用空格键来开关折叠
    au BufWinLeave *.* silent mkview  "records settings
    au BufWinEnter *.* silent loadview "reloads settings


    "PEP8风格
    au BufNewFile,BufRead *.py
        \ set tabstop=4 |
        \ set softtabstop=4 |
        \ set shiftwidth=4 |
        \ set textwidth=79 |
        \ set expandtab |
        \ set autoindent |
        \ set fileformat=unix


    au BufNewFile,BufRead  *.html, *.css
        \ set tabstop=2
        \ set softtabstop=2
        \ set shiftwidth=2



    highlight BadWhitespace ctermbg=red guibg=darkred
    au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

    set encoding=utf-8

    "au BufReadPost * if line("'"") > 0|if line("'"") <= line("$")|exe("norm '"")|else|exe "norm $"|endif|endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}}



"keymap{{{{

    "切换Buffer窗口
    imap <S-Left> <ESC>:bp<cr> i
    imap <S-Right> <ESC>:bn<cr> i
    map <S-Left> :bp<cr>
    map <S-Right> :bn<cr>

    "窗口间移动
    map <S-Up> <C-w>h "向左
    map <S-Down> <C-w>l "向右
    map <S-k> <C-w>k "向上
    map <S-j> <C-w>j "向下

    "快捷键打开Vim内置终端
    map <F6> :terminal<cr>

    map <F7> :Dox<cr>


""""""""""'""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'" }}}}



" Functions {{{{

    " 新建.c,.h,.sh,.java文件，自动插入文件头 {{{

    autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()"
    "退出更新编辑时间
    autocmd FileWritePre,BufWritePre *.cpp,*.[ch],*.sh,*.rb,*.java,*.py,*.cpp ks|call DataInsert() |'s

    ""定义函数SetTitle，自动插入文件头
    func SetTitle()
        "如果文件类型为.sh文件
        if &filetype == 'sh'
            call setline(line("."),"\#!/bin/bash")
            call append(line(".")+1,"")
            call append(line(".")+2, '# ***********************************************')
            call append(line(".")+3, '#')
            call append(line(".")+4, '#      Filename: '.expand("%"))
            call append(line(".")+5, '#')
            call append(line(".")+6, '#        Author: ly - liyang.ok@outlook.com')
            call append(line(".")+7, '#        Create: '.strftime("%Y-%m-%d %H:%M:%S"))
            call append(line(".")+8, '# Last Modified: '.strftime("%Y-%m-%d %H:%M:%S"))
            call append(line(".")+9, '#   Description: ---')
            call append(line(".")+10, '#)
            call append(line(".")+11, '# ***********************************************')
            call append(line(".")+12,'')
        elseif &filetype == 'python'
            call append(line("."),"#!/usr/bin/env python")
            call append(line(".")+1,"# coding=utf-8")
            call append(line(".")+2, '# ****************************************************')
            call append(line(".")+3, '#')
            call append(line(".")+4, '#      Filename: '.expand("%"))
            call append(line(".")+5, '#')
            call append(line(".")+6, '#        Author: ly - liyang.ok@outlook.com')
            call append(line(".")+7, '#        Create: '.strftime("%Y-%m-%d %H:%M:%S"))
            call append(line(".")+8, '# Last Modified: '.strftime("%Y-%m-%d %H:%M:%S"))
            call append(line(".")+9, '#   Description: ---')
            call append(line(".")+10, '#')
            call append(line(".")+11, '# ***************************************************')
            call append(line(".")+12,'')
            call append(line(".")+13,"import os")
            call append(line(".")+14,"os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'")
            call append(line(".")+15,"import sys")
            call append(line(".")+16, "")
            "exec ':16<CR>'

        elseif &filetype == 'ruby'
	    call append(line("."),"#!/usr/bin/env ruby")
            call append(line(".")+1,"# encoding: utf-8")
            call append(line(".")+2, '# ****************************************************')
            call append(line(".")+3, '#')
            call append(line(".")+4, '#      Filename: '.expand("%"))
            call append(line(".")+5, '#')
            call append(line(".")+6, '#        Author: ly - liyang.ok@outlook.com')
            call append(line(".")+7, '#        Create: '.strftime("%Y-%m-%d %H:%M:%S"))
            call append(line(".")+8, '# Last Modified: '.strftime("%Y-%m-%d %H:%M:%S"))
            call append(line(".")+9, '#   Description: ---')
            call append(line(".")+10, '#')
            call append(line(".")+11, '# ***************************************************')
            call append(line(".")+12,'')

        elseif &filetype == 'jsp'
            call setline(1,"<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>")
            call append(line(".","<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">"))
            call append(line(".")+1,""))
        else
            call append(line("."),"")
            call append(line(".")+1, '/*************************************************')
            call append(line(".")+2, '*')
            call append(line(".")+3, '*')
            call append(line(".")+4, '*      Filename: '.expand("%"))
            call append(line(".")+5, '*')
            call append(line(".")+6, '*        Author: ly - liyang.ok@outlook.com')
            call append(line(".")+7, '*        Create: '.strftime("%Y-%m-%d %H:%M:%S"))
            call append(line(".")+8, '* Last Modified: '.strftime("%Y-%m-%d %H:%M:%S"))
            call append(line(".")+9, '*   Description: ---')
            call append(line(".")+10, '*')
            call append(line(".")+11, '************************************************/')
            call append(line(".")+12,'')
        endif


        if expand("%:e") == 'cpp'
            call append(line(".")+13, "#include<iostream>")
            call append(line(".")+14, "using namespace std;")
            call append(line(".")+15, "")
        endif


        if &filetype == 'c'
            call append(line(".")+13, "#include<stdio.h>")
            call append(line(".")+14, "")
        endif


        if expand("%:e") == 'h'
            call append(line(".")+13, "#ifndef _".toupper(expand("%:r"))."_H")
            call append(line(".")+14, "#define _".toupper(expand("%:r"))."_H")
            call append(line(".")+15, "#endif")
        endif


        if &filetype == 'java'
            call append(line(".")+13,"public class ".expand("%:r")."{")
            call append(line(".")+14,"")

            call append(line(".")+15,"}")
        endif

        "新建文件后，自动定位到文件末尾
    endfunc


    ""SET Last Modified Time START
    func DataInsert()
        call cursor(9,1)
        if search ('Last Modified') != 0
            let line = line('.')
            call setline(line, '# Last Modified: '.strftime("%Y-%m-%d %H:%M:%S"))
        endif
    endfunc
    
    "SET Last Modified Time END

    "}}}




    "定义FormartSrc(),代码格式 优化 {{{

    map <leader>f :call FormartSrc()<CR><CR>

    func FormartSrc()
        exec "w"
        if &filetype == 'c'
            exec "!astyle --style=ansi --suffix=none % & rm %.orig"
        elseif &filetype == 'cpp' || &filetype == 'hpp'
            exec "r !astyle --style=ansi --suffix=none % & rm %.orig"
        elseif &filetype == 'perl'
            exec "!astyle --style=gnu --suffix=none % & rm %.orig"
        elseif &filetype == 'py'||&filetype == 'python'
            exec "!autopep8 --in-place --aggressive  %"
        elseif &filetype == 'java'
            exec "!astyle --style=java --suffix=none % & rm %.orig"
        elseif &filetype == 'jsp'
            exec "!astyle --style=gnu --suffix=none % & rm %.orig"
        elseif &filetype == 'xml'
            exec "!astyle --style=gnu --suffix=none % & rm %.orig"
        else
            exec "normal gg=G"
            return
        endif
        exec "e! %"
    endfunc

    "}}}


    "按F5 编译运行,F8调试 {{{

    map <F5> :call CompileRunGcc()<CR>

    map <F8> :call Rungdb()<CR>

    func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
        elseif &filetype == 'cpp'
            exec "!g++ % -std=c++11 -o %<"
            exec "!time ./%<"
        elseif &filetype == 'java'
            exec "!javac %"
            exec "!time java %<"
        elseif &filetype == 'sh'
            :!time bash %
        elseif &filetype == 'python'
            exec "source ~/venv/bin/activate"
            exec "!time python3 %"
        elseif &filetype == 'html'
            exec "!google-chrome % &"
        elseif &filetype == 'go'
            exec "!go build %<"
            exec "!time go run %"
        elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"
        endif
    endfunc

    func! Rungdb()
        exec "w"
        exec "!g++ % -std=c++11 -g -o %<"
        exec "!gdb ./%<"
    endfunc
    "}}}


    " 在浏览器预览 for Mac{{{
    function! ViewInBrowser(name)
        let file = expand("%:p")
        let l:browsers = {
            \"cr":"open -a \"Google Chrome\"",
            \"sf":"open -a Safari",
        \}

        let file = '"'. file . '"'
        exec ":update " .file
        exec ":silent!" .l:browsers[a:name] ." file://". file
    endfunction
    nmap <Leader>cr :call ViewInBrowser("cr")<cr>
    nmap <Leader>sf :call ViewInBrowser("sf")<cr>:e<cr>
    "}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}}



"让配置变更立即生效

autocmd BufWritePost $MYVIMRC source $MYVIMRC

