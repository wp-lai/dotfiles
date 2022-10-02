#####################
# ENV VARIABLE      #
#####################
export EDITOR='nvim'
export VISUAL=$EDITOR

#####################
# ALIASES           #
#####################
alias v='nvim'
alias ll='exa -l --git --icons --classify --group-directories-first --time-style=long-iso --group --color-scale'
alias g='git'
alias t='tmux new-session \; split-window -h \; split-window -v \; attach'
alias ta='tmux attach -t '
alias lg='lazygit'
alias rm='rm -i'

alias gas='cast --to-unit `cast gas-price` gwei'

#####################
# funcs             #
#####################
function path() {
    echo $PATH | tr : '\n'
}

function rg() {
  command rg --pretty "$@" | less --RAW-CONTROL-CHARS
}

function stream() {
    curl https://gateway.ceramic.network/api/v0/streams/$1 | jq
}

#####################
# GO SETTINGS       #
#####################
export GOPATH=$HOME/go
export PATH="$PATH:$(go env GOPATH)/bin"
export GO111MODULE=on

#####################
# python            #
#####################
export PATH="$PATH:$HOME/Library/Python/3.8/bin"


#####################
# Rust SETTINGS     #
#####################
# export PATH=$PATH:$HOME/.cargo/bin

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
--bind 'ctrl-v:execute(code {})' \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


#####################
# completions       #
#####################
if [[ -d $HOME/.zfunc ]]; then
    fpath+=~/.zfunc # customs completions
fi

# small letters match small and capital letters
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# use ctrl-y to accept autosuggestion
bindkey '^y' autosuggest-accept

# use ctrl-p/ctrl-n to scroll up/down
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

#####################
# homebrew          #
#####################
export HOMEBREW_BUNDLE_FILE=$HOME/.brewfile

#####################
# antibody          #
#####################
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

#####################
# yarn              #
#####################
# export PATH="$PATH:`yarn global bin`"

#####################
# foundry           #
#####################
export PATH="$PATH:/Users/wplai/.foundry/bin"
foundry_shell_completion() {
    forge completions zsh > ~/.zfunc/_forge
    cast completions zsh > ~/.zfunc/_cast
    anvil completions zsh > ~/.zfunc/_anvil
}
alias foundryup="foundryup && foundry_shell_completion"

#####################
# PostgreSQL        #
#####################
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"

#####################
# pnpm              #
#####################
export PNPM_HOME="/Users/wplai/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

#####################
# miscellaneous     #
#####################
eval "$(zoxide init zsh --cmd z)"
eval "$(mcfly init zsh)"
eval "$(starship init zsh)"

export BAT_THEME="Catppuccin-macchiato"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

source "$HOME/.private.zsh"
