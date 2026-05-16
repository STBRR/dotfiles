export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="jreese"
#PROMPT="%F{red}[%f%F{cyan}%n%f%F{10}@%f%F{220}%m%f %F{13}%2~%f%F{red}]%f$ "
#PROMPT="%F{#d79921}[%f%F{#458588}%n%f%F{#a89984}@%f%F{#98971a}%m%f %F{#d3869b}%2~%f%F{#d79921}]%f$ "
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
#plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
export LS_COLORS="$(vivid generate gruvbox-dark-hard)"
export XCURSOR_SIZE=16

# misc
alias bu="sudo apt -y update"
alias p="ping -c 1 8.8.8.8"
alias mip="curl https://icanhazip.com"
alias mipi="curl https://ipinfo.io"
alias vm="sudo ~/Documents/vm.sh"
alias bgfix="feh --bg-scale /home/kali/Pictures/win11-black.jpg"

# htb
alias sherlocks="cd /home/kali/HTB/sherlocks && ll"
alias htb="cd ~/HTB/ && ls -l"
alias thm="cd ~/THM/ && ls -l"

# config
alias zshc="nano ~/.zshrc"
alias alc="nano ~/.config/alacritty/alacritty.toml"
alias i3c="nano ~/.config/i3/config"
alias hosts="sudo nano /etc/hosts"

# utils
alias cat="bat"
alias ccat="/bin/cat"

alias ls="lsd"
alias tree="lsd --tree"

alias ncat="nc"
alias certipy="certipy-ad"

alias htbscan="mkdir -p nmap; nmap -sC -sV -vvv -oN nmap/initial_scan.txt $@"
alias htbfullscan="mkdir -p nmap; nmap -sC -sV -p- -vvv -oN nmap/initial_full_scan.txt $@"

# studying
alias boxes="cd /home/kali/HTB/boxes && ls -l"

# vpn
alias labs="sudo openvpn --config /home/kali/HTB/vpn/free.ovpn 2>/dev/null"
alias academy="sudo openvpn --config /home/kali/HTB/vpn/academy.ovpn 2>/dev/null"

alias thmconnect="sudo openvpn --config /home/kali/THM/VPN/regular.ovpn"


alias cpts="cd /home/kali/HTB/cpts && ls -l"
alias study="sudo openvpn --config /home/kali/HTB/cpts/vpn/cpts.ovpn"



# prolabs
alias prolabs="echo '[!] ProLabs? Good luck!' && cd /home/kali/HTB/prolabs && ls -l"
alias dante="cd /home/kali/HTB/prolabs/dante && ls -l"
alias wanderer="cd /home/kali/HTB/prolabs/wanderer && ls -l"
alias dantevpn="sudo openvpn --config /home/kali/HTB/vpn/dante.ovpn" 
alias zeph="cd /home/kali/HTB/prolabs/zephyr && ls -l"

# misc
alias ranger=". ranger"
alias greet="cowsay hello nerd!"
alias gob="gobuster dir -w /usr/share/seclists/Discovery/Web-Content/quickhits.txt -u http://$@/"

# ssh automatic tmux session
if [[ $- =~ i ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_TTY" ]]; then
  tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
fi

# Golang Stuff
export GOPATH=$HOME/go-workspace
export GOROOT=/usr/local/go
PATH=$PATH:$GOROOT/bin/:$GOPATH:/bin

# FZF
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh


# Tell Windows Terminal the current working directory
if [ -n "$WT_SESSION" ]; then
    precmd_functions+=()
    keep_current_path() {
        printf '\e]9;9;%s\e\\' "$(wslpath -w "$PWD")"
    }
    precmd_functions+=(keep_current_path)
fi

# Save current directory whenever it changes
chpwd() {
    echo "$PWD" > ~/.last_dir
}

# Restore last directory on new terminal
if [ -f ~/.last_dir ]; then
    cd "$(cat ~/.last_dir)"
fi
