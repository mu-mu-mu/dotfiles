#! /bin/bash

ln -s ~/dotfiles/.vimrc ~/.vimrc
mkdir ~/.vim/rc
ln -Fs ~/dotfiles/dein.toml ~/.vim/rc/dein.toml
ln -Fs ~/dotfiles/dein_lazy.toml ~/.vim/rc/dein_lazy.toml
ln -Fs ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -Fs ~/dotfiles/.zshrc ~/.zshrc
ln -Fs ~/dotfiles/.gitconfig ~/.gitconfig
