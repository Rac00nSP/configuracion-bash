source ~/powerlevel10k/powerlevel10k.zsh-theme
# fix java problem
export _JAVA_AWT_WM_NONREPARENTING=1
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# manual alias de lsd ls con esteroides
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'

alias cat='/usr/bin/bat'
alias catn='/usr/bin/cat'
alias catnl='/usr/bin/bat --paging=never' 
#manual conf

SAVEHIST=1000
HISTFILE=~/.zsh_history

function fzf-lovely(){
 
        if [ "$1" = "h" ]; then
                fzf -m --reverse --preview-window down:20 --preview '[[ $(file --mime {}) =~ binary ]] &&
                        echo {} is a binary file ||
                         (bat --style=numbers --color=always {} ||
                          highlight -O ansi -l {} ||
                          coderay {} ||
                          rougify {} ||
                          cat {}) 2> /dev/null | head -500'
 
        else
                fzf -m --preview '[[ $(file --mime {}) =~ binary ]] &&
                                 echo {} is a binary file ||
                                 (bat --style=numbers --color=always {} ||
                                  highlight -O ansi -l {} ||
                                  coderay {} ||
                                  rougify {} ||
                                  cat {}) 2> /dev/null | head -500'
        fi
}

#function

function mkt(){
	sudo mkdir {contents,exploits,nmaps,scriptss}
}
function rmk(){
	scrub -p dod $1; shred -zun 10 -v $1
}function monymac(){
        sudo airmon-ng start wlx000f00103425
        sudo Airmon-ng check kill
        sudo ifconfig wlan0mon down
        sudo macchanger -a wlan0mon
        sudo ifconfig wlan0mon up
}
function reiniwi(){
        sudo systemctl restart NetworkManager
}
function aireplang(){sudo
aireplay-ng --help | tail -n 13 |grep -v "help" | sed '/^\s*$/d' | sed 's/^ *//'
}
function man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    man "$@"
}
extractPorts(){
        ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | x>
        ip_address="$(cat %1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | >
        echo -e "\n[*] Extrayendo informacion...\n" > extractPorts.tmp
        echo -e "\t[*] Direccion IP: $ip_address">> extractPorts.tmp
        echo -e "\t[*] Puertos abiertos: $ports\n" >> extractPorts.tmp
        echo $ports | tr -d '\n' | xclip -sel clip
        echo -e "[*] Puertos copiados en la clipboard\n" >> extractPorts.tmp
        /usr/bin/bat extractPorts.tmp
        rm extractPort.tmp
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#configuracion manual plugins
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

