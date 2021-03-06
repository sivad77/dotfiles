" KEYBINDINGS

" Remap leader to ',' which is much easier than '\'
let mapleader = ","

" Yank from the cursor to the end of the line, to be consistent with C and D
nnoremap Y y$

map <leader>y "*y
map <leader>p "*p

map <leader>y "*y
map <leader>p "*p

" Trim & save
noremap <Leader>fw :FixWhitespace<CR>:w<CR>

" Buffer navigation
noremap <Leader><Leader> <C-^>

" Quickly open/source .vimrc/.gvimrc
nnoremap <Leader>vv :e $MYVIMRC<CR>
nnoremap <Leader>gg :e $MYGVIMRC<CR>
nnoremap <Leader>ss :source $MYVIMRC<Bar>:source $MYGVIMRC<CR>

" Toggle invisibles
noremap <Leader>i :set list!<CR>

" Bookmarking
noremap <C-Space> :ToggleBookmark<CR>
noremap <C-Up>    :PreviousBookmark<CR>
noremap <C-Down>  :NextBookmark<CR>

" Colorscheme scroll
noremap <C-Left>  :PREVCOLOR<CR>
noremap <C-Right> :NEXTCOLOR<CR>

" Movement & wrapped long lines
" This solves the problem that pressing down jumps your cursor 'over' the current line to the next line
nnoremap j gj
nnoremap k gk

" Easy window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Move around in insert mode
inoremap <C-h> <left>
inoremap <C-k> <up>
inoremap <C-j> <down>
inoremap <C-l> <right>

" Remove annoying F1 help
inoremap <F1> <nop>
nnoremap <F1> <nop>
vnoremap <F1> <nop>

" Reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" Clear search
noremap <silent><Leader>/ :nohls<CR>

" Substitute
nnoremap <Leader>sr :%s///g<left><left>

" Highlight word at cursor without changing position
nnoremap <Leader>h *<C-O>

" Use `=` to indent the current line
nnoremap = v=

" Replace until end of line with yanked text. Uses blackhole register.
nnoremap <silent><Leader>p "_DP

" Jump to start and end of line using the home row keys
noremap H ^
noremap L $

" Copy relative path to the system pasteboard
nnoremap <silent><Leader>cf :let @*=expand('%')<CR>

" Copy relative path and line number to the system pasteboard
nnoremap <silent><Leader>cF :let @*=expand('%').':'.line('.')<CR>

" Use sane regexes
nnoremap / /\v
vnoremap / /\v

" Use jk as <Esc> alternative
inoremap jk <Esc>

" CtrlP
let g:ctrlp_map = '<Leader>t'
map <Leader>l :CtrlPBuffer<CR>
map <Leader>m :CtrlPMRUFiles<CR>
map <Leader>T :CtrlPClearAllCaches<CR>:CtrlP<CR>

" Tabular
nnoremap <Leader>= :Tabularize /\(=>\|=\)<CR>

" Command-W
nmap <Leader>w :CommandW<CR>
nmap <Leader>sw :FixWhitespace<CR>:w<CR>:CommandW<CR>
" nmap <Leader>sw :CommandW<CR>

" Close Vim instance
nmap <Leader>W :qall<CR>

" Cmd+K for bufkill
nmap <Leader>k :BD<CR>

" Neocomplcache (recommended)
" <CR>: close popup and save indent
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()
