function fpac
    sudo pacman -S (pacman -Ssq | fzf -m --preview="pacman -Si {}" --bind=space:toggle-preview)
end

