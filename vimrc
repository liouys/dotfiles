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
NeoBundle 'bling/vim-airline'
NeoBundle 'elzr/vim-json'
NeoBundle 'gmarik/vim-markdown'
NeoBundle 'vim-coffee-script'

" Git integeration
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-fugitive'

nnoremap <leader>W :Gwrite<CR>
nnoremap <leader>C :Gcommit -v<CR>
nnoremap <leader>S :Gstatus \| 7<CR>
inoremap <leader>W <Esc><leader>W
inoremap <leader>C <Esc><leader>C
inoremap <leader>S <Esc><leader>S

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
" FuF customisations "{{{
let g:fuf_modesDisable = []
nnoremap <leader>h :FufHelp<CR>
nnoremap <leader>1  :FufTagWithCursorWord<CR>
nnoremap <leader>11 :FufTag<CR>
nnoremap <leader>2  :FufFileWithCurrentBufferDir<CR>
nnoremap <leader>22 :FufFile<CR>
nnoremap <leader>3  :FufBuffer<CR>
nnoremap <leader>4  :FufDirWithCurrentBufferDir<CR>
nnoremap <leader>44 :FufDir<CR>
nnoremap <leader>5  :FufBufferTag<CR>
nnoremap <leader>55 :FufBufferTagAll<CR>
nnoremap <leader>6  :FufMruFile<CR>
nnoremap <leader>7  :FufLine<CR>
nnoremap <leader>8  :FufChangeList<CR>
nnoremap <leader>9  :FufTaggedFile<CR>

nnoremap <leader>p :FufDir ~/src/<CR>
nnoremap <leader>ge :FufDir ~/.rvm/gems/<CR>

nnoremap <leader>gn :vnew \| :FufFile ~/src/notes/<CR>

NeoBundle 'yamlvim'
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


call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" General {{

filetype plugin indent on
syntax on
set mouse=a
set clipboard=unnamed
set history=1000
autocmd FileType python setlocal et sta sw=4 sts=4
autocmd FileType python setlocal foldmethod=indent
set foldlevel=99
set noswapfile
set nobackup
set nowritebackup
set modeline
set modelines=5
set autowrite
set autoread

let g:is_posix = 1

" Setting up the directories {{
" set backup
" set backupdir=$HOME/.vimbackup/
" set directory=$HOME/.vimswap/
" set viewdir=$HOME/.vimviews/

" Creating directories if they don't exist
" au BufWinLeave * silent! mkview
" au BufWinEnter * silent! loadview
" }}

" }}

" Vim UI {{
set tabpagemax=15	" only show 15 tabs
set showmode		" display the current mode
set cursorline		" highlight current line
set cuc             " highlight current column
set shortmess=atI   " 启动时不显示提示 
color desert
autocmd InsertLeave * set cul
set scrolloff=3     "光标移动到buffer的顶部和底部时保持3行距离

set laststatus=2              " always show status line.
set shortmess=atI             " shortens messages
set showcmd                   " display an incomplete command in statusline

set statusline=%<%f\          " custom statusline
set stl+=[%{&ff}]             " show fileformat
set stl+=%y%m%r%=
set stl+=%-14.(%l,%c%V%)\ %P

set foldenable                " Turn on folding
set foldmethod=marker         " Fold on the marker
set foldlevel=100             " Don't autofold anything (but I can still fold manually)

set foldopen=block,hor,tag    " what movements open folds
set foldopen+=percent,mark
set foldopen+=quickfix

set virtualedit=block

set splitbelow
set splitright

set backspace=indent,eol,start	"backspace for dummys
set linespace=0
set showmatch
set incsearch
set hlsearch
set winminheight=0
set smartcase
set wildmenu
set wildmode=list:longest,full
set whichwrap=b,s,h,l,<,>,[,]
set scrolljump=5
set scrolloff=3
set foldenable

set langmenu=none
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set number
set cmdheight=2
filetype on
filetype plugin on
filetype indent on
set viminfo+=!

nmap tt :%s/\t/    /g<CR>

" }}

" Help {{
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif
" }}

" Formatting {{
set nowrap
set autoindent
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=5
set matchpairs+=<:>
" }}

" Key (re)Mappings {{
" The default leader is '\', but many people prefer ',' as it's in a standard
" location
let mapleader=','
nnoremap <leader>rs :source ~/.vimrc<CR>
nnoremap <leader>rt :tabnew ~/.vim/vimrc<CR>
nnoremap <leader>re :e ~/.vim/vimrc<CR>
nnoremap <leader>rd :e ~/.vim/ <CR>
" }}

" GUI Settings {{
" GVIM- (heree instead of .gvimrc
if has('gui_running')
	set guioptions=cMg " console dialogs, do not show menu and toolbar
	set lines=40
else
	set term=builtin_ansi
endif
" }}

" Util Functions {{
function! InitializeDirectories()
	let separator = "."
	let parent = $HOME
	let prefix = ".vim"
	let dir_list = {'backup' : 'backupdir', 'views' : 'viewdir', 'swap' : 'directory' }
	for [dirname, settingname] in items(dir_list)
		let directory = parent . '/' . prefix . dirname . "/"
		if exists("*mkdir")
			if !isdirectory(directory)
				call mkdir(directory)
			endif
		endif
		if !isdirectory(directory)
			echo "Warning: Unable to create backup directory: " . directory
			echo "Try: mkdir -p " . directory
		else
			let directory = substitute(directory, " " , "\\\\ ", "")
			exec "set " . settingname . "=" . directory
		endif
	endfor
endfunction
" call InitializeDirectories()

function! NERDTreeInitAsNeeded()
	redir => bufoutput
	buffers!
	redir END
	let idx = stridx(bufoutput, "NERD_tree")
	if idx > -1
		NERDTreeMirror
		NERDTreeFind
		wincmd l
	endif
endfunction

" }}

" Use local vimrc if available {{
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif
" }}

" Bundle configs {{
" NERDTree {{
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
" }}

" CoffeeScript {{
au BufWritePost *.coffee silent CoffeeMake!
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!
" }}

" Create New File {{
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

" }}

" }}
