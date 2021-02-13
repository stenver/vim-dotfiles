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
set number
"set relativenumber
syntax on
filetype off

"Coc scripts
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"Coc scripts end


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=/Users/stenver/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/stenver/.cache/dein')
  call dein#begin('/Users/stenver/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/stenver/.cache/dein/repos/github.com/Shougo/dein.vim')

  " completion framework
  " call dein#add('Shougo/deoplete.nvim')
  " if !has('nvim')
  "   call dein#add('roxma/nvim-yarp')
  "   call dein#add('roxma/vim-hug-neovim-rpc')
  " endif
  " let g:deoplete#enable_at_startup = 1
  " call dein#add('Shougo/neosnippet.vim')
  " call dein#add('Shougo/neosnippet-snippets')
  " "" c-tags
  call dein#add('ludovicchabant/vim-gutentags')

  " " intellisense
  call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})

  "" List and open files
  call dein#add('scrooloose/nerdtree')

  "" Gstatus, Gmove and other git commands
  call dein#add('tpope/vim-fugitive')

  "" Comment out lines
  call dein#add('tpope/vim-commentary')

  "" Search for files
  call dein#add('ctrlpvim/ctrlp.vim')

  "" Color schemes
  call dein#add('flazz/vim-colorschemes')
  call dein#add('vim-scripts/ScrollColors')
  "" NeoBundle 'tomasr/molokai'
  "" NeoBundle 'gosukiwi/vim-atom-dark'
  "" Enable ansi escape seq colors
  call dein#add('vim-scripts/AnsiEsc.vim')
  call dein#add('vim-scripts/CSApprox') " Needed by git blame

  "" Bling and stuff. Different status bar things like file path, line number,
  "" visible mode status, buffers etc
  call dein#add('vim-airline/vim-airline-themes')

  "" Shows git diff left of the line numbers
  call dein#add('airblade/vim-gitgutter')

  "" Different language packs
  call dein#add('sheerun/vim-polyglot')
  call dein#add('w0rp/ale')

  call dein#add('tpope/vim-rails')
  call dein#add('tpope/vim-rake')
  call dein#add('tpope/vim-bundler')
  call dein#add('gaogao1030/vim-skim')
  call dein#add('othree/html5.vim')

  "" Use leader-b to make ruby do-end to {} and one liner if possible
  call dein#add('jgdavey/vim-blockle')

  "" use cs'" to change surrounding ' to ". Can take any other combinations as
  "" well like cs'<q>, etc
  call dein#add('tpope/vim-surround')

  "" gS to split condition statements, gJ to join them
  call dein#add('AndrewRadev/splitjoin.vim')

  "" Sublime select file. ctrl+n to select, ctrl+x to skip, ctrl+p to go back
  call dein#add('terryma/vim-multiple-cursors')

  "" Use AG
  " call dein#add('rking/ag.vim')
  call dein#add('mileszs/ack.vim')

  "" Camelcase for moving in camelcase code
  call dein#add('bkad/CamelCaseMotion')

  "" Test plugin
  call dein#add('janko-m/vim-test')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
  call dein#end()
  call dein#save_state()
endif


" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

"*****************************************************************************
"" CONFIGURATIONS
"*****************************************************************************
"# Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap ,m :NERDTreeFind<CR>
nmap ,n :NERDTreeToggle<CR>

" Some color scheme stuff
colorscheme deus
set t_Co=256
set nocursorline
set guioptions=egmrti
set gfn=Monospace\ 10

set statusline+=%{gutentags#statusline()}

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif
endif

if &term =~ '256color'
  set t_ut=
endif
" let g:molokai_original = 1

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif


let g:ale_fixers = {
\   'ruby': ['rubocop'],
\}

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
set ignorecase
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

let &winwidth = 90

let ruby_operators = 1 " hightlight ruby operators
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
" TODO what is this shit here
"" The PC is fast enough, do syntax highlight syncing from start
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync fromstart
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" Open a previously edited buffer and then close the buffer we just moved away
" from. This avoids closing the split due to closing the buffer.
noremap <leader>q :b#\|bd #<CR>
"" Closing bufs that aren't open in any window or tabs
" from http://stackoverflow.com/a/7321131/1456578
function! DeleteInactiveBufs()
  "From tabpagebuflist() help, get a list of all buffers in all tabs
  let tablist = []
  for i in range(tabpagenr('$'))
	call extend(tablist, tabpagebuflist(i + 1))
  endfor

  "Below originally inspired by Hara Krishna Dara and Keith Roberts
  "http://tech.groups.yahoo.com/group/vim/message/56425
  let nWipeouts = 0
  for i in range(1, bufnr('$'))
	if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
	  "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
	  silent exec 'bwipeout' i
	  let nWipeouts = nWipeouts + 1
	endif
  endfor
  echomsg nWipeouts . ' buffer(s) wiped out'
endfunction
noremap <leader>Q :call DeleteInactiveBufs()<CR>

"" txt
" augroup vimrc-wrapping
"   autocmd!
"   autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
" augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

"" js/coffee/html
augroup vimrc-js
  autocmd!
  autocmd FileType coffee setlocal tabstop=4 softtabstop=2 shiftwidth=2 expandtab
  autocmd FileType javascript setlocal tabstop=4 softtabstop=2 shiftwidth=2 expandtab
  autocmd FileType html setlocal tabstop=4 softtabstop=2 shiftwidth=2 expandtab
augroup END

set autoread

" Show trailing whitespace, but don't highlight the extra whitespace while
" typing, only after leaving insert
augroup trailing-whitepsace
  autocmd!
  highlight ExtraWhitespace ctermbg=red guibg=red
  autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
augroup END

source $VIMRUNTIME/filetype.vim

augroup file-types
  autocmd!
  " FILE TYPES / SYNTAX

  autocmd BufEnter *.html set filetype=xhtml
  autocmd BufEnter */nginx/*.conf* set filetype=nginx
  autocmd BufEnter *.html.erb source $HOME/.cache/dein/repos/github.com/othree/html5.vim/syntax/html.vim
  autocmd BufEnter *.es6 set filetype=javascript

  autocmd BufEnter *.prawn set filetype=ruby
  autocmd BufEnter Guardfile set filetype=ruby
  autocmd BufEnter Gemfile set filetype=ruby
  autocmd BufEnter *.slim set filetype=slim
augroup END

" For all text files set 'textwidth' to 78 characters.
" autocmd FileType text setlocal textwidth=78

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

"*****************************************************************************
"" Mappings
"*****************************************************************************
let mapleader = "\<space>"

"" Ag
" Use ag instead of grep
"   brew install the_silver_searcher
" set grepprg=ag\ --nogroup\ --nocolor
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  'node_modules',
"   \ }

if executable('ag')
  let g:ctrlp_root_markers = ['start', 'package.json']
  let g:ctrlp_user_command = ['ag %s --files-with-matches -g "" --ignore tmp/*']
  let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](doc|tmp|node_modules)',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

nnoremap <C-f> :Ack!<SPACE>
nnoremap <leader>f :Ack! <C-R><C-W>
" yank the current visual selection and insert it as the search term
vnoremap <leader>f y:<C-u>Ack! "<C-r>0"<space>
let g:ackprg = 'ag --vimgrep --smart-case'
    " exe g:ack_lhandler
    " let l:apply_mappings = g:ack_apply_lmappings
let g:ack_lhandler="copen"
let g:ackhighlight=1

" grep for the word under the cursor
nnoremap <Leader>w :split <CR> :grep <cword> . <CR>

" CtrlP
let g:ctrlp_map = "<leader>p"
let g:ctrlp_root_markers = ['start', 'package.json']

" Don't make a # force column zero.
inoremap # X<BS>#

" Copy/paste from system clipboard
map <leader>y "+y
map <leader>p "+p

" Move line(s) of text using Alt+j/k
"set termencoding=latin1
nnoremap <silent> <A-j> :m+<CR>==
nnoremap <silent> <A-k> :m-2<CR>==
inoremap <silent> <A-j> <Esc>:m+<CR>==gi
inoremap <silent> <A-k> <Esc>:m-2<CR>==gi
vnoremap <silent> <A-j> :m'>+<CR>gv=gv
vnoremap <silent> <A-k> :m-2<CR>gv=gv

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Split
noremap <Leader>o :<C-u>split<CR>
noremap <Leader>i :<C-u>vsplit<CR>

"make splits open below and to the right
set splitbelow
set splitright

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


" " session management
" TODO learn this shit
" nnoremap <leader>so :OpenSession
" nnoremap <leader>ss :SaveSession
" nnoremap <leader>sd :DeleteSession<CR>
" nnoremap <leader>sc :CloseSession<CR>

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
" johaiidiii. Make backspace act like ctrl+h https://github.com/neovim/neovim/issues/2048#issuecomment-77010340
nmap <C-H> <C-W>h
nmap <bs> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" terminal shortcuts
tnoremap <Esc> <C-\><C-n>
tnoremap <C-w>_ <C-\><C-n><C-w>_
tnoremap <C-u> <C-\><C-n><C-u>
tnoremap <C-d> <C-\><C-n><C-d>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gutentags_project_root = ['package.json', 'Brocfile.js', 'Capfile', 'Rakefile', 'bower.json', '.ruby-version', 'Gemfile']

augroup vimrc-go
  autocmd!
  " Fix vim-go leaving scratch buffers open
  au CompleteDone * pclose
  "" vim-go bindings
  au FileType go nmap <Leader>gd <Plug>(go-doc)
  au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
  au FileType go nmap <Leader>gs <Plug>(go-implements)
  au FileType go nmap <Leader>gi <Plug>(go-info)
  au FileType go nmap <Leader>ge <Plug>(go-rename)

  au FileType go setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
augroup END


let g:javascript_enable_domhtmlcss = 1

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

augroup vimrc-ruby
  autocmd!
  autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
  autocmd FileType ruby setlocal tabstop=4 softtabstop=2 shiftwidth=2 expandtab
augroup END

"" Enable automatic word wrapping
set formatoptions+=t

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

"" Run tests in a neovim or tmux split
nmap <silent> <leader>r :TestNearest<CR>
nmap <silent> <leader>R :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>
if has('nvim')
  function! NeovimSplit(cmd)
  :w
  :split
  :enew
  :call termopen([&sh, &shcf, a:cmd])
  :startinsert
  endfunction

  let g:test#custom_strategies = {'neovim_split': function('NeovimSplit')}
  let g:test#strategy = 'neovim_split'
  " Use <esc> to get to normal mode in the terminal split
  tnoremap <esc> <C-\><C-n>
else
  let g:test#strategy = 'vimux'
endif

" Highlight 121st column if text flows over it
highlight ColorColumn ctermbg=red guibg=#ed2939
call matchadd('ColorColumn', '\%121v', 100)

augroup vim-prose
  autocmd!
  au BufNewFile,BufRead *.md,*.txt,*.prose,*.tmp setlocal filetype=prose
  au FileType prose set textwidth=79
  au FileType prose setlocal formatoptions=aw2tq
  au FileType prose setlocal nonumber
  au FileType prose setlocal spell spelllang=en_us
  " Suggest spelling fixes
  au FileType prose nnoremap \s ea<C-X><C-S>

  " Create left margin and un-higlight it
  au FileType prose setlocal foldcolumn=12
  au FileType prose highlight! link FoldColumn Normal

  " Turn GitGutter to always have the column (to avoid the text jumping back
  " and forth when the column is created/deleted) and change the background of
  " the column to the normal (black background).
  " au FileType prose let g:gitgutter_sign_column_always=1
  " au FileType prose highlight! link SignColumn Normal
  " au FileType prose highlight GitGutterAdd ctermbg=bg guibg=bg
  " au FileType prose highlight GitGutterChange ctermbg=bg guibg=bg
  " au FileType prose highlight GitGutterDelete ctermbg=bg guibg=bg
  " au FileType prose highlight GitGutterChangeDelete ctermbg=bg guibg=bg
augroup END
