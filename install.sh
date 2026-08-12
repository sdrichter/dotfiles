#!/usr/bin/env bash

set -euo pipefail

PLUGIN_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/plugins"

mkdir -p "$PLUGIN_DIR"

clone_or_update() {
  local repo="$1"
  local dir="$2"

  if [[ -d "$dir/.git" ]]; then
    echo "Updating $(basename "$dir")..."
    git -C "$dir" pull --ff-only
  else
    echo "Installing $(basename "$dir")..."
    git clone --depth=1 "$repo" "$dir"
  fi
}

clone_or_update \
  https://github.com/zsh-users/zsh-autosuggestions.git \
  "$PLUGIN_DIR/zsh-autosuggestions"

clone_or_update \
  https://github.com/zsh-users/zsh-syntax-highlighting.git \
  "$PLUGIN_DIR/zsh-syntax-highlighting"

echo "Stowing to home directory..."
stow .

echo "Installation Complete - Reboot your terminal."
