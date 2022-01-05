DOT_DIR=$HOME/dotfiles

git -C ${DOT_DIR} pull origin main

# link
ln -sf $DOT_DIR/.zshrc ~/.zshrc
ln -sf $DOT_DIR/.zsh_history ~/.zsh_history
ln -sf $DOT_DIR/.gitconfig ~/.gitconfig
ln -sf $DOT_DIR/.config/git/ignore ~/.config/git/ignore
