tty | grep -q '^/dev/tty.$' && [ -f "$LUNA_COLOR_PATH/colors-tty.sh" ] && . "$LUNA_COLOR_PATH/colors-tty.sh"
tty | grep -q '^/dev/tty.$' && pfetch
tty | grep -q '^/dev/tty.$'  && [ -f "/usr/share/kbd/consolefonts/ter-powerline-v20b.psf.gz" ] && setfont "/usr/share/kbd/consolefonts/ter-powerline-v20b.psf.gz"

export WLR_DRM_DEVICES=/dev/dri/card1:/dev/dri/card0
export WLR_RENDER_DRM_DEVICE=/dev/dri/renderD128
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway

#[ "$(tty)" = "/dev/tty1" ] &&  printf "start sway? (y/n)" && read -k ans && [ "$ans" = "y" ] && {
[ "$(tty)" = "/dev/tty1" ] && {
  exec sway --unsupported-gpu
}

#tmp_hist="$(mktemp)"
#echo "$(sort $XDG_CACHE_HOME/zsh/history)" | uniq > "$tmp_hist"
#mv "$tmp_hist" "$XDG_CACHE_HOME/zsh/history"
