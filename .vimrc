" Plugins {{{1
call plug#begin('~/.vim/plugged')
	Plug 'https://github.com/altercation/vim-colors-solarized.git'
"	Plug 'https://github.com/w0rp/ale.git'
"	Plug 'https://github.com/tpope/vim-surround.git'
"	Plug 'https://github.com/chrisbra/Recover.vim.git'
call plug#end()
" 1}}}
" Colorscheme {{{1
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
syntax enable
"set t_Co=256
" 1}}}
" Commenting {{{1
" 42 C commenting style
autocmd FileType c let &comments = 'sO:* -,mO:*  ,exO:*/,s0:/*,mb:**,ex:*/,://'
" 1}}}
" Tab stuff {{{1
" do smart autoindenting on new lines
set smartindent

" indent like the previous line
set autoindent

" shift keys in normal mode add or remove 4 spaces
set shiftwidth=4

" use tabs for indentation and spaces everywhere else
set smarttab

" don't automatically expand tabs into whitespace (unless filetype plugin
" decides differently)
set noexpandtab

" tabstop is 4 characters
set tabstop=4

" delete key in insert mode deletes 4 spaces
set softtabstop=4

" auto-shift to tab stop
set shiftround

" when the file is a bash file tabs equal 2 spaces
autocmd FileType sh setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" when the file is a python file tabs equal 4 spaces
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

" 1}}}
" Orientation {{{1
" uses the folding at the '{' markers
set foldmethod=marker

" Tell me where I am in the file
set ruler

" show absolute line numbers
set number

" highlight current row
set cursorline

" doesn't highlight the cursorcolumn (a weird vertical line from top to bottom
" wherever the cursor is)
set nocursorcolumn
" 1}}}
" Statusline {{{1
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" show last command
set showcmd

" Always show the file status
set laststatus=2

" 1}}}
" Listchars {{{1
" defines the listchars depending on the encoding
set list
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
" Make sure NonText looks grey
set highlight+=8:NonText
" 1}}}
" Searching {{{1
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

" search incrementally, shows search results while typing
set incsearch
" 1}}}
" Buffers {{{1
" Permit switching buffers when the current buffer is dirty
set hidden

" wrap so that it fits into the window and doesn't exceed it
set wrap

" make left/right keys wrap to start of the next line
set whichwrap+=h,l,<,>,[,]

" how many rows are visible above or under the curser when scrolling up/down
" or when scrolling to a search pattern.
" a large value like 999 will keep the cursor in the center of the screen
set scrolloff=5

" how many columns to show on each side of the cursor
set sidescrolloff=1

" update the buffer if the source file changes on disk and we have not edited it
set autoread

" Don't redraw while executing macros (good performance config)
set lazyredraw
" 1}}}
" Remove trailing whitespaces {{{1
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
" 1}}}
" Other stuff {{{1
" EOL formats to try when parsing new files with unclear MIMEtypes
set fileformats="unix,dos"

" Disable Ex mode
map Q <Nop>
" 1}}}
