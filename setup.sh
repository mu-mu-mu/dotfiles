#! /bin/bash

curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
ln -s -f ~/dotfiles/.vimrc ~/.vimrc
mkdir -p  ~/.vim/rc
ln -s -f  ~/dotfiles/dein.toml ~/.vim/rc/dein.toml
ln -s -f  ~/dotfiles/dein_lazy.toml ~/.vim/rc/dein_lazy.toml
ln -s -f  ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s -f  ~/dotfiles/.zshrc ~/.zshrc
ln -s -f  ~/dotfiles/.gitconfig ~/.gitconfig
