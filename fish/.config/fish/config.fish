if status is-interactive
    starship init fish | source
    fastfetch
end

export eza_params="--icons --group-directories-first --no-time --no-user -w 101 --smart-group --git-repos"

fish_add_path ~/.local/bin ~/.opencode/bin ~/.spicetify
alias lg lazygit
alias cls clear
alias dotfiles 'cd ~/dotfiles'