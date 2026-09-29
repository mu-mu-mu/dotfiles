#! /bin/bash
set -eux

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

touch ~/.zshrc.local

mkdir -p ~/bin
mkdir -p ~/.local/bin

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
ln -s -f  ~/dotfiles/.mbsyncrc ~/.mbsyncrc

ln -s -f  ~/dotfiles/nvim ~/.config/nvim

ln -s -f ~/dotfiles/.wezterm.lua ~/.wezterm.lua

"${script_dir}/install.sh" keyd

if [ ! -e /etc/keyd/default.conf ]; then
  sudo install -D -m 0644 "${script_dir}/keyd/default.conf" /etc/keyd/default.conf
  sudo keyd reload
fi
