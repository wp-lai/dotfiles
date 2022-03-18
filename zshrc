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
# alias crun='cargo run -q --'

#####################
# funcs             #
#####################
path() {
    echo $PATH | tr : '\n'
}

#####################
# GO SETTINGS       #
#####################
# export GOPATH=$HOME/go
# export PATH="$PATH:$(go env GOPATH)/bin"
# export GO111MODULE=on

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
# homebrew          #
#####################
export HOMEBREW_BUNDLE_FILE=$HOME/sync/homebrew/Brewfile

#####################
# antibody          #
#####################
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

#####################
# NVM               #
#####################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#####################
# foundry           #
#####################
export PATH="$PATH:/Users/wplai/.foundry/bin"
foundry_shell_completion() {
    echo "update forge shell completion"
    forge completions zsh > /usr/local/share/zsh/site-functions/_forge
    echo "forge shell completion done"
    echo "update cast shell completion"
    cast completions zsh > /usr/local/share/zsh/site-functions/_cast
    echo "cast shell completion done"
}
alias foundryup="foundryup && foundry_shell_completion"

#####################
# miscellaneous     #
#####################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(mcfly init zsh)"
eval "$(zoxide init zsh --cmd z)"
eval "$(starship init zsh)"

export BAT_THEME="gruvbox-dark"
bindkey '^y' autosuggest-accept

source /Users/wplai/Library/Application\ Support/org.dystroy.broot/launcher/bash/br
