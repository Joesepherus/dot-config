
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias grep='grep --color=auto'
alias sp='systemctl suspend'
alias sn='shutdown now'
alias re='reboot'
alias p='cd /home/joes/main/projects'
alias w='cd /home/joes/main/work'
alias m='cd /home/joes/main'
alias d='cd /home/joes/Downloads'
alias h='cd /home/joes'
alias r='ranger'
alias ei3='sudo vim ~/.config/i3/config'
alias epoly='sudo vim ~/.config/polybar/config'
alias equte='sudo vim ~/.config/qutebrowser/config.py'
alias webcam='ffplay -f v4l2 /dev/video0'
alias docker='sudo docker'
alias pass='/home/joes/main/scripts/launch_keepass.sh'
alias s='~/main/scripts/reverse-search.sh'
alias xtermhere='xterm -e "cd $(pwd); bash"'
alias ucpu='ps aux --sort=-%cpu | head -n 16'
alias umem='ps aux --sort=-%mem | head -n 16'
alias vim='nvim'
alias vime='nvim ~/.config/nvim/ .'
alias b='bluetoothctl'
alias y='cd /home/joes/main/youtube'
alias res='cd /home/joes/main/projects/restaurants-go/restaurant && go run restaurant.go'
alias eres='cd /home/joes/main/projects/restaurants-go/restaurant && vim .'
alias res4='cd /home/joes/main/projects/restaurants-go/restaurant4 && go run restaurant.go'
alias eres4='cd /home/joes/main/projects/restaurants-go/restaurant4 && vim .'
alias sleep='systemctl suspend'

dim() {
  local brightness_level=$1
  xrandr --output HDMI-1 --brightness "$brightness_level"
}

PS1='[\u@\h \W]\$ '

export PATH="$PATH:/home/joes/.foundry/bin"
export PATH="/usr/lib/node_modules:$PATH"
export PATH="/home/joes/.cargo/bin:$PATH"

HISTSIZE=10000
save_and_clear_history() {
    cat ~/.bash_history >> ~/history/$(date +'%Y-%m-%d')-history.txt
    rm ~/.bash_history
}
trap save_and_clear_history EXIT

# Define a function to get the current Git branch
git_branch() {
    git rev-parse --abbrev-ref HEAD 2>/dev/null
}

# Set the PS1 variable to include Git branch information
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$([[ -n $(git_branch) ]] && echo " (\[\033[01;33m\]$(git_branch)\[\033[00m\])")\$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /usr/share/nvm/init-nvm.sh
export PATH=$PATH:$HOME/.local/bin
