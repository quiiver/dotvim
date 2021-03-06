set nocompatible

runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#helptags()
  call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles'))
end

syntax on
filetype plugin indent on

colorscheme vividchalk
set background=dark

let bash_is_sh=1
set cinoptions=:0,(s,u0,U1,g0,t0

set modelines=5
set tags=tags;/

set laststatus=2

" default:
" set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"set statusline=%<%f\ %h%m%r%#warningmsg#%{SyntasticStatuslineFlag()}%*%=%-14.(%l,%c%V%)\ %P
" highlihgt the file name
hi User1 term=bold,reverse cterm=bold ctermfg=4 ctermbg=2 gui=bold guifg=Blue guibg=#44aa00
set statusline=%<%1*%f%*\ %h%m%r%#warningmsg#%{SyntasticStatuslineFlag()}%*%=%-14.(%l,%c%V%)\ %P
if filereadable(expand("~/.vim_local"))
  source ~/.vim_local
endif

"set cuc
"set cul

set number

"set textwidth=0         " Do not wrap words (insert)
"set nowrap              " Do not wrap words (view)
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " do not ignore if search pattern has CAPS
set incsearch           " Incremental search
set autowriteall        " Automatically save before commands like :next and :make
set hlsearch            " Highlight search match
set hidden              " enable multiple modified buffers
set nobackup            " do not write backup files
set noswapfile          " do not write .swp files
set foldcolumn=0        " columns for folding
set foldmethod=indent
set foldlevel=9
set history=1000
set wildmenu
"set wildmode=list:longest,list,full
set ruler
set visualbell
set autoread            " automatically read feil that has been changed on disk and doesn't have changes in vim
set backspace=indent,eol,start
set guioptions-=T       " disable toolbar"

set ts=4
set sw=4

"fixdel

" prevent vim from adding that stupid empty line at the end of every file
set noeol
set binary

"Ignore these files when completing names and in Explorer
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

hi SpellErrors guibg=red guifg=black ctermbg=red ctermfg=black

set backupdir=~/.backup,.
set directory=~/.backup,~/tmp,.

" enable auto compile for coffee script
let coffee_compile_on_save = 1

" enable showmmarks
let g:showmarks_enable = 0
"hi! link ShowMarksHLl LineNr
"hi! link ShowMarksHLu LineNr
"hi! link ShowMarksHLo LineNr
"hi! link ShowMarksHLm LineNr

" Make
:command -nargs=* Make make <args> | cwindow 3

"set completeopt=menuone,preview,longest
set completeopt=menuone,preview
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Omni completion settings
set ofu=syntaxcomplete#Complete
let g:rubycomplete_buffer_loading = 0
let g:rubycomplete_classes_in_global = 1

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes = ['html']

" delimitMate
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1


let mapleader = ","

" Don't use Ex mode, use Q for formatting
map Q gq

" highlight trailing whitespace
set listchars=tab:▷⋅,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>
" show invisibles
set list

" extended '%' mapping for if/then/else/end etc
runtime macros/matchit.vim

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" ` to disable search match highlight
nmap <silent> ` :silent noh<CR>

" Ctrol-E to switch between 2 last buffers
nmap <C-E> :b#<CR>

" ,/ to invert comment on the current line/selection
nmap <leader>/ :call NERDComment(0, "invert")<cr>
vmap <leader>/ :call NERDComment(0, "invert")<cr>

" ,t to show tags window
let Tlist_Show_Menu=1
nmap <leader>T :TlistToggle<CR>

nmap <leader>S :SessionList<CR>
nmap <leader>SS :SessionSave<CR>
nmap <leader>SA :SessionSaveAs<CR>

let g:Conque_Read_Timeout = 50 " timeout for waiting for command output.
let g:Conque_TERM = 'xterm'

" ,sh to open vimshell window
nmap <Leader>sh :ConqueSplit bash<cr>

" ,r to open vimshell window
nmap <Leader>r :ConqueSplit 

" map ,y to show the yankring
nmap <leader>y :YRShow<cr>

if has("mouse")
  set mouse=a
endif

let g:yankring_replace_n_pkey = '<leader>['
let g:yankring_replace_n_nkey = '<leader>]'
let g:SimpleJsIndenter_BriefMode = 1

set shell=/bin/bash

" toggle Nerd tree
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>ds :execute 'NERDTree'<CR>
" ,p to show current file in the tree
nmap <leader>p :NERDTreeFind<CR>

" fuzzyfinder stuff
let g:fuzzy_ignore = "*.log"
let g:fuzzy_matching_limit = 70
let g:snips_author = "Wil Stuckey <wil@etsy.com>"

map <leader>t :CommandT<CR>
map <leader>b :FufBuffer<CR>

" buffer helpers
map <leader>l :ls<CR>
map <leader>x <leader>bd<CR>
map <leader>dx :bd<CR>
map <leader>w :w<CR>

imap <C-a> <ESC>^i
imap <C-e> <ESC>$a
imap <C-u> <ESC>c^
imap <C-k> <ESC>c$

nnoremap <tab> %
vnoremap <tab> %
nnoremap j gj
nnoremap k gk
nnoremap ; :
inoremap jj <ESC>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" syntax highlighting
if has('syntax')
    syntax on
    filetype on
    filetype plugin on
    filetype indent on
    set background=dark
    colorscheme twilight
endif

if has('gui_running')
    set encoding=utf-8
    set go-=T
    set guioptions-=T
    set guioptions-=m
    set guifont=Inconsolata:h16
    set showtabline=2
    set guitablabel=%t
    " show the cursor line
    set cursorline
else
    set background=dark
    colorscheme desert
end

set ls=2
set showmode
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set formatoptions=qrn1
set ttyfast

set wrap
set textwidth=79
set formatoptions=qrn1
set nolist
set scrolloff=4

au FocusLost * :wa

autocmd Filetype c,cpp,h,python,html,css,js,xml set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd Filetype scala set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype php set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd BufRead,BufNewFile *.tpl set filetype=html


" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc