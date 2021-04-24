#!/bin/bash

# Install Following Fonts
# https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k
# New Setup Install ZSH
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/lukechilds/zsh-nvm  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm

#-- .zsh config included, but they basically setup the following.
# -- Use Powerlevel10k theme
# ZSH_THEME="powerlevel10k/powerlevel10k"
# plugins=(git docker zsh-autosuggestions zsh-syntax-highlighting zsh-nvm)
cp .zshrc ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh

# If LS colors got you down =>
mkdir /tmp/LS_COLORS && curl -L https://api.github.com/repos/trapd00r/LS_COLORS/tarball/master | tar xzf - --directory=/tmp/LS_COLORS --strip=1
( cd /tmp/LS_COLORS && sh install.sh )
. "~/.local/share/lscolors.sh"