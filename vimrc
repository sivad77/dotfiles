" This must be first, because it changes other options as a side effect.
set nocompatible


call pathogen#infect()

"let g:complexity_always_on = 1

set guifont=fixed
set shiftwidth=2
set tabstop=2
set expandtab           " tabs -> spaces
set ls=2
set autoindent
set number
set showmode
set hlsearch
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set nowrap
" set mousehide
" set the mouse to work in the console
set mouse=a
set history=500          " keep 50 lines of command line history
set ruler                " show the cursor position all the time
set showcmd              " display incomplete commands
set incsearch            " do incremental searching
set ignorecase smartcase " default to case insensitive unless caps in regex
set backup               " keep a backup file
set backupdir=~/.vim/backup/ " and keep it out of the way

" Don't use Ex mode, use Q for formatting
" reflow para with Q
nnoremap Q gqap
" reflow selected with Q in visual mode
vnoremap Q gq
imap <M-F> <esc>:gqip<CR>
map <M-F> <esc>:gqip<CR>

" overwrite those annoying commands I always mistype
:command W w
:command Q q

""map non-insert motion keybindings to work in insert mode when holding CTRL
"imap <C-H> <Left> " this interferes with backspace ... so the rest can go too
"imap <C-L> <Right>
"imap <C-J> <Down>
"imap <C-K> <Up>

""""" WINDOW MANAGEMENT
"
" fast switching / maximization of window panes
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
" and vsplits
map <C-H> <C-W>h<C-W><bar>
map <C-L> <C-W>l<C-W><bar>
" and lets make these all work in insert mode too ( <C-O> makes next cmd
" happen as if in command mode )
imap <C-W> <C-O><C-W>
" use - and + to resize horizontal splits
map - <C-W>-
map + <C-W>+
" and for vsplits with alt-< or alt->
" why isn't this working?
map <M->> <C-W>>
map <M-<> <C-W><
" make min winsize just the filename line
" set winminheight=2

" emacs style keybindings for motion
" start
cnoremap <C-A> <home>
" end
cnoremap <C-E> <end>
map <F9> :set makeprg=make<cr>:w<cr>:make<cr>
map <F10> :set makeprg=make\ run<cr>:w<cr>:make<cr>

"" vim 7 omnicompletion 
" doesn't quite work
if has("autocmd") && exists("omnifunc")
  autocmd Filetype * 
     if &omnifunc == "" |
       setlocal omnifunc=syntaxcomplete#Complete |
     endif
endif

" open new files using v from explorer on the right
let g:netrw_altv = 1

map <C-F1> :tabfirst<CR>
map <C-F2> :tablast<CR>
map <F1> :tabp<CR>
map <F2> :tabn<CR>
map <F3> :!irb<CR>
map <F4> :!ri 
map <F5> :!bash

" look upwards recursively for tags files
set tags=tags;/

" snippets and shortcuts
imap ;) ()<esc>i
imap ;> <><esc>i
imap ;] []<esc>i
imap ;} {}<esc>i
imap #{ #{}<esc>i


"" highlighting rules
"
"highlight RedundantSpaces ctermbg=yellow guibg=yellow
"match     RedundantSpaces /\s\+$\| \+ze\t/
"
" make hlsearch show stuff up on a nice red background
hi Search       term=reverse  ctermbg=Red     ctermfg=White guibg=Red guifg=White

map <F6> :set number!<CR>
map <F7> :set hlsearch!<CR>
syntax on

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
  " Don't do it when the position is invalid or when inside an event  handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

endif " has("autocmd"








set viminfo='10,\"100,:20,%,n~/.viminfo
set spell
set wrap
set wildmenu
set hidden

let mapleader = ","
let g:mapleader = ","




function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>


:set t_Co=256
:set background=dark
:color grb256


autocmd BufEnter *.py,*.c,*.rb,*.html,*.haml,*.erb,*.rjs,*.css,*.js :Rooter

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
