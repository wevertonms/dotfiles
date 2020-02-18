set -x PATH ~/.local/bin/ $PATH
#set -x JAVA_HOME /usr/lib/jvm/default
#set -x ANDROID_HOME ~/Android/Sdk/
#set -x PATH $PATH $ANDROID_HOME/emulator
#set -x PATH $PATH $ANDROID_HOME/tools
#set -x PATH $PATH $ANDROID_HOME/tools/bin
#set -x PATH $PATH $ANDROID_HOME/platform-tools
set -g theme_display_virtualenv no  # Disables displaying the current virtualenv name

alias dotfiles '/usr/bin/git --git-dir=/home/weverton/.dotfiles/ --work-tree=/home/weverton'
alias ll 'ls -alF'
alias la 'ls -A'
alias l 'ls -CF'
# alias alert 'notify-send --urgency low -i "([ $status -eq 0 ]; and echo terminal || echo error)" "(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias aptin 'sudo apt install'
alias aptup 'sudo apt update'
alias aptar 'sudo apt autoremove'
alias aptse 'apt search'
alias pipin 'python3 -m  pip install --user -U'
