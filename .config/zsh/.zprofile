tty | grep -q '^/dev/tty.$' && [ -f "$LUNA_COLOR_PATH/colors-tty.sh" ] && . "$LUNA_COLOR_PATH/colors-tty.sh"
tty | grep -q '^/dev/tty.$' && pfetch
tty | grep -q '^/dev/tty.$'  && [ -f "/usr/share/kbd/consolefonts/ter-powerline-v20b.psf.gz" ] && setfont "/usr/share/kbd/consolefonts/ter-powerline-v20b.psf.gz"

#[ "$(tty)" = "/dev/tty1" ] &&  printf "start sway? (y/n)" && read -k ans && [ "$ans" = "y" ] && {
[ "$(tty)" = "/dev/tty1" ] && {
  export XDG_SESSION_TYPE=wayland
  export XDG_CURRENT_DESKTOP=sway
  #export WLR_RENDERER=vulkan
  exec dbus-run-session sway 
}

#tmp_hist="$(mktemp)"
#echo "$(sort $XDG_CACHE_HOME/zsh/history)" | uniq > "$tmp_hist"
#mv "$tmp_hist" "$XDG_CACHE_HOME/zsh/history"
