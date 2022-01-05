DOT_DIR=$HOME/dotfiles

git -C ${DOT_DIR} pull origin main

# link
./ln.sh
