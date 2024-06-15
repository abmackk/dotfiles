### EXPORT
export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8
export TERM="xterm-256color"                      # getting proper colors
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH="$HOME/.oh-my-zsh"
plugins=(git sudo history dirhistory fzf tmux web-search)
source $ZSH/oh-my-zsh.sh
#######################################################
# GENERAL ALIAS'S
#######################################################
# To temporarily bypass an alias, we precede the command with a \
# EG: the ls command is aliased, but to use the normal ls command you would type \ls

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Edit this .bashrc file
alias ez='nvim ~/.zshrc'

# Show help for this .bashrc file
# alias hlp='less ~/.bashrc_help'

#alias to btop
alias htop='btop'

# alias to show the date
alias da='date "+%Y-%m-%d %A %T %Z"'

#Alias's for pacman
alias install='sudo pacman -S'
alias update='sudo pacman -Sy'
alias upgrade='sudo pacman -Syu'
alias remove='sudo pacman -Rsc'
# Alias's to modified commands
alias cat='bat' 
alias cp='cp -i'
alias mv='mv -i'
alias rm='trash -v'
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'
alias apt-get='sudo apt-get'
alias multitail='multitail --no-repeat -c'
alias freshclam='sudo freshclam'
alias vi='nvim'
alias vim='nvim'
alias svi='sudo vi'
alias vis='nvim "+set si"'

# zellij alias
alias zz='zellij' 
alias zzs='zellij --session name' #start a new named session
alias zzls='zellij list-sessions' #list existing sessions
alias zza="zellij attach" #attach to recent session
alias zzkill='zellij kill-all-sessions' #kill all sessions

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# cd into the old directory
alias bd='cd "$OLDPWD"'

# Remove a directory and all files
alias rmd='/bin/rm  --recursive --force --verbose '

# Alias's for multiple directory listing commands
# alias la='ls -Alh' # show hidden files
# alias ls='ls -aFh --color=always' # add colors and file type extensions
alias lx='ls -lXBh' # sort by extension
alias lk='ls -lSrh' # sort by size
alias lc='ls -lcrh' # sort by change time
alias lu='ls -lurh' # sort by access time
alias lr='ls -lRh' # recursive ls
alias ld='ls -ltrh' # sort by date
alias lm='ls -alh |more' # pipe through 'more'
alias lw='ls -xAh' # wide listing format
alias ll='ls -Fls' # long listing format
alias labc='ls -lap' #alphabetical sort
alias lfo="ls -l | egrep -v '^d'" # files only
alias ldir="ls -l | egrep '^d'" # directories only
# Alias's for eza multiple directory listing commands
alias la='eza -Alh --icons' # show hidden files
alias ls='eza -ah --color=always --icons' # add colors and file type extensions
alias lt='eza --tree --level=2 --long --icons --git' #customize tree view
# alias chmod commands
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# Search command line history
alias h="history | grep "

#Checking memory using dust
alias dust="dust --reverse"

# Search running processes
alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Search files in the current folder
alias f="find . | grep "

# Count all files (recursively) in the current folder
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"

# Quick Notes
note() {
    echo "date: $(date)" >> $HOME/drafts.txt
    echo "$@" >> $HOME/drafts.txt
    echo "" >> $HOME/drafts.txt
}

#Searching and Opening Files in nvim
alias v='fdfind --type f --hidden --exclude .git | fzf-tmux -p --reverse| xargs nvim'

# To see if a command is aliased, a file, or a built-in command
alias checkcommand="type -t"

# Show open ports
alias openports='netstat -nape --inet'

# Alias's for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'
alias freespace="df -h --total|grep ^total"

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

#tmux alias
alias t='tmux'
alias tkill='tmux kill-session'
alias tl="tmux ls"
alias tattach='tmux a -t'

#google alias
alias g='google'
#Show all logs in /var/log
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

### RANDOM COLOR SCRIPT ###
# Get this script from my GitLab: gitlab.com/dwt1/shell-color-scripts
# Or install it from the Arch User Repository: shell-color-scripts
colorscript random

export FPATH="~/eza/completions/zsh:$FPATH"

#Activating zoxide
eval "$(zoxide init zsh)"

eval "$(starship init zsh)"

