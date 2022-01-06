#!/bin/sh

# brew がインストールされていなければインストール
if [ -z "$(command -v brew)" ]; then
    echo "--- Install Homebrew is Start! ---"

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo "--- Install Homebrew is Done!  ---"
fi

# dotfilesを配置
echo "--- Link dotfiles is Start! ---"

# vim
# ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc

# zsh
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zprofile ~/.zprofile

# starship
# mkdir -p ~/.config
# ln -sf ~/dotfiles/starship/starship.toml ~/.config/starship.toml

# asdf
ln -sf ~/dotfiles/.asdfrc ~/.asdfrc
ln -sf ~/dotfiles/.tool-versions ~/.tool-versions

# git
mkdir -p ~/.config/git
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.config/git/ignore ~/.config/git/ignore

# hyper
ln -sf ~/dotfiles/.hyper.js ~/.hyper.js

echo "--- Link dotfiles is Done!  ---"


echo "--- Brew bundle is Start! ---"

ln -sf ~/dotfiles/.Brewfile ~/.Brewfile
brew bundle --global --force
brew bundle cleanup --global --force

echo "--- Brew bundle is Done!  ---"


echo "--- Add Aliases is Start! ---"

source ~/dotfiles/.aliases

echo "--- Add Aliases is Done!  ---"
