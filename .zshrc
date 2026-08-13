# ----------------------
# Environment
# ----------------------
export EDITOR="nvim"
export VISUAL="$EDITOR"

# User binaries
path=(
  "$HOME/.local/bin"
  "$HOME/bin"
  $path
)

export PATH

# ---------------------
# ZSH History & Opts
# ---------------------
HISTFILE='$HOME/histfile'
HISTSIZE=10000
SAVEHIST=10000

unsetopt beep
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt AUTO_CD

# VIM Bindings
bindkey -v

# ---------------------
# Completion
# ---------------------
autoload -Uz compinit
compinit

zstyle :compinstall filename '$HOME/.zshrc'

ABBR_SET_EXPANSION_CURSOR=1

# --------------------
# Plugins
# --------------------
source "$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh"
antidote load

# --------------------
# Zoxide
# --------------------
eval "$(zoxide init zsh)"

# --------------------
# Starship Prompt
# --------------------
eval "$(starship init zsh)"

# --------------------
# Machine-Specific Config
# --------------------
[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local


