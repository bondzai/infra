#!/bin/bash
sudo pacman --noconfirm -Rnc zsh
sudo pacman --noconfirm -Sy zsh git
rm "$HOME/.zshrc"
rm -rf "$HOME/.oh-my-zsh"
sudo rm -rf "/etc/zsh"
sh -c "$(curl -fsSL raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

yay -S gnome-terminal-transparency
