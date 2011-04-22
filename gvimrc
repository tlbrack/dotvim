call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Colors and Fonts
set guifont=Consolas:h14.00
colorscheme railscasts

" Status and ruler
" :set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
set ruler
set showcmd

" Searching
set incsearch

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

let g:rubycomplete_rails = 1

" special syntax types
"au BufRead,BufNewFile *.less setfiletype css
au BufNewFile,BufRead *.less set filetype=less

" Folding
set foldmethod=syntax
set foldcolumn=5
:hi foldcolumn guibg=#444444
:hi foldcolumn guifg=White
:hi linenr guifg=#2B2B2B
set foldlevelstart=6

" Fuzzy Finder
map f :FuzzyFinderTextMate<CR>
let g:fuzzy_ignore = "*.swp"
let g:fuzzy_ignore = "*~"

" Navigation Maps
let mapleader = "/"
map tn :tabnew<CR>:tabmove<CR>
map tc :tabclose<CR>
nmap <silent> <Leader>pt :NERDTreeToggle<CR>
nmap <silent> <Leader>pm :NERDTreeMirror<CR>
" Shift-tab to insert a hard tab
imap <silent> <S-tab> <C-v><tab>


" extended matching
runtime macros/matchit.vim

" tabs
set et
set sw=2
set sts=2
set smarttab

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

  "set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"Change buffer - without saving
set hid 

"Show matching brackets when text indicator is over them
set showmatch 

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile


