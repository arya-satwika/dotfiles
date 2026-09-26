# Poimandres theme for fish shell
# Based on https://github.com/drcmda/poimandres-theme

# Syntax highlighting
set -g fish_color_normal a6accd
set -g fish_color_command 5de4c7
set -g fish_color_keyword d0679d
set -g fish_color_quote fffac2
set -g fish_color_redirection add7ff
set -g fish_color_end 89ddff
set -g fish_color_error d0679d
set -g fish_color_param a6accd
set -g fish_color_comment 787c99
set -g fish_color_selection --background=2a2e3f
set -g fish_color_search_match --background=2a2e3f
set -g fish_color_operator fcc5e9
set -g fish_color_escape 5de4c7
set -g fish_color_autosuggestion 787c99
set -g fish_color_cwd 5de4c7
set -g fish_color_cwd_root d0679d
set -g fish_color_user add7ff
set -g fish_color_host fcc5e9
set -g fish_color_host_remote fffac2
set -g fish_color_status d0679d
set -g fish_color_cancel --reverse

# Pager (completion menu)
set -g fish_pager_color_progress 787c99
set -g fish_pager_color_prefix 89ddff --bold
set -g fish_pager_color_completion a6accd
set -g fish_pager_color_description 787c99
set -g fish_pager_color_selected_background --background=2a2e3f
set -g fish_pager_color_selected_prefix 5de4c7 --bold
set -g fish_pager_color_selected_completion ffffff
set -g fish_pager_color_selected_description a6accd

set -gx EZA_COLORS "da=38;2;173;215;255:di=38;2;137;221;255:ex=38;2;93;228;199:ln=38;2;252;197;233"