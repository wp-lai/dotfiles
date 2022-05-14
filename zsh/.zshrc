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
# python            #
#####################
# export PATH="$PATH:$HOME/Library/Python/3.8/bin/"

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
# NVM               #
#####################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# call `nvm use` automatically whenever you enter a dir that contains `.nvmrc`
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

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
}
alias foundryup="foundryup && foundry_shell_completion"

#####################
# miscellaneous     #
#####################
eval "$(zoxide init zsh --cmd z)"
eval "$(mcfly init zsh)"
eval "$(starship init zsh)"

export BAT_THEME="gruvbox-dark"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

source "$HOME/private.zsh"
