source /usr/share/cachyos-fish-config/cachyos-config.fish

#Ensure system-installed fisher is loaded
if not functions -q fisher
    source /usr/share/fish/vendor_functions.d/fisher.fish
end

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
end

# Theme
set --global fish_color_autosuggestion 504945
set --global fish_color_cancel -r
set --global fish_color_command a9b665
set --global fish_color_comment 928374
set --global fish_color_cwd green
set --global fish_color_cwd_root red
set --global fish_color_end ea6962
set --global fish_color_error ea6962
set --global fish_color_escape 89b482
set --global fish_color_history_current --bold
set --global fish_color_host normal
set --global fish_color_host_remote yellow
set --global fish_color_match --background=3c3836
set --global fish_color_normal d4be98
set --global fish_color_operator 89b482
set --global fish_color_param d4be98
set --global fish_color_quote d8a657
set --global fish_color_redirection d3869b
set --global fish_color_search_match --background=3c3836
set --global fish_color_selection --background=3c3836
set --global fish_color_status red
set --global fish_color_user brgreen
set --global fish_color_valid_path 89b482
set --global fish_pager_color_background
set --global fish_pager_color_completion d4be98
set --global fish_pager_color_description 928374
set --global fish_pager_color_prefix d4be98 --bold --underline
set --global fish_pager_color_progress 504945 --background=d4be98
set --global fish_pager_color_secondary_background
set --global fish_pager_color_secondary_completion
set --global fish_pager_color_secondary_description
set --global fish_pager_color_secondary_prefix
set --global fish_pager_color_selected_background -r
set --global fish_pager_color_selected_completion
set --global fish_pager_color_selected_description
set --global fish_pager_color_selected_prefix

set --erase --universal fish_key_bindings

# Pure
set -g pure_enable_single_line_prompt false
set -g pure_show_user_host false

# mpv + ytdl: high-quality audio-only premium YT music via Zen/Firefox symlink
# Usage: music "URL" or music "ytsearch:Song Name"

