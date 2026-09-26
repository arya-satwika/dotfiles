# List files respecting .gitignore
function _fish_eza_l --wraps _fish_eza_ll
    _fish_eza_ll --git-ignore --total-size $argv
end
