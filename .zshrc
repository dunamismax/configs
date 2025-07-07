# ~/.zshrc
# ==============================================================================
# A cleaned-up and enhanced .zshrc for a modern macOS developer experience.
# ==============================================================================

# ------------------------------------------------------------------------------
# Environment & PATH Setup
# ------------------------------------------------------------------------------

# Set the default editor
export EDITOR='vim'

# Add Homebrew to PATH if it exists
if [ -x "/opt/homebrew/bin/brew" ]; then
  export HOMEBREW_PREFIX="/opt/homebrew"
  export PATH="$HOMEBREW_PREFIX/bin:$PATH"
  export PATH="$HOMEBREW_PREFIX/sbin:$PATH"
fi

# Add Ruby installed via Homebrew to PATH
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Add user-specific gem path
export PATH="$HOME/.local/share/gem/ruby/3.4.0/bin:$PATH"

# PNPM (pnpm) configuration
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Your Gemini API Key is loaded from ~/.zshenv

# ------------------------------------------------------------------------------
# Zsh Configuration
# ------------------------------------------------------------------------------

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory notify
setopt extendedglob
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_find_no_dups
setopt hist_save_no_dups
setopt auto_cd
setopt correct

# Key bindings
bindkey -e # Use Emacs key bindings

# ------------------------------------------------------------------------------
# Aliases
# ------------------------------------------------------------------------------

alias zshconfig="\$EDITOR ~/.zshrc"
alias ohmyzsh="\$EDITOR ~/.oh-my-zsh"
alias reload="source ~/.zshrc"

# General
alias ls='ls -G'
alias l='ls -lah'
alias la='ls -A'
alias ll='ls -l'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~="cd ~"
alias c="clear"

# Git
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gca='git commit -am'
alias gs='git status'
alias gco='git checkout'
alias gb='git branch'
alias gp='git push'
alias gpf='git push --force'
alias gd='git diff'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# ------------------------------------------------------------------------------
# Autocompletion
# ------------------------------------------------------------------------------

# Load and initialize the completion system
autoload -U compinit
compinit

# Provides completion for options, arguments, and file paths.
zstyle ':completion:*' menu select

# ------------------------------------------------------------------------------
# Prompt
# ------------------------------------------------------------------------------

# Load version control integration
autoload -U vcs_info
precmd_vcs_info() {
  vcs_info
}
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# Configure VCS info format (git)
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a)'

# Set the prompt
# Shows: user@host:path (git-branch) $
PROMPT='%F{cyan}%n@%m%f:%F{yellow}%~%f ${vcs_info_msg_0_} %# '

# ------------------------------------------------------------------------------
# Tool Initializations
# ------------------------------------------------------------------------------

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
# The following two lines are only needed if you haven't added pyenv to your PATH manually.
# If `brew doctor` complains about this, you can remove these two lines.
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# mise (formerly rtx) - uncomment if you use it
# eval "$($HOME/.local/bin/mise activate zsh)"

# Source local environment file if it exists
if [ -f "$HOME/.local/bin/env" ]; then
  . "$HOME/.local/bin/env"
fi

# ------------------------------------------------------------------------------
# Custom Functions
# ------------------------------------------------------------------------------

# Function to sync Ghostty terminfo and then SSH into the server
sshin() {
  # Define server details
  local user="sawyer"
  local ip="100.69.92.55"

  # 1. Send the local Ghostty terminal info to the remote server.
  # The `tic` command on the server compiles and installs it.
  echo "Syncing Ghostty terminal info with $ip..."
  infocmp -x | ssh "$user@$ip" 'tic -x -'

  # 2. Now, connect to the server with a normal interactive SSH session.
  echo "Connecting..."
  ssh "$user@$ip"
}