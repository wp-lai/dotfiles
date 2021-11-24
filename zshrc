#####################
# ZINIT             #
#####################
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

#####################
# PLUGINS           #
#####################
zinit light-mode for \
    atload"_zsh_autosuggest_start; bindkey '^y' autosuggest-accept" \
    zsh-users/zsh-autosuggestions \
    zdharma-continuum/fast-syntax-highlighting

#####################
# ENV VARIABLE      #
#####################
export EDITOR='nvim'
export VISUAL=$EDITOR

# network proxy
proxy () {
  export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
}
unproxy () {
  unset https_proxy http_proxy all_proxy
}

#####################
# ALIASES           #
#####################
alias v='nvim'
alias ll='exa -l --group-directories-first'
alias l='exa -l --git --icons --classify --group-directories-first --time-style=long-iso --group --color-scale'

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
export BAT_THEME="gruvbox-dark"


#####################
# completions       #
#####################
# small letters match small and capital letters
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# completion for hh (npx hardhat)
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

zinit cdreplay -q # replay compdef captured by zinit

