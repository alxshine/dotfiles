#!/bin/fish

# bootstrap fisher
if not test -e {$HOME}/.config/fish/functions/fisher.fish
  echo "Installing fisher"
  curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
end

source $HOME/.config/fish/aliases
theme_gruvbox dark medium

# config stuff
set fish_greeting
bind \cw backward-kill-word

# colors for less
set -x LESS_TERMCAP_mb (printf "\e[01;31m")
set -x LESS_TERMCAP_md (printf "\e[01;31m")
set -x LESS_TERMCAP_me (printf "\e[0m")
set -x LESS_TERMCAP_se (printf "\e[0m")
set -x LESS_TERMCAP_so (printf "\e[01;44;33m")
set -x LESS_TERMCAP_ue (printf "\e[0m")
set -x LESS_TERMCAP_us (printf "\e[01;32m")

# path stuff
export BROWSER=brave
export EDITOR=nvim

export TEXMFHOME="{$HOME}/Projects/seclab-tex/stack/texmf"

export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export DOCKER_HOST="unix:///run/user/1000/docker.sock"


fenv source ~/.profile
