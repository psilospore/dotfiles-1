call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'Raimondi/delimitMate' " Auto-close quotes, parenthesis, brackets, etc.
Plug 'duff/vim-bufonly' " A script to close all buffers but the one that is open
Plug 'itchyny/lightline.vim' " Adds a statusline
Plug 'jpalardy/vim-slime' " Adds REPL support
Plug 'junegunn/rainbow_parentheses.vim' " Color codes parenthesis or brackets
Plug 'mattn/emmet-vim', { 'for': [ 'html', 'css', 'javascriptreact' ] } " html snippets
Plug 'neoclide/coc.nvim', {'branch': 'release'} " VSCode like LSP client
Plug 'romainl/vim-cool' " Disables search highlighting when you are done searching and re-enables it when you search again 
Plug 'sbdchd/neoformat' " Add a :Neoformat command to format code
Plug 'scrooloose/nerdcommenter' " An auto comment or un-commenting command
Plug 'scrooloose/nerdtree' " A file browser
Plug 'sheerun/vim-polyglot' " Adds a bunch of syntax highlight suport for many file types
Plug 'tpope/vim-fugitive' " Git support
Plug 'tpope/vim-abolish' " Case matching search replace with %S
Plug 'vim-scripts/Tabmerge' " A script to merge tabs
Plug 'arcticicestudio/nord-vim' " nord color scheme
Plug 'editorconfig/editorconfig-vim' " editorconfig support
Plug 'vmchale/dhall-vim' " dhall support
Plug 'kosayoda/nvim-lightbulb' " VSCode like lightbulb
Plug 'vimwiki/vimwiki' 
Plug 'lervag/vimtex'

call plug#end()

" Turn syntax highlighting on
syntax on

" Theme
if (has("termguicolors"))
  set termguicolors
endif
let g:nord_cursor_line_number_background = 1
let g:nord_italic = 1
let g:nord_bold = 1
let g:nord_underline = 1
set cursorline
colorscheme nord

" Indent settings
set autoindent
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4

" Fold settings
set nofoldenable

" Search settings
set incsearch
set smartcase
set path+=*│*

" Latex https://castel.dev/post/lecture-notes-1/
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'


" Use relative line numbers
set number relativenumber

" Tab completion for : commands
set wildmenu

" Auto reload the file when it changes on disk
set autoread

" Show current command in the bottom left
set showcmd

" Avoid resizing panes when another closes
set noequalalways

set nohidden

" Recommended from https://github.com/neoclide/coc.nvim#example-vim-configuration
set updatetime=300
set shortmess+=c

" Fixes HMR for Parcel. https://parceljs.org/hmr.html#safe-write
set backupcopy=yes

" Use backup, undo, and swap folders
set backup
set undofile
set undodir=~/.local/share/nvim/undo//
set backupdir=~/.local/share/nvim/backup//
set directory=~/.local/share/nvim/swap//

" change the leader key from "\" to "," ("," is also popular)
let mapleader=";"

" Move split focus with Ctrl + hjkl
noremap <silent> <c-h> <c-w>h
noremap <silent> <c-j> <c-w>j
noremap <silent> <c-k> <c-w>k
noremap <silent> <c-l> <c-w>l

" Replace confirm highlighted words
" https://stackoverflow.com/a/676619/12963115
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

set nowrap

" https://github.com/vimwiki/vimwiki#prerequisites
set nocompatible

" Enable ftplugins
filetype plugin on

" SLIME
let g:slime_target = "neovim"
let g:slime_paste_file = "$XDG_RUNTIME_DIR/slime"
command JobID :echo b:terminal_job_id
map <leader>i <Plug>SlimeRegionSend

" Show number of matches in command line
let g:CoolTotalMatches = 1

" NERDTree Toggle
noremap <leader>; :NERDTreeToggle<CR>
let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'

" Terminal
nnoremap <leader>ntt :tabe<CR><ESC>:terminal<CR>
nnoremap <leader>nts :split<CR><ESC>:terminal<CR>
nnoremap <leader>ntv :vsplit<CR><ESC>:terminal<CR>

" Remove color from sign column
highlight SignColumn ctermbg=none

" Workaround for already open tabs with fzf.vim
" https://github.com/junegunn/fzf.vim/issues/435#issuecomment-511039236
let g:fzf_buffers_jump = 1
function! s:GotoOrOpen(command, ...)
  for file in a:000
    if a:command == 'e'
      exec 'e ' . file
    else
      exec "tab drop " . file
    endif
  endfor
endfunction
command! -nargs=+ GotoOrOpen call s:GotoOrOpen(<f-args>)

" https://www.chrisatmachine.com/Neovim/08-fzf/
" fzf keybindings
"

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'GotoOrOpen tab',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'enter': 'GotoOrOpen tab' }


" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

map <C-f> :Files <CR>
map <leader>b :Buffers <CR>
nnoremap <leader>g :Rg <CR>
" nnoremap <C-p> :Tags <C-R><C-W><CR>
nnoremap <C-p> :Tags <CR>
nnoremap <C-m> :Marks <CR>


let g:fzf_tags_command = 'haskdogs || ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"


" CoC Key Bindings
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> <leader>I <Plug>(coc-implementation)
nmap <silent> <leader>h :call CocAction('doHover')<CR>
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>t <Plug>(coc-type-definition)
nmap <silent> <leader>r <Plug>(coc-references)
nmap <silent> <leader>R <Plug>(coc-rename)
vmap <silent> <leader>f <Plug>(coc-format-selected)
nmap <silent> <leader>f <Plug>(coc-format)
nmap <silent> <leader>F <Plug>(coc-fix-current)
nmap <silent> <leader>m <Plug>(coc-codeaction)
nmap <silent> <leader>e <Plug>(coc-diagnostic-info)
nmap <silent> <leader>a <Plug>(coc-codeaction-cursor)
vmap <silent> <leader>a <Plug>(coc-codeaction-selected)
nmap <silent> <leader>c <Plug>(coc-codelens-action)
nmap <silent> <F7> <Plug>(coc-diagnostic-next)
nmap <silent> <F8> <Plug>(coc-diagnostic-next-error)

" CoC extensions
let g:coc_global_extensions=[
    \ 'coc-css',
    \ 'coc-eslint',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-metals',
    \ 'coc-prettier',
    \ 'coc-sh',
    \ 'coc-tsserver'
\ ]

" Rainbow parens
let g:rainbow#pairs = [['(', ')'], ['[', ']']]
autocmd Syntax * RainbowParentheses

" Since lightline shows the mode, we no longer need it shown on the last line
set noshowmode

" https://vim.fandom.com/wiki/Mac_OS_X_clipboard_sharing
" https://stackoverflow.com/a/30691754/12963115
set clipboard^=unnamed,unnamedplus

" Show hidden files .
let NERDTreeShowHidden=1

" Lightline settings
" Taken from :help lightline-nice-examples
let g:lightline = {
    \ 'colorscheme': 'nord',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
    \ },
    \ 'component_function': {
    \   'fugitive': 'LightlineFugitive',
    \   'filename': 'LightlineFilename'
    \ }
    \ }
function! LightlineModified()
    return &ft =~# 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! LightlineReadonly()
    return &ft !~? 'help\|vimfiler' && &readonly ? 'RO' : ''
endfunction
function! LightlineFilename()
    return (LightlineReadonly() !=# '' ? LightlineReadonly() . ' ' : '') .
    \ (&ft ==# 'vimfiler' ? vimfiler#get_status_string() :
    \  &ft ==# 'unite' ? unite#get_status_string() :
    \  &ft ==# 'vimshell' ? vimshell#get_status_string() :
    \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]') .
    \ (LightlineModified() !=# '' ? ' ' . LightlineModified() : '')
endfunction
function! LightlineFugitive()
    if &ft !~? 'vimfiler' && exists('*FugitiveHead')
        return FugitiveHead()
    endif
    return ''
endfunction
