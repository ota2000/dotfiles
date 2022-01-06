#!/bin/sh

ask() {
    printf "$* [y/n] "
    local answer
    read answer

    case $answer in
        "yes" ) return 0 ;;
        "y" )   return 0 ;;
        * )     return 1 ;;
    esac
}

set -e

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
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/zsh/.zprofile ~/.zprofile

# starship
# mkdir -p ~/.config
# ln -sf ~/dotfiles/starship/starship.toml ~/.config/starship.toml

# asdf
ln -sf ~/dotfiles/asdf/.asdfrc ~/.asdfrc
ln -sf ~/dotfiles/asdf/.tool-versions ~/.tool-versions

# git
mkdir -p ~/.config/git
ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/git/ignore ~/.config/git/ignore

# hyper
ln -sf ~/dotfiles/hyper/.hyper.js ~/.hyper.js

echo "--- Link dotfiles is Done!  ---"


echo "--- Brew bundle is Start! ---"

ln -sf ~/dotfiles/.Brewfile ~/.Brewfile
brew bundle --global --force
brew bundle cleanup --global --force

echo "--- Brew bundle is Done!  ---"

if ask 'macOS setup?'; then
    echo "--- Setup macOS is Start! ---"
    source ~/dotfiles/.macos
    echo "--- Setup macOS is Done!  ---"
fi
