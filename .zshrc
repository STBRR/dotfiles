# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# add ida to path #reveng
export PATH="$PATH:/opt/idafree-7.0"

# pwntools - readelf, checksec, etc..
export PATH="$PATH:/home/kali/.local/bin"

#ZSH_THEME=""

PROMPT="%F{red}[%f%F{cyan}%n%f%F{10}@%f%F{220}%m%f %F{13}%2~%f%F{red}]%f$ "

DISABLE_UNTRACKED_FILES_DIRTY="true"
DISABLE_MAGIC_FUNCTIONS="true"

plugins=(
    git
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# misc
alias bu="sudo apt -y update"
alias p="ping -c 1 8.8.8.8"
alias mip="curl https://icanhazip.com"
alias mipi="curl https://ipinfo.io"
alias vm="sudo ~/Documents/vm.sh"

# config
alias zshc="nano ~/.zshrc"
alias alc="nano ~/.config/alacritty/alacritty.toml"
alias i3c="nano ~/.config/i3/config"

# utils
alias cat="bat"
alias ccat="/bin/cat"
alias ls="lsd"
alias tree="lsd --tree"
alias cme="crackmapexec"

# thm networks
alias holo="cd /home/kali/THM/Networks/Holo && ll"

# ssh automatic tmux session
if [[ $- =~ i ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_TTY" ]]; then
  tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
fi
