function fpac
    set package (pacman -Ssq | fzf -m --preview="pacman -Si {}" --bind=space:toggle-preview)
    if test $package
        sudo pacman -S $package
    end
end

