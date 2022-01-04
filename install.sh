DOT_DIR=$HOME/dotfiles

# clone
git clone https://github.com/OTA2000/dotfiles.git ${DOT_DIR}

# link
ln -sf $DOT_DIR/.zshrc ~/.zshrc
ln -sf $DOT_DIR/.gitconfig ~/.gitconfig
ln -sf $DOT_DIR/.gitignore ~/.config/git/ignore
