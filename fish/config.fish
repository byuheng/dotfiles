source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
end

# mpv + ytdl: high-quality audio-only premium YT music via Zen/Firefox symlink
# Usage: music "URL" or music "ytsearch:Song Name"
function music
    mpv --video=no \
        --ytdl-format="bestaudio/best" \
        --ytdl-raw-options="cookies-from-browser=firefox,ignore-errors=" \
        --msg-level=all=status \
        --shuffle \
        --term-osd-bar \
        $argv
end

# Usage: watch "URL"
function watch
    mpv --ytdl-format="bestvideo[height<=1080]+bestaudio/best" \
        --ytdl-raw-options="cookies-from-browser=firefox" \
        --save-position-on-quit \
        --hwdec=auto \
        $argv
end
