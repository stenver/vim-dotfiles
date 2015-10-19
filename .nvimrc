set smarttab          " smart tab
set title             " nice terminal title
set splitbelow        " new spilt window below where you are
set splitright        " new vsplit windows right where you are
set shiftround        " < and > commands for indention
set expandtab         " use spaces instead of <Tab>s
set tabstop=2         " number of spaces that a <Tab> in the file counts for
set shiftwidth=2      " number of spaces to use for each step of (auto)indent
set softtabstop=2     " spaces feel like tabs
set smartindent       " auto tabs when going to next line
set modeline
"set hlsearch          " Highlight search results
set incsearch
set autoindent        " always set auto-indenting on
set copyindent        " copy the previous indentation on auto-indenting
set ruler             " line and column number
set backspace=indent,eol,start
set encoding=utf-8
set confirm           " asks confirmation when read-only etc
set scrolloff=3       " keep 3 lines when scrolling
set sidescrolloff=2   " keep 2 characters when scrolling
set showmatch         " jumps to next bracket
set history=1000

set nobackup          " No swaps or backups
set noswapfile

" set mouse=            " disable evil mouse
set mousemodel=popup
" Disable mouse selection entering the Visual mode
" But I need mouse=a for scolling to work in tmux
set mouse=a
"set number
set relativenumber
syntax on
filetype off

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  set runtimepath+=/Users/stenver/.vim/bundle/neobundle.vim/
  set runtimepath+=/Users/stenver/.vim/
endif

" Required:
call neobundle#begin(expand('/Users/stenver/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'clones/vim-l9'
NeoBundle 'depuracao/vim-rdoc'
NeoBundle 'ecomba/vim-ruby-refactoring'
NeoBundle 'godlygeek/tabular'
NeoBundle 'jgdavey/vim-blockle'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'postmodern/vim-yard'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'Valloric/YouCompleteMe', {
     \ 'build'      : {
        \ 'mac'     : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'unix'    : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'windows' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'cygwin'  : './install.sh --clang-completer --system-libclang --omnisharp-completer'
        \ }
     \ }
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/AutoTag'
NeoBundle 'danchoi/ruby_bashrockets.vim'
NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'rking/ag.vim'
NeoBundle 'fatih/vim-go'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'solars/github-vim'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'pangloss/vim-javascript'

" Required:
call neobundle#end()
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

" Disable sounds in mac
set visualbell
set t_vb=

set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code
set wildignore+=classes
set wildignore+=log
set wildignore+=source_maps                      " Compiled coffeescript/etc
set wildignore+=bower_components                 " Bower components
set wildignore+=public                           " Public dir
set wildignore+=node_modules

set foldlevel=100
set foldmethod=indent
set foldlevelstart=99
set smartcase         " case sensitive
set pastetoggle=<F11>
set winminheight=0    " minimal window height
set hidden            " less warning when dealing with buffers

set laststatus=2                " always show status line
set statusline=                 " build the status line
set statusline+=%-3.3n\         " buffer number
set statusline+=%f\             " filename
set statusline+=%h%m%r%w        " status flags
set statusline+=%y              " file type
set statusline+=%=              " right align remainder
set statusline+=0x%-8B          " character value
set statusline+=%-14(%l,%c%V%)  " line, character
set statusline+=%<%P            " file position

" Move line(s) of text using Alt+j/k
"set termencoding=latin1
nnoremap <silent> <A-j> :m+<CR>==
nnoremap <silent> <A-k> :m-2<CR>==
inoremap <silent> <A-j> <Esc>:m+<CR>==gi
inoremap <silent> <A-k> <Esc>:m-2<CR>==gi
vnoremap <silent> <A-j> :m'>+<CR>gv=gv
vnoremap <silent> <A-k> :m-2<CR>gv=gv

let mapleader = "\<space>"
let &winwidth = 90

let ruby_operators = 1 " hightlight ruby operators
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1

" Use ag instead of grep
"   brew install the_silver_searcher
set grepprg=ag\ --nogroup\ --nocolor
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_root_markers = ['start', 'package.json']

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0
"" Ag
nnoremap <leader>f :Ag! <C-R><C-W>
" yank the current visual selection and insert it as the search term
vnoremap <leader>f y:<C-u>Ag! "<C-r>0"<space>
nnoremap <C-f> :Ag!<SPACE>

" Show trailing whitespace, but don't highlight the extra whitespace while
" typing, only after leaving insert
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" Don't make a # force column zero.
inoremap # X<BS>#

" FILE TYPES / SYNTAX
source $VIMRUNTIME/filetype.vim

autocmd BufEnter *.html set filetype=xhtml
autocmd BufEnter */nginx/*.conf* set filetype=nginx
autocmd BufEnter *.html.erb source $HOME/.vim/syntax/html5.vim
autocmd BufEnter *.es6 set filetype=javascript

autocmd BufEnter *.prawn set filetype=ruby
autocmd BufEnter Guardfile set filetype=ruby
autocmd BufEnter Gemfile set filetype=ruby
autocmd BufEnter *.slim set filetype=slim

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" CtrlP
let g:ctrlp_map = "<leader>p"
let g:ctrlp_root_markers = ['start', 'package.json']

"" Ag
nnoremap <leader>f :Ag! <C-R><C-W>
" yank the current visual selection and insert it as the search term
vnoremap <leader>f y:<C-u>Ag! "<C-r>0"<space>

" Regenerate tags
"map <leader>rt :!find . -iname *.rb \| xargs ctags --extra=+f
"map <leader>rt :!ctags --extra=+f --languages=-javascript --exclude=.git --exclude=log -R * `rvm gemdir`/gems/*<CR><C-M>
map <leader>rt :!ctags --extra=+f --languages=-javascript --exclude=.git --exclude=log,tmp -R *<CR><C-M>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <leader>e :e <C-R>=expand("%:p:h") . '/'<CR><C-M>
map <leader>s :split <C-R>=expand("%:p:h") . '/'<CR><C-M>
map <leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR><C-M>

" Copy/paste from system clipboard
map <leader>y "+y
map <leader>p "+p

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" Split
noremap <Leader>o :<C-u>split<CR>
noremap <Leader>i :<C-u>vsplit<CR>

"make splits open below and to the right
set splitbelow
set splitright

" splitjoin
" nmap <leader>J :SplitjoinJoin<cr>
" nmap <leader>S :SplitjoinSplit<cr>

" move over screen lines not buffer lines
"  helps with long wrapped lines (normal mode only)
noremap k gk
noremap j gj

"" Git
noremap <Leader>ga :Gwrite<CR>
" Make the default commit binding be verbose
noremap <Leader>gc :Gcommit -v<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>
" Remap hunk staging etc to not clash with split navigation's <leader>h
nmap <leader>cs <Plug>GitGutterStageHunk
nmap <leader>cp <Plug>GitGutterPreviewHunk
nmap <leader>cr <Plug>GitGutterRevertHunk

noremap ,o :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs open<CR><CR>

" Fix cursor position when using page up and down
map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>
set nostartofline

nmap <silent> <leader>z :set spell!<cr>

nnoremap <silent> <leader><space> :noh<cr>

" => to :, " to ' and add spaces
function! PrettyHash()
  :Bashrockets
  :silent! s/\"\([a-zA-Z_]*\)\"\:/\1\:\ /g
  :silent! s/\(\w\|\}\|\'\|\"\)\:\(\w\|{\|\'\|\"\)/\1\: \2/g
  :silent! s/\"/\'/g
  :silent! s/\(\w\|\}\|\'\|\"\),\(\w\)/\1, \2/g
endfunction
vnoremap <silent> <leader>h :call PrettyHash()<cr>

function! SplitHash()
  :silent! s/^\(\s\+\){\(.*\)/\1{\r\1\ \ \2/g
  :silent! s/\(\w\|\}\|\'\|\"\|)\), \(\w\)/\1,\r\2/g
  :silent! s/\}$/\r\}/g
endfunction
vnoremap <silent> <leader>j :call SplitHash()<cr>

" Move line(s) of text using Alt+j/k
nnoremap <silent> <A-j> :m+<CR>==
nnoremap <silent> <A-k> :m-2<CR>==
inoremap <silent> <A-j> <Esc>:m+<CR>==gi
inoremap <silent> <A-k> <Esc>:m-2<CR>==gi
vnoremap <silent> <A-j> :m'>+<CR>gv=gv
vnoremap <silent> <A-k> :m-2<CR>gv=gv

" move between several split windows
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" move between tabs (alt-h, alt-l)
" nmap è :tabp<CR>
" nmap ì :tabn<CR>
" nmap <M-h> :tabp<CR>
" nmap <M-l> :tabn<CR>
" tnoremap è <C-\><C-n>:tabp<CR>
" tnoremap ì <C-\><C-n>:tabn<CR>
" tnoremap <M-h> <C-\><C-n>:tabp<CR>
" tnoremap <M-l> <C-\><C-n>:tabn<CR>

" terminal shortcuts
tnoremap <Esc> <C-\><C-n>
tnoremap <C-w>_ <C-\><C-n><C-w>_
tnoremap <C-u> <C-\><C-n><C-u>
tnoremap <C-d> <C-\><C-n><C-d>

" grep for the word under the cursor
nnoremap <Leader>w :split <CR> :grep <cword> . <CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Running tests
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Write the file and run tests for the given filename
function! RunTests(filename)
  :w
  :tabnew
  :call termopen([&sh, &shcf, "rspec " . a:filename], {'name':'running-tests'})
  :startinsert
endfunction


" Set the spec file that tests will be run for.
function! SetTestFile()
  let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
  if in_test_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

map <leader>c :call RunTestFile()<cr>
map <leader>x :bd! running-tests<cr>

" nice colorscheme
set background=dark
colorscheme my
