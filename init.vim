set directory=~/.vim/backup
set backupdir=~/.vim/backup " keep swap files here
filetype off                " required

if exists('g:vscode')
    call plug#begin('~/.local/share/nvim/plugged')

    " common start
    Plug 'tpope/vim-surround'
    Plug 'justinmk/vim-sneak'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'
    Plug 'scrooloose/nerdcommenter'                                   " Code commenter
    " common end

    Plug 'asvetliakov/vim-easymotion'

    call plug#end()
  else
"call plug#begin('~/.local/share/nvim/plugged')
call plug#begin('~/.vim/plugged')

" Git Plugins
Plug 'tpope/vim-fugitive'                                         " Git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'                                " shows files git status on the NerdTree

" Colors and Themes
Plug 'lifepillar/vim-solarized8'                                  " Solarized8
Plug 'dracula/vim'                                                " Dark theme

" Usability
Plug 'stefandtw/quickfix-reflector.vim'                           " Make modifications right in the quickfix window
Plug 'vim-airline/vim-airline'                                    " Bottom status bar
Plug 'vim-airline/vim-airline-themes'                             " Airline themes for colorscheme
Plug 'tpope/vim-repeat'                                           " For repeating commands
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'                                         " Quickly edit surroundings (brackets, html tags, etc)
Plug 'preservim/nerdtree'                                         " Folders tree
Plug 'scrooloose/nerdcommenter'                                   " Code commenter
Plug 'kien/rainbow_parentheses.vim'                               " For nested parentheses
Plug 'junegunn/vim-easy-align'                                    " Alignment plugin
Plug 'Valloric/MatchTagAlways'                                    " Highlights html enclosing tags
Plug 'terryma/vim-multiple-cursors'                               " Multiple cursors selection, etc
Plug 'Yggdroot/indentline'                                        " Indent Line

" Search and workflow
Plug 'jremmen/vim-ripgrep'                                        " Blazing fast search using ripgrep
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy finder conf
Plug 'junegunn/fzf.vim'                                           " Fuzzy finder for search
Plug 'cloudhead/neovim-fuzzy'                                     " Yet another fuzzy finder
Plug 'lifepillar/vim-solarized8'                                  " Solarized8
Plug 'neomake/neomake'                                            " Run programs asynchronously and highlight errors

" Haskell plugins
Plug 'Twinside/vim-hoogle'                                        " Hoogle search (Haskell) in Vim
Plug 'Shougo/unite.vim'                                           " Required by some haskell plugins
Plug 'ujihisa/unite-haskellimport'                                " Suggestions on imports
Plug 'vmchale/dhall-vim'                                          " Syntax highlighting for Dhall lang

" Scala Plugins
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}        " LSP client + autocompletion plugin
Plug 'itchyny/lightline.vim'                                      " Configurable status line (can be used by coc)
Plug 'derekwyatt/vim-scala'                                       " Scala plugin

" Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}             " Markdown
Plug 'justinmk/vim-sneak'

Plug 'vimwiki/vimwiki'                                             " Vimwiki
call plug#end()

endif

" ===================

let mapleader=","

let g:python3_host_prog = '/usr/bin/python3'

" ripgrep smartcase (search with case insensitive)
let g:rg_command = 'rg --vimgrep -S'

" airline: status bar at the bottom
let g:airline_powerline_fonts=1

" if you want to disable auto detect, comment out those two lines (COC)
"let g:airline#extensions#disable_rtp_load = 1
"let g:airline_extensions = ['branch', 'hunks', 'coc']

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Highlighting for jsonc filetype
autocmd FileType json syntax match Comment +\/\/.\+$+

" Nerd commenter
filetype plugin on

" Better Unix support
set viewoptions=folds,options,cursor,unix,slash
set encoding=utf-8

" Handle window actions with Meta instead of <C-w>
" Switching
" Note: Meta Key in Ubuntu is right Alt key that can be remapped
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

" Moving
nnoremap <M-H> <C-w>H
nnoremap <M-J> <C-w>J
nnoremap <M-K> <C-w>K
nnoremap <M-L> <C-w>L
nnoremap <M-x> <C-w>x

" Resizing
nnoremap <M-=> <C-w>=
nnoremap <M-+> <C-w>+
nnoremap <M--> <C-w>-
nnoremap <M-<> <C-w><
nnoremap <M->> <C-w>>

" Clear search highlighting
nnoremap <C-z> :nohlsearch<CR>

" Terminal mode exit shortcut
:tnoremap <Esc> <C-\><C-n>

" Nerdtree git plugin symbols
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "ᵐ",
    \ "Staged"    : "ˢ",
    \ "Untracked" : "ᵘ",
    \ "Renamed"   : "ʳ",
    \ "Unmerged"  : "ᶴ",
    \ "Deleted"   : "ˣ",
    \ "Dirty"     : "˜",
    \ "Clean"     : "ᵅ",
    \ "Unknown"   : "?"
    \ }

function! TrimWhitespace()
    let l:save_cursor = getpos('.')
    %s/\s\+$//e
    call setpos('.', l:save_cursor)
endfun

command! TrimWhitespace call TrimWhitespace() " Trim whitespace with command
autocmd BufWritePre * :call TrimWhitespace()  " Trim whitespace on every save

" Non-mapped function for tab toggles
function! TabToggle()
  if &expandtab
    set noexpandtab
  else
    set expandtab
  endif
endfunc

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"    Nerdtree
map <C-F> :NERDTreeToggle<CR>
map <C-S> :NERDTreeFind<CR>

" Other options
let mapleader=','
set backspace=2
colorscheme solarized8_flat
syntax on
set shell=/bin/zsh
set laststatus=2
set noshowmode

" Draw a line at 120 columns
" set colorcolumn=120
" highlight ColorColumn ctermbg=235 guibg=#2c2d27

" Fixes broken cursor on Linux
set guicursor=

" NerdTree config
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden=1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1

                            " General editor options
set hidden                  " Hide files when leaving them.
set number                  " Show line numbers.
set numberwidth=1           " Minimum line number column width.
set cmdheight=2             " Number of screen lines to use for the commandline.
set textwidth=120           " Lines length limit (0 if no limit).
set formatoptions=jtcrq     " Sensible default line auto cutting and formatting.
set linebreak               " Don't cut lines in the middle of a word .
set showmatch               " Shows matching parenthesis.
set matchtime=2             " Time during which the matching parenthesis is shown.
set background=dark         " Color adapted to dark background.
set listchars=tab:▸\ ,eol:¬ " Invisible characters representation when :set list.
set clipboard=unnamedplus   " Copy/Paste to/from clipboard
set cursorline              " Highlight line cursor is currently on
set completeopt+=noinsert   " Select the first item of popup menu automatically without inserting it

" Search
set incsearch  " Incremental search.
set ignorecase " Case insensitive.
set smartcase  " Case insensitive if no uppercase letter in pattern, case sensitive otherwise.
set nowrapscan " Don't go back to first match after the last match is found.

" Fold
" set foldmethod=indent
" set foldlevelstart=1

" Tabs
set expandtab     " Tab transformed in spaces
set tabstop=2     " Sets tab character to correspond to x columns.
                  " x spaces are automatically converted to <tab>.
                  " If expandtab option is on each <tab> character is converted to x spaces.
set softtabstop=2 " column offset when PRESSING the tab key or the backspace key.
set shiftwidth=2  " column offset when using keys '>' and '<' in normal mode.

" Toggle display of tabs and EOF
nnoremap <leader>l :set list!<CR>

" Auto-commands
" Vimscripth
augroup vimscript_augroup
  autocmd!
  autocmd FileType vim nnoremap <buffer> <M-z> :execute "help" expand("<cword>")<CR>
augroup END

" Fuzzy finder shortcut
nnoremap <C-p> :FZF<CR>

" Disable touchpad on startup / Enable it back on exit (at the OS level)
"autocmd VimEnter * !~/development/touchpad-off.sh
"autocmd VimLeave * !~/development/touchpad-on.sh
nnoremap <silent> <F3> :!~/development/touchpad-toggle.sh <enter><CR>

" Disable arrow keys and page up / down
" noremap <Up> <nop>
" noremap <Down> <nop>
" noremap <Left> <nop>
" noremap <Right> <nop>
" inoremap <Up> <nop>
" inoremap <Down> <nop>
" inoremap <Left> <nop>
" inoremap <Right> <nop>
" vnoremap <Up> <nop>
" vnoremap <Down> <nop>
" vnoremap <Left> <nop>
" vnoremap <Right> <nop>
" noremap <PageUp> <nop>
" inoremap <PageUp> <nop>
" vnoremap <PageUp> <nop>
" noremap <PageDown> <nop>
" inoremap <PageDown> <nop>
" vnoremap <PageDown> <nop>

" Disable mouse / touchpad (only in vim)
set mouse=a
inoremap <ScrollWheelUp> <nop>
inoremap <S-ScrollWheelUp> <nop>
inoremap <C-ScrollWheelUp> <nop>
inoremap <ScrollWheelDown> <nop>
inoremap <S-ScrollWheelDown> <nop>
inoremap <C-ScrollWheelDown> <nop>
inoremap <ScrollWheelLeft> <nop>
inoremap <S-ScrollWheelLeft> <nop>
inoremap <C-ScrollWheelLeft> <nop>
inoremap <ScrollWheelRight> <nop>
inoremap <S-ScrollWheelRight> <nop>
inoremap <C-ScrollWheelRight> <nop>

" vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala

" ------------------- COC config -----------------------

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Some server have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnosticsFailed to start bloop.service: Unit bloop.service not found
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)

" Remap for do action format
"nmap <silent> F <Plug>(coc-action-format) "does not work
nnoremap <silent> F :call CocAction('format')<CR>

" Show signature help
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Show all CocCommands
nnoremap <silent> <space>c  :<C-u>CocCommand<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" close preview (shown for hover / signature help)
nnoremap <leader> <Esc> :pclose<CR>

nnoremap <silent> <M-b> :call CocRequestAsync('metals', 'workspace/executeCommand', { 'command': 'build-import' })<CR>
nnoremap <silent> <M-y> :call CocRequestAsync('metals', 'workspace/executeCommand', { 'command': 'doctor-run' })><CR>
nnoremap <silent> <M-c> :call CocRequestAsync('metals', 'workspace/executeCommand', { 'command': 'build-connect' })<CR>
"nnoremap <silent> <M-Z> :ccl<CR>

" COC Snippets

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)


" No preview window on autocompletion (vim-lsc)
"set completeopt-=preview

" Close preview window on autocompletion (metals / vim-lsc)
"autocmd CompleteDone * silent! pclose

" Haskell plugins
nnoremap <silent> ;h :execute "Unite -start-insert haskellimport"<CR>
"nnoremap <silent> <C-h> :execute "Unite hoogle"<CR> " too slow

" Diagnostics highlighting
"hi link ALEError Error
"hi Warning term=underline cterm=underline ctermfg=Yellow gui=undercurl guisp=Gold
"hi link ALEWarning Warning
"hi link ALEInfo SpellCap

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

set relativenumber
