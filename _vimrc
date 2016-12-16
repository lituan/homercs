"general
set ttyfast
set nocompatible " be iMproved
set nobackup
set noswapfile
set autoread     " auto read file when changed outside vim
set autowrite    " auto save file when use :make :next etc.
set mouse=a      " use mouse
set nowrap       " do not wrap lines
set wildmenu     " visual autocomplete for command menu
set backspace=2  " allow backspacing over autoindent,EOL, and BOL
set title
set ambiwidth=double
set cmdheight=2

"general mapping
let mapleader=';'
map       <leader>s :w<cr>
imap      <leader>s <esc>:w<cr>
vmap      <leader>s <esc>:w<cr>
inoremap  jk <esc>

"use system clipboard
set clipboard=unnamed

"auto source vimrc when editting
autocmd! BufWritePost $MYVIMRC source $MYVIMRC


"encoding
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
"if has('win32') || has('win64')
"    language messages zh_CN.utf-8
"endif

"menu encoding
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim

"tab and indent
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent

"UI
set ruler             " show ruler on rightbottom,show positions etc.
set number            " show linenumber
set showmatch         " highlight matching [{()}]
set showcmd           " show command in bottom bar
set cursorline        " highlight current line
"if has('gui_running')
    "set guioptions+=c " use console dialogs instead
    "set guioptions-=m " hide menubar
    "set guioptions-=T " hide left scrollbar
    "set guioptions-=L " hide right scrollbar
    "set guioptions-=r " hide bottom scrollbar
    "set guioptions-=b " highlight current line
"endif


" Plugin manager
let win_shell = (has('win32') || has('win64')) && &shellcmdflag =~ '/'
let vimDir = win_shell ? '$HOME/vimfiles' : '$HOME/.vim'
let &runtimepath .= ',' . expand(vimDir . '/bundle/Vundle.vim')
call vundle#rc(expand(vimDir . '/bundle'))

call vundle#begin()
Plugin 'tpope/vim-surround'                  " normal mode mappings, provide normal command cs ds ys yS yss ySs ,visual mode s S
Plugin 'jiangmiao/auto-pairs'                " auto close brakets,braces..
Plugin 'scrooloose/nerdcommenter'            " maping start with <leader>c , mannualy change c-a and c-A, change c-space to c
Plugin 'tpope/vim-repeat'                    " enhanced .
Plugin 'ntpeters/vim-better-whitespace'      " whitespacPlugin 'tpope/vim-fugitive'e
Plugin 'tpope/vim-fugitive'                  " git
Plugin 'godlygeek/tabular'                   " align text, start with tab/ :,=
Plugin 'junegunn/vim-easy-align'             " align text, start with ga
" search
Plugin 'easymotion/vim-easymotion'
Plugin 'haya14busa/incsearch.vim'            " inproved incremental searching, highlight all matches
Plugin 'haya14busa/incsearch-fuzzy.vim'      " modules of incsearch.vim
Plugin 'haya14busa/incsearch-easymotion.vim' " integrate incsearch.vim with easymotion
" autocomplete
Plugin 'Valloric/YouCompleteMe'
"Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" colore scheme and UI
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'              "one shop for vim colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'tomasr/molokai'
Plugin 'chriskempson/base16-vim'
Plugin 'nathanaelkane/vim-indent-guides'     " show indent lines, one maping <leader>i
Plugin 'kien/rainbow_parentheses.vim'        " show colorful brace
" color picker
Plugin 'KabbAmine/vCoolor.vim'
" python
Plugin 'tell-k/vim-autopep8'                 " auto fix python code according to pep8 <F8>
Plugin 'nvie/vim-flake8'                     " auto check python syntax <F7>
Plugin 'hynek/vim-python-pep8-indent'
call vundle#end()
filetype plugin indent on


"color scheme and UI
syntax enable
syntax on
colorscheme molokai
set background=dark
"set t_Co=26  "vim will detect the TERM color and auto configure this variable
set laststatus=2                           " show statusline all the time
set gfn=Powerline_Consolas:h14
" airline
let g:airline_powerline_fonts=1            " show powerline symbol
let g:airline#extensions#tabline#enabled=1 " show all buffers
"better rendering in windows using directx
if (has('win32') || has('win64'))
    set rop=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1
endif

"indent-guides
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1

"rainbow parenses
"always on
au VimEnter * RainbowParenthesesToggle
au Syntax   * RainbowParenthesesLoadRound
au Syntax   * RainbowParenthesesLoadSquare
au Syntax   * RainbowParenthesesLoadBraces

"autocomplete
"complete passed by ultisnips will be passed to supertab then youcomplete
"utilsnips
let g:UltiSnipsExpandTrigger           = '<TAB>'
let g:UltiSnipsJumpForwardTrigger      = '<TAB>'
let g:UltiSnipsJumpBackwardTrigger     = '<S-TAB>'
"youcomplete
let g:ycm_key_list_select_completion   = [ '<C-TAB>','<Down>' ]
let g:ycm_key_list_previous_completion = [ '<C-S-TAB>','<Up>']
"supertab
let g:SuperTabDefaultCompletionType    = '<C-TAB>'
let g:SuperTabDefaultCompletionType    = '<C-X><C-O>'
" jedi-vim

"nerdcomment
map <leader>cA <plug>NERDCommenterAltDelims
map <leader>ca <plug>NERDCommenterAppend

"easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"search
set hlsearch "search as characters are matched
set incsearch "highlight matches
set ignorecase "ignore case when searching
set smartcase "case-sensitive when there is upper case
"incsearch
let g:incsearch#auto_nohlsearch = 1
map *   <Plug>(incsearch-nohl-*)
map #   <Plug>(incsearch-nohl-#)
map g*  <Plug>(incsearch-nohl-g*)
map g#  <Plug>(incsearch-nohl-g#)
"incsearch-fuzzy
map z/  <Plug>(incsearch-fuzzy-/)
map z?  <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)
"incsearch-easymotion
map /   <Plug>(incsearch-easymotion-/)
map ?   <Plug>(incsearch-easymotion-?)
map g/  <Plug>(incsearch-easymotion-stay)
"easymotion
"let g:EasyMotion_do_mapping = 0 "Disable default mappings
map <leader>  <Plug>(easymotion-prefix)
nmap s        <Plug>(easymotion-overwin-f2)
map  n        <Plug>(easymotion-next)
map  N        <Plug>(easymotion-prev)
map <leader>h <Plug>(easymotion-linebackwark)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>l <Plug>(easymotion-lineforward)
let g:EasyMotion_startofline=0
let g:EasyMotion_smartcase=1

"auto strip trailing whitespace
autocmd BufWritePre * StripWhitespace

