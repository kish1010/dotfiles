"  Author:              Kishor Balbudhe
"  Created:             Mon 25 Feb 2013 07:09:38 PM IST
"  Last Modified:       Mon 08 Apr 2013 07:16:59 PM IST

" behave xterm               " Sets selectmode, mousemodel, keymodel, selection"
" 
" if &term =~ "xterm" || &term =~ "screen"
"     set t_Co=256
" endif
" 
" let xterm16_brightness = 'default'     " Change if needed
" let xterm16_colormap = 'soft'       " Change if needed 
" colorscheme xterm16    " Console uses xterm16, gui uses peaksea
let g:mapleader = "."

set t_Co=256

if has("unix")
    set dictionary=/usr/share/dict/words  " Use with i-ctrl-X ctrl-K
endif

"""My edits start here
let color='true'
if has("syntax")
    if color == "true"
        " This will switch colors ON
        so ${VIMRUNTIME}/syntax/syntax.vim
    else
        " " this switches colors OFF
        " let xterm16_colormap = 'allblue'       " Change if needed "FF
        syntax off
        set t_Co=0
    endif
endif

"""My edits end here

syntax on
set background=dark
set ruler                     " show the line number on the bar
set more                      " use more prompt
set autoread                  " watch for file changes
set number                    " line numbers
set hidden
set noautowrite               " don't automagically write on :next
set lazyredraw                " don't redraw when don't have to
set showmode
set showcmd
set nocompatible              " vim, not vi
set autoindent smartindent    " auto/smart indent
set smarttab                  " tab and backspace are smart
set tabstop=8                 " 4 spaces
set shiftwidth=4
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set softtabstop=2
set expandtab
set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set scrolljump=-50      " Scroll half the window height when move off screen"
set history=1000
set backspace=indent,eol,start
set wildignore=*.swp,*.bak,*.pyc,*.class,*.out,*.exe
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set linebreak
set cmdheight=2               " command line two lines high
set undolevels=1000           " 1000 undos
set updatecount=100           " switch every 100 chars
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set ttyfast                   " we have a fast terminal
set noerrorbells              " No error bells please
set shell=bash
set fileformats=unix
set ff=unix
filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins
set wildmode=list,longest:full
set wildmenu                  " menu has tab completion
set wildchar=<TAB>      " Character to start command line completion"
let maplocalleader=','        " all my macros start with ,
set laststatus=2

"  searching
set incsearch                 " incremental search
set ignorecase                " search ignoring case
set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set diffopt=filler,iwhite     " ignore all whitespace and sync

"  backup
set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo
"set viminfo='100,f1

" spelling
if v:version >= 700
    " Enable spell check for text files
    autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en
endif

" mappings
" toggle list mode
nmap <LocalLeader>tl :set list!<cr>
" toggle paste mode
nmap <LocalLeader>pp :set paste!<cr>


"   Set line numbering to take up 5 spaces
set numberwidth=3 "Highlight current line
" set cursorline

"Turn on spell checking with English dictionary
"set spell
"set spelllang=en
"set spellsuggest=9 "show only 9 suggestions for misspelled words

""My edits
:se mouse=a

"Omni_Completion
set ofu=syntaxcomplete#Complete

"Mappings
set pastetoggle=<F2>
map <F3> :NERDTreeToggle<CR>
" tab navigation like firefox

:map  <C-ScrollWheelUp> :tabprevious <CR>
:map  <C-ScrollWheelDown> :tabnext     <CR>

:map <C-a> :tabprevious <CR>
:map <C-z> :tabnext <CR>

:map <ScrollWheelUp> k 
:map <ScrollWheelDown> j 

" :nmap <C-t> :tabnew<CR>
" :imap <C-t> <Esc>:tabnew<CR>

" Template files for C++, LaTeX
autocmd! BufNewFile * silent! 0r ~/.vim/templates/temp.%:e

" Easy semicolon insertion for C++, will mess with other programs!!
inoremap ;<cr> <end>;<cr>
inoremap .<cr> <end>.
inoremap ;;<cr> <down><end>;<cr>
inoremap ..<cr> <down><end>.

" Disable automatic commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Attempts at staying away from Insert mode and arrow keys!!
"inoremap <Left>  <NOP>
"inoremap <Right> <NOP>
"inoremap <Up>    <NOP>
"inoremap <Down>  <NOP>
" imap jj <ESC>

" Easily insert or delete blank lines above or below the current line in Normal mode!
nnoremap <F5>  m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <F6>  m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <F7> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <F8> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Stupid shift key fixes
" cmap W w                       
" cmap WQ wq
" cmap wQ wq
" cmap Q q
" Latex bindings
let g:LatexBox_latexmk_options = "-pvc -pdf"

" Automatically update copyright notice with current year
autocmd BufWritePre *
            \ if &modified |
            \   exe "g#\\cCOPYRIGHT \\(".strftime("%Y")."\\)\\@![0-9]\\{4\\}\\(-".strftime("%Y")."\\)\\@!#s#\\([0-9]\\{4\\}\\)\\(-[0-9]\\{4\\}\\)\\?#\\1-".strftime("%Y") |
            \ endif

let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>


" Latex bindings to view on the go
map  :w!:!clear; echo Making Postscript % ...; latex %; okular %<.dvi & 2&>1 >/dev/null

" highlighting tabs, trailing white space and non braking spaces
if &term !=# "linux"
   set list listchars=tab:\➜\ ,trail:·,nbsp:-
endif

" Powerline edits
set nocompatible
set laststatus=2
let g:Powerline_symbols = 'unicode'
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" Commenting blocks of code.
" autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
" autocmd FileType sh,ruby,python   let b:comment_leader = '# '
" autocmd FileType conf,fstab       let b:comment_leader = '# '
" autocmd FileType tex,m            let b:comment_leader = '% '
" autocmd FileType mail             let b:comment_leader = '> '
" autocmd FileType vim              let b:comment_leader = '" '
" autocmd FileType lua              let b:comment_leader = '-- '
" noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
" noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
