" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
"syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

set nocompatible
" set backspace=indent,eol,start
set backspace=eol,start
" set autoindent
set textwidth=0
set viminfo='20,\"50
set history=50
set ruler

set nobackup
" set showbreak=+\
set equalprg=fmt
" set nowrap
set ttyfast

set showcmd
set showmatch
set statusline=%n%m\ %f\ %l/%L,%c-%v
set laststatus=2
set title

"set ignorecase
"set incsearch
set hlsearch

" set langmap=йцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;qwertyuiop[]asdfghjkl\;'zxcvbnm\,.QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8

set tabstop=4
set shiftwidth=4
set expandtab

set splitbelow
set splitright

" set foldmethod=marker
set formatoptions=qroct
" set mouse=a

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

syntax on
filetype on
filetype indent off
filetype plugin on

" {{{ Colors
"set background=light

highlight StatusLine cterm=bold ctermfg=white ctermbg=blue
highlight Search term=reverse ctermfg=7 ctermbg=4

highlight Folded term=standout ctermfg=0 ctermbg=6
highlight FoldColumn term=standout ctermfg=0 ctermbg=6
highlight Comment ctermfg=darkgreen 
colorscheme desert
"}}} Colors

"{{{ Function LineNums
function LineNums()
    if &number
        set nonumber
    else
        set number
    endif
    return ""
endfunction
"}}} Function LineNums

" force the detection of filetype by it's extension
autocmd BufNewFile,BufRead  *.t setfiletype perl
autocmd BufNewFile,BufRead  *.tt setfiletype html

" {{{ Key mapping
inoremap <S-tab> <c-r>=InsertTabWrapper()<cr>
" Code indenter
nmap <leader>rci :%!ruby-code-indenter<cr>

map <F1> :! clear && perldoc %<CR><CR>
map <F2> :w<CR>
map <F3> :NERDTreeToggle<CR>
map <F4> ZZ
map <F5> :execute LineNums()<CR>
map <F6> :set filetype=perl<CR>
map <F7> :set filetype=html<CR>
map <F8> :set filetype=sql<CR>
map <F9> :!perl -cW %<CR>
map <F10> :q!<CR>
map <F12> :! clear && git blame %<CR>
imap <F2> <ESC>:w<CR>
imap <F10> <ESC>:q!<CR>
" }}} Key mapping


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

execute pathogen#infect()
