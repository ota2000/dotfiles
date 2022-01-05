# pyenv
export PYENV_ROOT="$ANYENV_ROOT/envs/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# include .zshrc if it exists
if [ -f "$HOME/.zshrc" ]; then
  . "$HOME/.zshrc"
fi
