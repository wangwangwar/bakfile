" vi: set ts=2 sw=2 st=2:
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"我的设置 
colorscheme desert
" Toggle menu and toolbar
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
	\set guioptions-=T <Bar>
	\set guioptions-=m <Bar>
\else <Bar>
	\set guioptions+=T <Bar>
	\set guioptions+=m <Bar>
\endif<CR>
" misc
" set cindent
set nobackup
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set number
set ignorecase
set enc=utf-8
set fencs=utf-8,gb18030,gbk,gb2312
set langmenu=zh_CN.UTF-8
set showmatch
set scrolloff=3
"set guifont=DejaVu\ Sans\ Mono
set guifont=Source\ Code\ Pro
"set guifontwide=WenQuanYi\ Zen\ Hei\ Sharp
" folding for html using indent
set foldenable
autocmd Filetype html set foldmethod=indent
" 自动加载变动文件
set autoread

" 总是显示状态栏
set laststatus=2
"set nowrapscan
"set nowrap
" path for gf find and so on
" set path=.,/wang/Programming/linux-source-3.5.0/include,/usr/include

" import Vundle 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
" let Vundle manage Vundle
Bundle 'gmarik/Vundle.vim'

""""""""""" vim-scripts repos """""""""""""
" speed the moving
Bundle 'vim-scripts/EasyMotion'
" markdown syntax
Bundle 'plasticboy/vim-markdown'
" ctags
"Bundle 'vim-scripts/ctags.vim'
" cscope
"Bundle 'vim-scripts/cscope.vim'
"Bundle 'vim-scripts/autoload_cscope.vim'
" CtrlP
Bundle 'kien/ctrlp.vim'
" C extension for CtrlP
Bundle 'JazzCore/ctrlp-cmatcher'
" python
" python-mode, including vim-virtualenv, pyflask, pylint ...
Bundle 'klen/python-mode'
" python3 syntax and indent
Bundle 'mitsuhiko/vim-python-combined'
" YouCompleteMe
Bundle 'Valloric/YouCompleteMe'
" syntasitc 支持各种语法检查
Bundle 'scrooloose/syntastic'
" surround
Bundle 'tpope/vim-surround'
" vim airline, better status bar
Bundle 'bling/vim-airline'
" scheme, slimv
"Bundle 'vim-scripts/slimv.vim'
" ML
Bundle 'vim-scripts/sml_polyml.vim'
Bundle 'chilicuil/vim-sml-coursera'
" io
Plugin 'fmoralesc/vim-iolang'

""""""""""" vim-scripts repos """""""""""""
filetype plugin indent on

" markdown
au FileType markdown setl noexpandtab 

" ctags for c file
au FileType c setl tags=/wang/Programming/linux-source-3.5.0/tags

" cscope
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=0
  " set cst
  " set nocsverb
  set csverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
  endif
endif
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
" quickfix, for cscope
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :cw 10<cr>


" ctrlp, great file opener
noremap <C-W><C-U> :CtrlPMRU<CR>
nnoremap <C-W>u :CtrlPMRU<CR>
let g:ctrlp_working_path_mode=0
let g:ctrlp_open_new_file='r'
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$|(bower_components$|node_modules$)',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
"""""""""""""""""""" C """"""""""""""""""""""""""""
au FileType c setl tags+=~/program/c/ngx_openresty-1.4.2.9/bundle/nginx-1.4.2/src/tags
au FileType c setl tags+=/usr/include/tags

"""""""""""""""""  Python  """"""""""""""""""""""""
au FileType python setl expandtab
""""""""""""""""" pymode """"""""""""""""""""""""""
" close rope
let pymode_rope=0
""""""""""""""""" syntastic """""""""""""""""""""""
" Because we have `pymode` which is more powerful for python,
" we disable `syntastic` in python.
"let g:syntastic_mode_map = { 'mode': 'active',
"                           \ 'active_filetypes': [],
"                           \ 'passive_filetypes': ['python'] }
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_javascript_jshint_args=['-c ~/.jshintrc']
"""""""""""""""" YouCompleteMe """"""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_path_to_python_interpreter = '/usr/bin/python'
"let g:ycm_add_preview_to_completeopt = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_key_invoke_completion = '<C-a>'
"let g:ycm_extra_conf_globlist = ['/*']
"let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_use_vim_stdout = 1

""""""""""""""""" Scheme """"""""""""""""""""""""""
au FileType scheme setl ts=2 sw=2 sts=2

""""""""""""""""" Racket """"""""""""""""""""""""""
"let g:paredit_mode = 0
"let g:slimv_swank_cmd = '! urxvt -e racket --load ~/.vim/bundle/slimv.vim/slime/contrib/swank-mit-scheme.scm &'

""""""""""""""""" git """""""""""""""""""""""""""""
" git commit format
autocmd Filetype gitcommit setlocal spell textwidth=72

""""""""""""""""" Markdown """"""""""""""""""""""""
autocmd Filetype mkd setlocal spell

"""""""""""""""""" Ruby """""""""""""""""""""""""""
au FileType ruby setl ts=2 sw=2 sts=2
au FileType cucumber setl ts=2 sw=2 sts=2
