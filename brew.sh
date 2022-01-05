#!/bin/bash

### メモ
# さきにApp storeにログインしておく
# install.shを実行しておく

### Command Line Tools
echo "installing Command Line Tools for Xcode ..."
xcode-select --install

echo "installing Homebrew ..."
which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
cd $THIS_DIR

echo "run brew doctor ..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update ..."
which brew >/dev/null 2>&1 && brew update --verbose

echo "ok. run brew upgrade ..."
brew upgrade

brew bundle --global --verbose

brew cleanup
