" Note: Skip initialization for vim-tiny or vim-small.

if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" everything start here...

let mapleader=','

" --//dep bundles
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\	'mac' : 'make -f make_mac.mak',
\   'linux' : 'make',
\   'unix' : 'gmake',
\	},
\}
NeoBundle 'Shougo/neocomplcache.vim'
let g:neocomplcache_enable_at_startup = 1
NeoBundle 'Shougo/vimshell.vim'

" core plugins
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<leader>t'
let g:ctrlp_max_height = 30
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height = 20
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_switch_buffer = 'e'
nnoremap <leader>ev :CtrlP app/views<cr>
nnoremap <leader>ec :CtrlP app/controllers<cr>
nnoremap <leader>em :CtrlP app/models<cr>
nnoremap <leader>el :CtrlP lib<cr>
nnoremap <leader>ea :CtrlP app/assets<cr>
nnoremap <leader>ep :CtrlP public<cr>
nnoremap <leader>er :topleft :vsplit config/routes.rb<cr>
nnoremap <leader>eg :topleft :vsplit Gemfile<cr>

" --//vim main plugins
NeoBundle 'sjl/gundo.vim'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
set laststatus=2
set encoding=utf-8
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#fnamemod = ':t'

"NeoBundle 'jlanzarotta/bufexplorer'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'vim-scripts/tComment'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
nnoremap <leader>W :Gwrite<CR>
nnoremap <leader>C :Gcommit -v<CR>
nnoremap <leader>S :Gstatus \| 7<CR>
inoremap <leader>W <Esc><leader>W
inoremap <leader>C <Esc><leader>C
inoremap <leader>S <Esc><leader>S

NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'xolox/vim-session'
NeoBundle 'xolox/vim-misc'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'easymotion/vim-easymotion'

" --// togglable panels
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
map <leader>nt :NERDTreeFind<CR>
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:NERDTreeWinSize = 35
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'majutsushi/tagbar'

" --//language bundle
NeoBundle 'elzr/vim-json'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'othree/javascript-libraries-syntax.vim'

NeoBundle 'fatih/vim-go'
NeoBundleLazy 'klen/python-mode', {'autoload': {'filetypes': ['python']}}
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'vim-scripts/c.vim'
NeoBundle 'groovy.vim'
NeoBundle 'vim-gradle'
NeoBundle 'hhys/yaml-vim'

" --// database
NeoBundle 'vim-scripts/SQLUtilities'
NeoBundle 'NagatoPain/AutoSQLUpperCase.vim'

" --// autocomplete
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'

" --// snippets
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'

NeoBundle 'L9' " function utility library.
NeoBundle 'Shougo/unite.vim'

" --// configure management tools 
NeoBundle 'saltstack/salt-vim'
NeoBundle 'pearofducks/ansible-vim'

call neobundle#end()

" enable all the plugin
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" General
syntax on
set mouse=a
set clipboard=unnamed
set history=1000
autocmd FileType python setlocal et sta sw=4 sts=4
autocmd FileType python setlocal foldmethod=indent
set foldlevel=99
set noswapfile " no create swap file when open file.
set nobackup
set nowritebackup
set modeline
set modelines=5
set autowrite
set autoread

let g:is_posix = 1

" vim gui
set tabpagemax=15
set noshowmode " hide the default mode text (e.g. -- INSERT -- below the statusline)
set cursorline
set shortmess=atI
colorscheme candyman
autocmd InsertLeave * set cul
set scrolloff=3
set showcmd
set incsearch
set hlsearch
set wildmenu
set foldenable

set number
set cmdheight=2
set langmenu=none
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set viminfo+=!
filetype on
filetype indent on

nmap tt :%s/\t/    /g<CR>

" Open new split panes to right and bottom, which feels or natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Easy escaping to normal model
imap jj <esc>
imap jk <esc>

" Move to the next buffer
nmap <leader>. :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Split window Resize
"nmap <C-v> :vertical resize +5<CR>
"nmap <C-m> :vertical resize -5<CR>

" formatting
set nowrap
set autoindent
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=5
set matchpairs+=<:>

autocmd Filetype gitcommit setlocal spell textwidth=72

" Key (re)Mappings
nnoremap <leader>rs :source ~/.vimrc<CR>
nnoremap <leader>rt :tabnew ~/.vim/vimrc<CR>
nnoremap <leader>re :e ~/.vim/vimrc<CR>
nnoremap <leader>rd :e ~/.vim/ <CR>

" Use local vimrc if available {{
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

autocmd BufNewFile *.sh,*.rb,*.py exec ":call SetTile()"
func! SetTile()
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
        call append(line("."), "")
    elseif &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(line("."), "\# coding=utf-8")
        call append(line(".") + 1, "")
    endif
endfunc
autocmd BufNewFile * normal G

" togglables without FN keys
nnoremap <leader>1 :GundoToggle<CR>

" macos vs linux clipboard
if has("mac")
    set clipboard+=unnamed
else
    set clipboard=unnamedplus
endif

" enable angular syntax
let g:used_javascript_libs = 'jquery,angularjs'
