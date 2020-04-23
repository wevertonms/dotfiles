bind \cf 'fzf'



set -x PATH ~/.local/bin/ $PATH
set -x PYENV_ROOT "$HOME/.pyenv"
set -x PATH $HOME/bin $PATH
set -x PATH $PYENV_ROOT/bin $PATH
set -x EDITOR nvim
set -x JAVA_HOME /usr/lib/jvm/default
set -x FZF_DEFAULT_COMMAND 'rg --files --smart-case --glob "!.git/*"'

set -x METBASE_VM_IP 35.247.245.255
set -x MOZ_DISABLE_GMP_SANDBOX 1
#set -x ANDROID_HOME ~/Android/Sdk/
set -x QT_QPA_PLATFORMTHEME qt5ct
#set -x PATH $PATH $ANDROID_HOME/emulator
#set -x PATH $PATH $ANDROID_HOME/tools
#set -x PATH $PATH $ANDROID_HOME/tools/bin
#set -x PATH $PATH $ANDROID_HOME/platform-tools
set -g theme_display_virtualenv no  # Disables displaying the current virtualenv name

# set XDG_DATA_DIRS (echo $XDG_DATA_DIRS | tr : ' ')

# Rust settings
set -x PATH $HOME/.cargo/bin $PATH

alias dotfiles '/usr/bin/git --git-dir /home/weverton/.dotfiles/ --work-tree /home/weverton'
alias l 'lsd'
alias ls 'lsd'
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

if command -v pyenv 1>/dev/null 2>&1                                                                          │
    pyenv init - | source
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval /usr/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/data/Downloads/Compressed/google-cloud-sdk-280.0.0-linux-x86_64/google-cloud-sdk/path.fish.inc' ]; . '/data/Downloads/Compressed/google-cloud-sdk-280.0.0-linux-x86_64/google-cloud-sdk/path.fish.inc'; end

starship init fish | source
