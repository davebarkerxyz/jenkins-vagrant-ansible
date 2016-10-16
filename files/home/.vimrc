" Make it look nice
colorscheme wombat256dave
syntax on
set number
set ruler

" Set font
if has("gui_running")
    if has("gui_gtk2")
        set guifont=Droid\ Sans\ Mono\ 10
    elseif has("gui_win32")
        set guifont=Droid\ Sans\ Mono\:h8 
    endif
endif

" Tabs (4 sp, no hard tabs)
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Word wrap off
set nowrap

" Backspace/Delete work across lines in insert mode
set backspace=indent,eol,start

" Smart indentation (auto indent)
set smartindent

" Prevent Python comments being shifted left when smartindent is on
inoremap # X#

" Nice file, etc autocmpletion
set wildmode=list:longest,full
set wildmenu

" 256 color in terminal modes
set t_Co=256

" Open new vsplits on the right
set splitright

" Wrap cursor movement at end of line
set whichwrap+=h,l,<,>

" Set gVim default size
if has("gui_running")
  set lines=50 columns=125
endif


" Gui options:
"   a       autoselect: when visually selecting, auto-yank to "* register
"   g       grey out inactive menu items (when menu is enabled)
"   i       use Vim icon in window titlebar on supported themes
"   r       right-hand scrollbar is always present
"   t       use tear-off menu items (when menu is enabled, and on supported platforms)
set guioptions=agirt

" Easier escaping from insert mode
imap jj <Esc>


" Allow moving lines with Alt-j, Alt-k
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Highlight search results
set hlsearch

" Disable swap file
set noswapfile

" Set j/k to gj/gk so they move onto wrapped lines nicely
map j gj
map k gk

" Settings for NERDTree
map <C-n> :NERDTreeToggle<cr>
let NERDTreeIgnore = ['\.pyc$', '\.class$', '__pycache__$']


filetype plugin on

" Set case insensitive search
set ignorecase

" Syntax highlighting for Arduino files
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

" Hard tabs for makefiles
autocmd FileType make setlocal noexpandtab

" Backslash to nohl
nmap ` :nohl<cr>

" Buffer-related shortcuts
nnoremap <Leader>b :buffers<cr>:buffer<space>
nnoremap <Leader>d :bd<cr>
nnoremap <Leader>n :bnext<cr>
nnoremap <F9> :bnext<cr>

" Plugin bundles
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/nerdtree.vim
set runtimepath^=~/.vim/bundle/ack.vim
set runtimepath^=~/.vim/bundle/vim-commentary.vim

" CtrlP Config
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|\.hg$\|\.svn$\|build$',
\ 'file': '\v\.(exe|so|dll|class)$',
\ }

" Ack config
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
nnoremap <C-k> :Ack! 
