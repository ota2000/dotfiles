# pyenv
export PYENV_ROOT="$ANYENV_ROOT/envs/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

eval "$(/opt/homebrew/bin/brew shellenv)"
