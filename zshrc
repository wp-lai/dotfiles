#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####

#####################
# ENV VARIABLE      #
#####################
export EDITOR='nvim'
export VISUAL=$EDITOR

#####################
# ALIASES           #
#####################
alias v='nvim'
alias ll='exa -l --group-directories-first'
alias l='exa -l --git --icons --classify --group-directories-first --time-style=long-iso --group --color-scale'
alias g='git'

#####################
# GO SETTINGS       #
#####################
export GOPATH=$HOME/go
export PATH="$PATH:$(go env GOPATH)/bin"
export GO111MODULE=on

#####################
# Rust SETTINGS     #
#####################
export PATH=$PATH:$HOME/.cargo/bin

#####################
# FZF SETTINGS      #
#####################
export FZF_DEFAULT_OPTS="
--ansi
--layout=default
--info=inline
--height=50%
--multi
--preview-window=right:50%
--preview-window=sharp
--preview-window=cycle
--preview '([[ -f {} ]] && (bat --style=numbers --color=always --theme=gruvbox-dark --line-range :500 {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--prompt='λ -> '
--pointer='|>'
--marker='✓'
--bind 'ctrl-e:execute(nvim {} < /dev/tty > /dev/tty 2>&1)' > selected
--bind 'ctrl-v:execute(code {})'"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
        cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
        v|vim|nvim)            fzf "$@" --preview 'bat --style=numbers --color=always --line-range :500 {}' ;;
        export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
        ssh)          fzf "$@" --preview 'dig {}' ;;
        *)            fzf "$@" ;;
    esac
}

#####################
# miscellaneous     #
#####################
eval "$(mcfly init zsh)"
eval "$(zoxide init zsh --cmd z)"
eval "$(starship init zsh)"
source $HOME/.config/broot/launcher/bash/br
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export BAT_THEME="gruvbox-dark"

bindkey '^y' autosuggest-accept

#####################
# completions       #
#####################
# small letters match small and capital letters
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# completion for hh (npx hardhat)
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

#####################
# antibody          #
#####################
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
