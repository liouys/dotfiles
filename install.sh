#!/bin/bash
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/nvim/plugged
mkdir -p ~/.vim
ln -s ~/.config/nvim/autoload ~/.vim/autoload
ln -s ~/.config/nvim/plugged ~/.vim/plugged

ln -s `pwd`/init.vim ~/.config/nvim/init.vim
ln -s `pwd`/init.vim ~/.vimrc
ln -s `pwd`/gitconfig ~/.gitconfig
ln -s `pwd`/tmux.conf ~/.tmux.conf
