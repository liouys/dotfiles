#!/bin/bash
PLUG_VIM_URL=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs $PLUG_VIM_URL

if [ ! -d ~/.config/nvim ]; then
  mkdir -p ~/.config/nvim/plugged
  ln -s `pwd`/init.vim ~/.config/nvim/init.vim
else
  echo '--//warn: ~/.config/nvim directory is exist.'
fi

if [ ! -d ~/.vim ]; then
  mkdir -p ~/.vim
  ln -s ~/.config/nvim/autoload ~/.vim/autoload
  ln -s ~/.config/nvim/plugged ~/.vim/plugged
fi

if [ ! -f ~/.vimrc ]
then
  ln -s `pwd`/init.vim ~/.vimrc
else
  echo '--//warn: ~/.vimrc is exists.'
fi

if [ ! -f ~/.gitconfig ]
then
  ln -s `pwd`/gitconfig ~/.gitconfig
else
  echo '--//warn: ~/.gitconfig is exists.'
fi

if [ ! -f ~/.tmux.conf ]
then
  ln -s `pwd`/tmux.conf ~/.tmux.conf
  ln -s `pwd`/tmux.conf.local ~/.tmux.conf.local
else
  echo '--//warn: ~/.tmux.conf is exists.'
fi
