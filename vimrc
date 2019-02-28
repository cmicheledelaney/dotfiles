	call plug#begin('~/.vim/plugged')
	Plug 'https://github.com/altercation/vim-colors-solarized.git' 
"	Plug 'https://github.com/w0rp/ale.git'
"	Plug 'https://github.com/tpope/vim-surround.git'
"	Plug 'https://github.com/chrisbra/Recover.vim.git'
	call plug#end()

set background=dark
let g:solarized_termcolors=256
colorscheme solarized
syntax enable
"set t_Co=256

" 42 COMMENTING STYLE
autocmd FileType c let &comments = 'sO:* -,mO:*  ,exO:*/,s0:/*,mb:**,ex:*/,://'
" tab stuff
" do smart autoindenting on new lines
set smartindent
  " indent like the previous line
set autoindent
  " shift keys in normal mode add or remove 4 spaces
set shiftwidth=4
  " use tabs for indentation and spaces everywhere else
set smarttab
  " don't automatically expand tabs into whitespace
set noexpandtab
  " tabstop is 4 characters
set tabstop=4
  " delete key in insert mode deletes 4 spaces
set softtabstop=4
  " auto-shift to tab stop
set shiftround

  " Orientation
  " Tell me where I am in the file
set ruler
  " show line numbers relative to the cursor position
" set relativenumber
set number
  " don't show line numbers in absolute terms
" set nonumber
  " highlight current row
set cursorline
set nocursorcolumn
  " Statusline {{{2
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
  " show last command
set showcmd
  " Always show the file status
set laststatus=2

  " listchars to highlight stuff we don't like
set list
  " Make sure NonText looks grey
set highlight+=8:NonText
if (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
    " If we have utf-8 encoding, use fancy listchars
  set listchars=tab:→\ ,eol:\ ,trail:·,extends:≻,precedes:≺,conceal:�,nbsp:—
    " Show this character on a wrapped line
  set showbreak=
else
    " Otherwise, use ANSI
  set listchars=tab:>\ ,eol:\ ,trail:~,extends:>,precedes:<,conceal:*,nbsp:-
  " Show this character on a wrapped line
  set showbreak=
endif 

  " Searching {{{2
  " enable enhanced command-line completion
set wildmenu
  " Exclude these files and directories from search
set wildignore+=*.git/*,*.hg/*,*.svn/*,*.so,*.pdf,*.py[co],*.o,*.swp,*.aux,*.toc
  " Suffixes that are ignored when doing filename autocompletion
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
  " ignore case
set ignorecase
  " highlight all search matches
set hlsearch
  " always search the whole file regardless of cursor position
set wrapscan
  " show search results visually
set showmatch
  " search incrementally
set incsearch
  " When searching, scroll to the next search pattern automatically with 4+ lines visible above and below the cursor
set scrolloff=4
"
  " Buffers {{{2
  " Permit switching buffers when the current buffer is dirty
set hidden
  " 2}}}
 
  " Navigation {{{2
set modeline
  " what to do when I hit backspace
set backspace=indent,eol,start
  " don't wrap unless I say so
"  set nowrap
  " make left/right keys wrap to start of the next line
set whichwrap+=h,l,<,>,[,]
  " how many rows to show on each side of the cursor
  " a large value like 999 will keep the cursor in the center of the screen
set scrolloff=3
  " how many columns to show on each side of the cursor
set sidescrolloff=1

  " update the buffer if the source file changes on disk and we have not edited it
set autoread

  " Don't redraw while executing macros (good performance config)
set lazyredraw

  " Disable Ex mode
map Q <Nop>

  " remove whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation. save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
    " Do the business:
  %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
  " do it whenever we hit a key
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

  " EOL formats to try when parsing new files with unclear MIMEtypes
set fileformats="unix,dos"
" set linebrak to the value of 80, so that I know when I'm not conforming the
" Nomrme

"set wrap linebreak
"set fo+=t
"set fo-=l
"set wrapmargin=80

