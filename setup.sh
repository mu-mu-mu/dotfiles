#! /bin/bash
set -eux

curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
ln -s -f ~/dotfiles/.vimrc ~/.vimrc
mkdir -p  ~/.vim/rc
ln -s -f  ~/dotfiles/dein.toml ~/.vim/rc/dein.toml
ln -s -f  ~/dotfiles/dein_lazy.toml ~/.vim/rc/dein_lazy.toml

mkdir -p ~/.tmux/plugins
ln -s -f  ~/dotfiles/.tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -s -f  ~/dotfiles/.zshrc ~/.zshrc
touch ~/.gitconfig.local
ln -s -f  ~/dotfiles/.gitconfig ~/.gitconfig

ln -s -f  ~/dotfiles/.neomuttrc ~/.neomuttrc
