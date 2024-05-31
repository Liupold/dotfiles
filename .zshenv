#!/bin/zsh
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
#export XDG_RUNTIME_DIR="$XDG_CACHE_HOME/.X11-unix/"
#mkdir -p "$XDG_RUNTIME_DIR"

export USER_BINPATH="$HOME/.local/bin/"

# zsh
#mkdir -p "$XDG_CACHE_HOME/zsh"
export ZDOTDIR="$HOME/.config/zsh"
export HISTFILE="$XDG_CACHE_HOME/zsh/history"

# cargo (rust)
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# gnupg
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

#go
export GOPATH="$XDG_DATA_HOME/go"

# gtk
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
#mkdir -p "$XDG_CONFIG_HOME/gtk-2.0"
export GTK_THEME=adw-gtk3-dark

# gradle
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"

# mplayer
export MPLAYER_HOME="$XDG_CONFIG_HOME/mplayer"

# parallel
export PARALLEL_HOME="$XDG_CONFIG_HOME/parallel"

#pylint
export PYLINTHOME="$XDG_CACHE_HOME/pylint"

#rustup
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

#urxvt
export RXVT_SOCKET="$XDG_RUNTIME_DIR/urxvtd"

#java
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export _JAVA_AWT_WM_NONREPARENTING=1

#atk
export NO_AT_BRIDGE=1

#npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

#less
export LESSHISTFILE="-"

# newsboat
#mkdir -p "$XDG_DATA_HOME/newsboat" "$XDG_CONFIG_HOME/newsboat"

# python
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pystartup.py"

# octave
export OCTAVE_HISTFILE="$XDG_CACHE_HOME/octave-hsts"
export OCTAVE_SITE_INITFILE="$XDG_CONFIG_HOME/octave/octaverc"
#mkdir -p "$XDG_DATA_HOME/octave"


export PATH="$USER_BINPATH:$GOPATH/bin/:$PATH:$CARGO_HOME/bin/:/usr/sbin/"
export FMDPY_CONFIG_FILE="$XDG_CONFIG_HOME/fmdpy.ini"
export PYDORO_CONFIG_FILE="$XDG_CONFIG_HOME/pydoro.ini"

#Progs
export EDITOR="nvim"
export TERMINAL="foot"
export BROWSER="brave-browser"
export READER="zathura --fork"
export FILE="lf"
export MUSIC_PLAYER="cmus"

#firefox
export MOZ_ENABLE_WAYLAND=1
#export MOZ_DISABLE_RDD_SANDBOX=1
#

# vulkan
#export RADV_PERFTEST=video_decode

# bemoji
export BEMOJI_PICKER_CMD="tofi -c ''"

# Luna Settings
export LUNA_CONF_PATH="$XDG_CONFIG_HOME/luna_theme/lunaconf.sh"
. "$LUNA_CONF_PATH"
