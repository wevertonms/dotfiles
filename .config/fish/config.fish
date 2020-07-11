set -x PATH  ~/.local/bin/ $PATH
set -x PATH $HOME/bin $PATH
# set -x PYENV_ROOT "$HOME/.pyenv"
# set -x PATH $PYENV_ROOT/bin $PATH
# set -x XDG_DATA_HOME $HOME/.local/share
# set -x XDG_CONFIG_HOME $HOME/.config $XDG_CONFIG_HOME
# set -x XDG_DATA_DIRS $HOME/.loca/share /usr/local/share/ /usr/share/
set -x EDITOR nvim
set -x JAVA_HOME /usr/lib/jvm/default
# set -x FZF_DEFAULT_COMMAND 'rg --files --smart-case --glob "!.git/*"'

set -x METBASE_VM_IP 35.247.245.255
set -x MOZ_DISABLE_GMP_SANDBOX 1
set -x QT_QPA_PLATFORMTHEME qt5ct
#set -x ANDROID_HOME ~/Android/Sdk/
#set -x PATH $PATH $ANDROID_HOME/emulator
#set -x PATH $PATH $ANDROID_HOME/tools
#set -x PATH $PATH $ANDROID_HOME/tools/bin
#set -x PATH $PATH $ANDROID_HOME/platform-tools
set -g theme_display_virtualenv no  # Disables displaying the current virtualenv name

# set XDG_DATA_DIRS (echo $XDG_DATA_DIRS | tr : ' ')

# Rust settings
set -x PATH $HOME/.cargo/bin $PATH

alias dotfiles "git --git-dir $HOME/.dotfiles/ --work-tree $HOME"
alias l 'lsd'
alias ls 'ls'
alias ll 'lsd -alhF'
alias la 'lsd -A'
# Package manager
alias aptin 'sudo apt install'
alias aptup 'sudo apt update'
alias aptar 'sudo apt autoremove'
alias aptse 'apt search'
alias pipin 'python3 -m  pip install --user -U'
alias dnfin 'sudo dnf install -y'
alias dnfse 'dnf search'
alias dnfup 'sudo dnf update -y'

alias v nvim


function mcd
    mkdir -p $argv; and cd $argv
end

# bass source /etc/profile

if command -v pyenv 1>/dev/null 2>&1
    pyenv init - | source
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval /home/wms/.miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

starship init fish | source

# Install fisher (fish shell plugins manager) when it isn't installed
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

