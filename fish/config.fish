# Source CachyOS base config
if test -f /usr/share/cachyos-fish-config/cachyos-config.fish
    source /usr/share/cachyos-fish-config/cachyos-config.fish
end

# Auto-launch Sway on tty1 login with NVIDIA flags
if status is-login
    if test -z "$WAYLAND_DISPLAY" -a "$XDG_VTNR" = 1
        set -gx LIBVA_DRIVER_NAME nvidia
        set -gx XDG_SESSION_TYPE wayland
        set -gx __GLX_VENDOR_LIBRARY_NAME nvidia
        set -gx GBM_BACKEND nvidia-drm
        set -gx NVD_BACKEND direct
        set -gx ELECTRON_OZONE_PLATFORM_HINT auto
        set -gx SWAY_UNSUPPORTED_GPU 1

        exec sway --unsupported-gpu
    end
end

# Disable fastfetch/welcome greeting
function fish_greeting
end

# Clear custom keybindings override if unwanted
set --erase --universal fish_key_bindings

# Interactive Shell Settings (Theme & Prompt Overrides)
if status is-interactive

    # --- Gruvbox Dark Material Syntax Highlighting ---
    set -g fish_color_normal d4be98
    set -g fish_color_command a9b665
    set -g fish_color_keyword ea6962
    set -g fish_color_quote d8a657
    set -g fish_color_redirection d3869b
    set -g fish_color_end e78a4e
    set -g fish_color_error ea6962
    set -g fish_color_param d4be98
    set -g fish_color_comment 928374
    set -g fish_color_selection --background=504945
    set -g fish_color_search_match --background=504945
    set -g fish_color_operator e78a4e
    set -g fish_color_escape 89b482
    set -g fish_color_autosuggestion 7c6f64
    set -g fish_color_cancel -r
    set -g fish_color_cwd a9b665
    set -g fish_color_cwd_root ea6962
    set -g fish_color_host d4be98
    set -g fish_color_host_remote d8a657
    set -g fish_color_status ea6962
    set -g fish_color_user a9b665
    set -g fish_color_valid_path 89b482

    # --- Pager Colors ---
    set -g fish_pager_color_background
    set -g fish_pager_color_completion d4be98
    set -g fish_pager_color_description 928374
    set -g fish_pager_color_prefix d4be98 --bold --underline
    set -g fish_pager_color_progress 504945 --background=d4be98
    set -g fish_pager_color_secondary_background
    set -g fish_pager_color_secondary_completion
    set -g fish_pager_color_secondary_description
    set -g fish_pager_color_secondary_prefix
    set -g fish_pager_color_selected_background -r
    set -g fish_pager_color_selected_completion
    set -g fish_pager_color_selected_description
    set -g fish_pager_color_selected_prefix

    # --- Pure Prompt Overrides ---
    set -g pure_enable_single_line_prompt false
    set -g pure_show_user_host false
    set -g pure_color_current_directory a9b665
    set -g pure_color_primary d4be98
    set -g pure_color_git_branch 504945
    set -g pure_color_git_dirty ea6962
    set -g pure_color_git_stash d8a657
    set -g pure_color_git_unpulled_commits 89b482
    set -g pure_color_git_unpushed_commits 89b482

end
