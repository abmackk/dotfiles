### ENVIRONMENT
export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8
export TERM=xterm-256color
export HISTFILE=$HOME/.zsh_history
export EDITOR=nvim
export PATH="$HOME/.cargo/bin:$HOME/bin:$HOME/.local/bin:$PATH"
export NOTES_DIR=$HOME/Projects/notes
export FPATH="$HOME/eza/completions/zsh:$FPATH"

### PROMPT (Starship at top)
eval "$(starship init zsh)"
# Starship is now ready immediately for every interactive shell. [web:90][web:79]

# Atuin (lazy load on first Ctrl+R press)
_atuin_lazy_init() {
  eval "$(command atuin init zsh)"
  # After init, the real widget is available
  zle atuin-search
}

zle -N _atuin_lazy_init
bindkey '^r' _atuin_lazy_init

# After first use, rebind to the real widget
autoload -Uz add-zsh-hook
_atuin_rebind() {
  if typeset -f _atuin_search >/dev/null 2>&1; then
    bindkey '^r' _atuin_search
  fi
}
add-zsh-hook precmd _atuin_rebind

### COMPLETION (cached)
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit -C
else
  compinit -i
fi
# -C uses existing dump to avoid a slow rebuild unless stale. [web:83][web:75]

# Enable case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select


### HISTORY
HISTSIZE=20000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory sharehistory
setopt hist_ignore_space hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups
setopt CORRECT

### LAZY LOAD HELPERS
_lazy_source() { [[ -f $1 ]] && source "$1"; }

# zsh-autosuggestions (loaded immediately)
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting (load late but auto on first prompt)
_zsh_syntax_highlighting_init() { _lazy_source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"; }
add-zsh-hook precmd _zsh_syntax_highlighting_init

# fzf integration (load on first use)
fzf() { unfunction fzf; source <(command fzf --zsh); fzf "$@"; }

# zoxide (load when z/zi used)
z() { unfunction z 2>/dev/null; eval "$(command zoxide init zsh)"; z "$@"; }
zi() { z "$@"; }

# thefuck (load on first use)
fuck() { unfunction fuck 2>/dev/null; eval "$(command thefuck --alias)"; fuck "$@"; }
alias thefuck=fuck

### GENERAL ALIASES
alias ez='nvim ~/.zshrc'
alias :q='exit'
alias vi='nvim'
alias cd='z'

# Tmux
alias t='tmux'
alias ta='tmux attach'
alias tl='tmux list-sessions'
alias tn='tmux new-session -s'
alias td='tmux detach'
alias tks='tmux kill-session -t'
alias tka='tmux kill-server'

# Safer utils
alias cp='cp -i'
alias mv='mv -i'
alias rm='trash -v'
alias mkdir='mkdir -p'
alias rmd='/bin/rm --recursive --force --verbose '

# Enhanced utils
alias cat='bat'
alias less='less -R'
alias ps='ps auxf'
alias ping='ping -c 10'
alias dnf='sudo dnf'
alias multitail='multitail --no-repeat -c'
alias freshclam='sudo freshclam'
alias htop='btop'

# Navigation
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias bd='cd "$OLDPWD"'

# Disk / space usage
alias dust='dust --reverse'
alias diskspace="du -h -S | sort -n -r | more"
alias folders='du -h --max-depth=1'

# Listings with eza
alias la='eza -Alh --icons'
alias ls='eza -ah --color=always --icons'
alias lt='eza --tree --level=2 --long --icons --git'

# Logs and search
alias h='history | grep '
alias p='ps aux | grep '

# f: fast text search (prefer ripgrep)
f() {
  if [[ -z $1 ]]; then
    printf '%s\n' "Usage: f <pattern>"
  else
    if command -v rg >/dev/null 2>&1; then
      rg -n --hidden --no-messages -S "$1"
    else
      find . -type f 2>/dev/null | grep --color=auto -i "$1"
    fi
  fi
}
alias countfiles='for t in files links directories; do echo $(find . -type ${t:0:1} | wc -l) $t; done 2>/dev/null'
alias openports='netstat -nape --inet'
alias tree='eza --tree --level=3'
alias treed='tree -CAFd'
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"
alias g='google'

# Fuzzy picker with preview
v() {
  local selected_file
  selected_file=$(fzf --layout=reverse --preview "bat --style=numbers --color=always {} | head -100")
  [[ -n $selected_file ]] && nvim "$selected_file"
}

# Notes helper
note() {
  {
    printf 'date: %s\n' "$(date)"
    printf '%s\n\n' "$*"
  } >> "$HOME/drafts.txt"
}

# zcd using zoxide + fzf
zcd() {
  local dir
  dir=$(zoxide query -l | fzf +m) && cd "$dir"
}
zcd-widget() { BUFFER="zcd"; zle accept-line }
zle -N zcd-widget
bindkey '^G' zcd-widget

# yazi launcher
y() {
  local tmp cwd
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [[ -n $cwd && $cwd != "$PWD" ]]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# Banner (single printf, precomputed)
{
  local now up birth current days remain
  now="$(date +%H:%M)"
  up="$(uptime -p | cut -c 4-)"
  birth=$(stat -c %W /)
  current=$(date +%s)
  days=$(((current - birth) / 86400))
  remain=$((90 - days))
  printf '\r\033[1;38;2;137;221;255m\033[48;2;15;17;26mit'\''s %s, \033[1;38;2;255;203;107m\033[48;2;15;17;26m%s, \033[1;38;2;195;232;141m\033[48;2;15;17;26mOS-Age: %sd, \033[1;38;2;240;113;120mDays-Remaining: %sd\033[0m\n' \
    "$now" "$up" "$days" "$remain"
}

