# ZSH Configuration
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=/usr/bin/nvim
export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"
export DISABLE_AUTO_TITLE='true'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#D5C9AB,fg+:#D5C9AB,bg:#272E33,bg+:#272E33
  --color=hl:#6272A4,hl+:#7FBBB3,info:#afaf87,marker:#A7C080
  --color=prompt:#ED8082,spinner:#D196B3,pointer:#D196B3,header:#6272A4
  --color=border:#7C8377,label:#aeaeae,query:#d9d9d9
  --border="rounded" --border-label="" --preview-window="border-rounded" --prompt="> "
  --marker=">" --pointer="◆" --separator="─" --scrollbar="│" --no-extended'
# ZSH_THEME="spaceship"
# fpath+=($HOME/.zsh/pure)
# autoload -U promptinit; promptinit
# prompt pure

# Plugins
plugins=(zsh-syntax-highlighting zsh-autosuggestions zsh-completions web-search)
autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh

# Aliases
alias si="sudo pacman -S"
alias sr="sudo pacman -Rns"
alias pi="paru -S"
alias pr="paru -Rns"
alias sup="sudo pacman -Syu"
alias pup="paru -Syu"
alias cls="clear"
alias n="nvim"
alias pz="paruz"
alias md="mkdir"
alias ls="g --icon --all"
alias lt="g --icon --tree"
alias g="g --icon"
alias ff="fastfetch"
alias gc="git clone"
alias tx="tmux"
alias zj="zellij"
alias tp="tmuxp"
alias zt="zathura"
alias hp="hyprpm"
alias nn="nnn -p"
alias ts="sh ~/.config/scripts/tmux-switch.sh"
alias fd='fd --exclude={.git,.cache,.local,.oh-my-zsh,.npm,.cargo,.rustup,go,walls,Downloads}'
alias rel="xrdb merge ~/.Xresources && kill -USR1 $(pidof st)"

# ZSH Addons
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# NNN Configuration
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='f:finder;o:fzopen;p:preview-tui;d:diffs;t:nmount;v:imgview'
export NNN_COLORS='1234'
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
# export NNN_FCOLORS='0000E631000000000000000'

# Created by `pipx` on 2024-06-06 05:51:48
export PATH="$PATH:/home/sp/.local/bin"
