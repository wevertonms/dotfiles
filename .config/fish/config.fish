set -x PATH ~/.local/bin/ $PATH
set -x PYENV_ROOT "$HOME/.pyenv"
set -x PATH $HOME/bin $PATH
set -x PATH $PYENV_ROOT/bin $PATH
set -x JAVA_HOME /usr/lib/jvm/default
#set -x ANDROID_HOME ~/Android/Sdk/
set -x QT_QPA_PLATFORMTHEME qt5ct
#set -x PATH $PATH $ANDROID_HOME/emulator
#set -x PATH $PATH $ANDROID_HOME/tools
#set -x PATH $PATH $ANDROID_HOME/tools/bin
#set -x PATH $PATH $ANDROID_HOME/platform-tools
set -g theme_display_virtualenv no  # Disables displaying the current virtualenv name

# set XDG_DATA_DIRS (echo $XDG_DATA_DIRS | tr : ' ')

alias dotfiles '/usr/bin/git --git-dir /home/weverton/.dotfiles/ --work-tree /home/weverton'
alias ll 'ls -alhF'
alias la 'ls -A'
alias l 'ls -CF'
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

# bass source /etc/profile

if command -v pyenv 1>/dev/null 2>&1                                                                          │
    pyenv init - | source
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval /usr/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

eval (direnv hook fish)
starship init fish | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/weverton/google-cloud-sdk/path.fish.inc' ]; . '/home/weverton/google-cloud-sdk/path.fish.inc'; end
