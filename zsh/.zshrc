autoload -Uz compinit && compinit

#
# Locale
#

export LANG="ja_JP.UTF-8"
export LC_ALL="ja_JP.UTF-8"

#
# Editor
#

export VISUAL=vim
export EDITOR=$VISUAL
export PAGER=less

#
# Browser
#

export BROWSER='open'

#
# Key Bindings
#

bindkey -e
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

#
# zplug - Zsh Plugin Manager
#

source ~/.zplug/init.zsh

zplug "sindresorhus/pure", use:"{async,pure}.zsh", as:theme
zplug "mafredri/zsh-async"
zplug "zsh-users/zsh-history-substring-search"
zplug "chrissicool/zsh-256color"
zplug "mrowa44/emojify", as:command
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "danielbayerlein/zsh-plugins"
zplug 'asdf-vm/asdf'

if ! zplug check --verbose; then
  zplug install
fi

zplug load

# asdf
if [[ -f $ZPLUG_REPOS/asdf-vm/asdf/asdf.sh ]]; then
  source $ZPLUG_REPOS/asdf-vm/asdf/asdf.sh
fi
# if [[ -f $ZPLUG_REPOS/asdf-vm/asdf/completions/asdf.bash ]]; then
#   source $ZPLUG_REPOS/asdf-vm/asdf/completions/asdf.bash
# fi
