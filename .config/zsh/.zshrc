autoload -U colors && colors
autoload -Uz run-help-git

if [ "$UID" -eq 0 ]; then NCOLOR="red"; else NCOLOR="white"; fi
PROMPT="%B%{$fg[$NCOLOR]%}%n@%m:%{$fg[blue]%}%c/%{$reset_color%}%b$ "
#RPROMPT='%F{blue}[%f%*%F{blue}]%f'

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt autocd


# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"
_comp_options+=(globdots)		# Include hidden files.


zle-line-init() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt.
zle -N zle-line-init
precmd() { EXIT_CODE=$?;if [ $EXIT_CODE -ne 0 ]; then;
	echo "\\033[0;103m[$EXIT_CODE]\\033[0m";
	fi; }

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^E' edit-command-line
bindkey -v
export KEYTIMEOUT=1

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Load zsh-syntax-highlighting; should be last.
source $XDG_CONFIG_HOME/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# search history
# source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
