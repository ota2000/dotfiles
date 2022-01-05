autoload -U compinit
compinit

# zplug
source ~/.zplug/init.zsh

# theme
# zplug romkatv/powerlevel10k, as:theme, depth:1
zplug "sindresorhus/pure"

zplug "mafredri/zsh-async"
zplug "zsh-users/zsh-history-substring-search"
zplug "chrissicool/zsh-256color"
zplug "mrowa44/emojify", as:command


# syntax highlighting
zplug "zsh-users/zsh-syntax-highlighting"

# 補完の強化
zplug "zsh-users/zsh-completions"
# 履歴補完の強化
zplug "zsh-users/zsh-autosuggestions"

zplug load

# コマンドの履歴機能
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# alias
alias ls="ls -G"
alias ll="ls -lah"
alias la="ls -lah"
alias tf="terraform"

# anyenv
if [ -e "$HOME/.anyenv" ]
then
    export ANYENV_ROOT="$HOME/.anyenv"
    export PATH="$ANYENV_ROOT/bin:$PATH"
    if command -v anyenv 1>/dev/null 2>&1
    then
        eval "$(anyenv init -)"
    fi
fi

# pyenv
eval "$(pyenv init -)"

# PATH
export PATH="/opt/homebrew/opt/bison/bin:$PATH"
export PATH="/opt/homebrew/opt/libxml2/bin:$PATH"
export PATH="/opt/homebrew/opt/bzip2/bin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/libiconv/bin:$PATH"
export PATH="/opt/homebrew/opt/krb5/bin:$PATH"
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export PATH="/opt/homebrew/opt/icu4c/bin:$PATH"
export PATH="/opt/homebrew/opt/tidy-html5/lib:$PATH"

# PKG_CONFIG_PATH
export PKG_CONFIG_PATH="/opt/homebrew/opt/krb5/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/icu4c/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libedit/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libjpeg/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libpng/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libxml2/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libzip/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/oniguruma/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/tidy-html5/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/pcre2/lib/pkgconfig:$PKG_CONFIG_PATH"

# PHP_RPATHS
export PHP_RPATHS="/opt/homebrew/opt/zlib/lib /opt/homebrew/opt/bzip2/lib /opt/homebrew/opt/curl/lib /opt/homebrew/opt/libiconv/lib /opt/homebrew/opt/libedit/lib"

# PHP_BUILD_CONFIGURE_OPTS
export PHP_BUILD_CONFIGURE_OPTS="--with-bz2=$(brew --prefix bzip2) --with-iconv=$(brew --prefix libiconv) --with-tidy=$(brew --prefix tidy-html5) --with-external-pcre=$(brew --prefix pcre2) --with-zip --enable-intl --with-pear"
