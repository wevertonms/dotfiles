DIST=$(lsb_release -a 2> /dev/null | grep "Distributor ID" | cut -f2 -d:)

case $DIST in
"manjaro"|"arch")
    sudo pacman-mirrors -g
    sudo pacman -S yay yakuake firefox ttf-fira-code refind-efi papirus-icon-theme filelight inkscape gimp vlc filelight meld mlocate
    yay -S codium dropbox sublime-text mailspring
    # Repositório Manjariando
    sudo pacman -U
    https://gitlab.com/manjariando/unsigned-packages/raw/master/repo-manjariando/x86
    _64/repo-manjariando-1.5-1-x86_64.pkg.tar.xz
    ;;
"ubuntu"|"neon")
    sudo apt update && sudo apt upgrade -y
    sudo add-apt-repository ppa:fish-shell/release-3 -y
    sudo apt install yakuake fish git -y
;;
*)
    echo "Distro $DIST not found :/"
esac

# Mudança do shell padrão
chsh -s $(which fish)

restore_script="restore_dotfiles.sh"
wget 'https://gist.githubusercontent.com/wevertonms/34c0eb3967caada1be1d968a791d5200/raw/8752105fc25364b76b11089b128aef633bf968bb/restore_dotfiles.sh' -o $restore_script
chmod +x $restore_script
bash $restore_script


# Aumenta o limite do file watcher
echo 'fs.inotify.max_user_watches=524288' | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
