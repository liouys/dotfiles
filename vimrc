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
let mapleader=','

" --//dep bundles
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\	'mac' : 'make -f make_mac.mak',
\	},
\}
NeoBundle 'Shougo/neocomplcache.vim'
let g:neocomplcache_enable_at_startup = 1
NeoBundle 'Shougo/vimshell.vim'

" --//gui bundles
NeoBundle 'bling/vim-airline'
set laststatus=2
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline#extensions#tabline#enabled = 1

" --//language bundles
NeoBundle 'elzr/vim-json'
NeoBundle 'groovy.vim'
NeoBundle 'tfnico/vim-gradle'
NeoBundle 'gmarik/vim-markdown'
NeoBundle 'vim-coffee-script'
au BufWritePost *.coffee silent CoffeeMake!
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!
NeoBundle 'scrooloose/syntastic'

" --//tools bundles
" Git integeration
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-fugitive'
nnoremap <leader>W :Gwrite<CR>
nnoremap <leader>C :Gcommit -v<CR>
nnoremap <leader>S :Gstatus \| 7<CR>
inoremap <leader>W <Esc><leader>W
inoremap <leader>C <Esc><leader>C
inoremap <leader>S <Esc><leader>S
NeoBundle 'airblade/vim-gitgutter'

NeoBundle 'saltstack/salt-vim'
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

NeoBundle 'L9' " function utility library.
NeoBundle 'Shougo/unite.vim'
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

NeoBundleLazy 'klen/python-mode', {'autoload': {'filetypes': ['python']}}

call neobundle#end()

" Required:
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
set showmode
set cursorline
set shortmess=atI
color desert
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

" formatting
set nowrap
set autoindent
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=5
set matchpairs+=<:>

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
