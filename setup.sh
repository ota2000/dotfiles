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

echo "--- asdf setting is Start! ---"
log() {
    message=$1
    echo "$message"
}
is_dir() {
    path=$1
    [ -d "$path" ]
}

for plugin in $(awk '{print $1}' ~/.tool-versions); do
    if ! is_dir ~/.asdf/plugins/"$plugin"; then
        asdf plugin add "$plugin"
    fi
done

is_runtime_versions_changed() {
    plugin="$1"
    specified=$(grep "$plugin" ~/.tool-versions | awk '
    {$1=""; print $0}')

    installed=$(asdf list "$plugin" 2>&1)

    is_changed=
    for version in $specified; do
        match=$(echo "$installed" | grep "$version")
        [ -z "$match" ] && is_changed=1
    done

    [ "$is_changed" ]
}

for plugin in $(asdf plugin list); do
    if is_runtime_versions_changed "$plugin"; then
        if [ "$plugin" = nodejs ]; then
            log "Import release team keyring for Node.JS"
            bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-previous-release-team-keyring'
        fi
        log "Install runtime: $plugin"
        asdf install "$plugin"
    fi
done

echo "--- asdf setting is Done!  ---"

if ask 'macOS setup?'; then
    echo "--- Setup macOS is Start! ---"
    source ~/dotfiles/.macos
    echo "--- Setup macOS is Done!  ---"
fi
