set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line




set nocompatible               " Disables Vi-compatibility
syntax on                      " Syntax coloring^Z
syntax sync minlines=256       " Minimum number of lines to search backward for syntax tips
filetype plugin indent on      " Automatically finds and load specific plugin

colorscheme apprentice         " Color scheme name
set background=dark            " Dark background
set t_Co=256                   " Set 256 colors



" SETS {{{
"
set spelllang=en_us            " Source spell checking definitions if available
set dictionary=dict            " List of file names, separated by commas, that are used to lookup words for keyword completion commands i_CTRL-X_CTRL-K.

set shortmess=a                " Reduce lenght of "Hit ENTER to continue" prompt messages
set showcmd                    " Display incomplete commands
set wildmenu                   " Command-line completion operates in an enhanced mode.
set wildmode=longest,list,full " Completion mode that is used for the character specified with 'wildchar'.
set visualbell                 " Use visual bell instead of beeping.

set cursorcolumn               " Highlight the column where the cursor is currently present
set cursorline                 " Highlight the line where the cursor is currently present
set ruler                      " Show the cursor position all the time
set number                     " Precede each line with its line number.
set relativenumber             " Show the line number relative to the line with the cursor in front of each line.
set scrolloff=5                " Determine the minimum number of context line visible above and below the curosr

set autoindent                 " Copy indent from current line when starting a new line.
set smartindent                " Automatically inserts one extra level of indent
set shiftwidth=4               " Control how many columns text is indented with
set tabstop=4                  " How many columns a tab counts for
set wrap                       " Wrap lines longer than the windows width.
"set foldenable                 " Enable folding
"set foldmethod=indent          " Fold based on indent level
set tabpagemax=100             " Change maximum number of tabs
set expandtab                  " Replace tabs with spaces
set backspace=indent,eol,start " Allow proper backspacing over special symbols.

set showmatch                  " When a bracket is inserted, briefly jump to the matching one.
set matchtime=2                " Tenths of a second to show the matching bracket.

set hidden                     " Allow buffer switching without saving/wirte
set clipboard+=unnamedplus     " Everything  yanked in vim will go to the unnamed register, and vice versa.
set undolevels=9999999         " Maximum number of changes that can be undone.
set history=2000               " Keep 50 lines of command line history

set title                      " When on, the title of the window will be set to the value of 'titlestring'.
set laststatus=2               " Always show status line

set hlsearch                   " Highlight searched text
set incsearch                  " Do incremental searching

set ignorecase                 " The case of normal letters is ignored.
set smartcase                  " Override the 'ignorecase' option if the search pattern contains upper case characters.


set nobackup                   " Doesn't make a backup before overwriting a file.
set noswapfile                 " Disables creating swap files.
set sessionoptions-=options    " Changes the effect of the :mksession command.

set splitbelow                 " Open new split panes to bottom, instead top
set splitright                 " Open new split panes to right, instead of left
set autoread                   " Auto reload if file saved externally
set listchars=eol:Â¬,tab:>Â·,trail:~,extends:>,precedes:<,space:?
                               " Set list to show spaces
set ff=unix
"set tags=/var/fpwork/$USER/universalTags/tags
let &path.="src/include,/usr/include/AL,/usr/include/c++/4.4.7,/$HOME/gnuglobal/6.5.2/bin,/var/fpwork/$USER/trunk/C_Test/**,/var/fpwork/$USER/trunk/C_Application/**,/var/fpwork/$USER/trunk/lteDo/I_Interface/Application_Env/**,/var/fpwork/$USER/trunk/lteDo/I_Interface/Private/**,,"
set makeprg=make\ -C\ ../build\ -j9

" }}}

filetype off
call plug#begin()
Plug 'easymotion/vim-easymotion'
Plug 'rhysd/clever-f.vim'
Plug 'sickill/vim-pasta'
"Plug 'justincampbell/vim-eighties'
Plug 'machakann/vim-highlightedyank'
Plug 'mhinz/vim-signify'
Plug 'osyo-manga/vim-brightest'
"Plug 'takac/vim-hardtime'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

" maps {{{

"change  to ,
let mapleader=','

"move through splits
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" jk | Escaping!
"xnoremap jk <Esc>
"cnoremap jk <C-c>
"inoremap jk <Esc>
"inoremap kj <esc>

" Readline-style key bindings in command-line (excerpt from rsi.vim)
cnoremap        <C-A> <Home>
cnoremap        <C-B> <Left>
cnoremap <expr> <C-D> getcmdpos()>strlen(getcmdline())?"\<Lt>C-D>":"\<Lt>Del>"
cnoremap <expr> <C-F> getcmdpos()>strlen(getcmdline())?&cedit:"\<Lt>Right>"

"fzf
map <C-p> :Files<cr>

"grep fzf
map <leader>ag :Ag <c-r><c-w><cr>

"open vimrc
map vv <Esc>:tabe $MYVIMRC<CR>

"space in normal mode
nnoremap <space> i<space><esc>

"tags open in vertical split
"map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>zz
"map <C-]> <C-]>zz

"move line in visual
vnoremap < <gv
vnoremap > >gv

"quit file
nnoremap qq :q<cr>

"copy from cursor to end line
noremap Y y$

"save file
map <leader>w :w<cr>

"4.6.0_64     " }}}


" undo files {{{
if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif
" }}}




" hardtime {{{
let g:hardtime_ignore_buffer_patterns = ["init.vim"]
let g:hardtime_default_on = 1
let g:hardtime_ignore_quickfix = 1
let g:hardtime_maxcount = 0
" }}}

" fzf {{{

let g:fzf_files_options =
			\ '--preview "/opt/python-pygments/noarch/2.2.0.p360-1/bin/pygmentize {}"'

" ag with preview
command! -bang -nargs=* Ag
		\ call fzf#vim#ag(<q-args>, ' --color-path 400 --color-line-number 400',
		\                 <bang>0 ? fzf#vim#with_preview('up:60%')
		\                         : fzf#vim#with_preview('right:50%:wrap', '?'),
		\                 <bang>0)

" fzf colors like colorscheme
function! s:update_fzf_colors()
let rules =
			\ { 'fg':      [['Normal',       'fg']],
			\ 'bg':      [['Normal',       'bg']],
			\ 'hl':      [['Comment',      'fg']],
			\ 'fg+':     [['CursorColumn', 'fg'], ['Normal', 'fg']],
			\ 'bg+':     [['CursorColumn', 'bg']],
			\ 'hl+':     [['Statement',    'fg']],
			\ 'info':    [['PreProc',      'fg']],
			\ 'prompt':  [['Conditional',  'fg']],
			\ 'pointer': [['Exception',    'fg']],
			\ 'marker':  [['Keyword',      'fg']],
			\ 'spinner': [['Label',        'fg']],
			\ 'header':  [['Comment',      'fg']] }
let cols = []
for [name, pairs] in items(rules)
	for pair in pairs
		let code = synIDattr(synIDtrans(hlID(pair[0])), pair[1])
		if !empty(name) && code > 0
			call add(cols, name.':'.code)
			break
		endif
	endfor
endfor
let s:orig_fzf_default_opts = get(s:, 'orig_fzf_default_opts', $FZF_DEFAULT_OPTS)
let $FZF_DEFAULT_OPTS = s:orig_fzf_default_opts .
			\ empty(cols) ? '' : (' --color='.join(cols, ','))
endfunction

" }}}

" Easy Motion {{{

" maping easy search and easy motion
nmap s <Plug>(easymotion-overwin-f2)
"let g:EasyMotion_skipfoldedline = 0
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-bd-jk)
map <Leader>k <Plug>(easymotion-k)
" map  z/ <Plug>(easymotion-sn)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 0
" colors
hi EasyMotionTarget ctermfg=1 cterm=bold,underline
hi link EasyMotionTarget2First EasyMotionTarget
hi EasyMotionTarget2Second ctermfg=1 cterm=underline

" }}}

" yank highlight {{{
map y <Plug>(highlightedyank)
let g:highlightedyank_highlight_duration = 1200
" }}}

" eighties {{{
let g:eighties_enabled = 1
let g:eighties_minimum_width = 120
let g:eighties_extra_width = 0 " Increase this if you want some extra room
let g:eighties_compute = 1 " Disable this if you just want the minimum + extra
let g:eighties_bufname_additional_patterns = ['fugitiveblame']
" }}}

" remember the line I was on when I reopen a file
autocmd BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\ exe "normal! g`\"" |




for tagfile in split(globpath('$PWD/.tags/', '*'), '\n')
	let &tags .= ',' . tagfile
endfor


function! Switch_HPP_CPP()
    if match(expand("%"),'\.cpp') > 0
        let s:flipname = substitute(expand("%"),'\.cpp\(.*\)','\.hpp\1',"")
        let s:flipname = substitute(s:flipname, 'Source','Include',"")
    else
        let s:flipname = substitute(expand("%"),'\.hpp\(.*\)','\.cpp\1',"")
        let s:flipname = substitute(s:flipname, 'Include', 'Source', "")
    endif
    exe ":e " s:flipname
endfun



" My maps


function! ToggleMouse()
    if &mouse == 'a'
        set mouse=
    else
        set mouse=a
    endif
endfun

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

map     <F2> <C-]>
map     <F3> <C-T>
map     <F4> :call Switch_HPP_CPP()<CR>

map     <F5> :split<CR>
map     <F6> :vsplit<CR>
map     <F7> :only<CR>
map     <F8> :set wrap!<CR>

map     <F9> :set wrap!<CR>
map     <F10> :call ToggleMouse()<CR>
map     <F11> :e %:h<CR>
map     <F12> :tabe %:h<CR>

set colorcolumn=130
let g:ttcn_fold = 1
autocmd BufRead,BufNewFile *.ttcn3 setfiletype ttcn3

let @w = 'V€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kdd0vwww€kldA€kb€kb€kb€kb€kdV€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kdd'

let @e = 'V€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kdd0vwwww€kldA€kb€kb€kdV€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kdd'

let @r = 'V€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kdd0vwwww€kldA€kb€kb€kdV€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kdd'

let @s = 'V€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kdd0vwww€kldA€kb€kb€kb€kb€kdV€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kdd'

let @d = 'V€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kdd0vwwww€kldA€kb€kb€kdV€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kdd'

let @f = 'V€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kdd0vwwww€kldA€kb€kb€kdV€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kdd'

let @x = 'V€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kdd0vwww€kldA€kb€kb€kb€kb€kdV€kdd'

let @t = 'V€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kdd0vwww€kldA€kb€kb€kb€kb€kdV€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kdd'

let @y = 'V€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kdd0vwwww€kldA€kb€kb€kb€kdV€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kdd@'

let @u = 'V€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kdd0vwwww€kldA€kb€kb€kdV€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kdd'

let @g = 'V€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kdd0vwww€kldA€kb€kb€kb€kb€kdV€kd€kd€kd€kd€kd€kd€kd€kd€kd€kdd'

let @h = 'V€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kdd0vwwww€kldA€kb€kb€kdV€kd€kd€kd€kd€kd€kd€kd€kd€kdd'

let @j = 'V€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kd€kdd0vwwww€kldA€kb€kb€kdV€kd€kd€kd€kd€kd€kd€kd€kdd'
