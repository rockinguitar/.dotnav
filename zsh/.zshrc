
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/Andre.Wittwer/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/Andre.Wittwer/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/Andre.Wittwer/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/Andre.Wittwer/google-cloud-sdk/completion.zsh.inc'; fi

# Surpress last login message
printf '\33c\e[3J'
eval "$(starship init zsh)"
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
# zoxide
eval "$(zoxide init --cmd cd zsh)"

source $HOME/.dotnav/zsh/.aliases

# FZF catppucin
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

export FZF_CTRL_T_OPTS="
--walker-skip .git,node_modules,target
--preview 'bat -n --color=always {}'
--bind 'ctrl-/:change-preview-window(down|hidden|)'"

# For FZF ALT-C, list of directories, instead of ç
bindkey "ç" fzf-cd-widget

# git autocomplete
autoload -Uz compinit && compinit

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# fnm 
eval "$(fnm env --use-on-cd --shell zsh)"

# PAT token path to 1password
export NPM_AUTH_TOKEN="op://NAV/nav-pat-token/password"