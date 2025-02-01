#!/bin/bash

set -e  # Exit immediately if any command fails

if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

brew bundle --file=brew/Brewfile

if command -v stow &> /dev/null; then
    echo "stow is already installed. Proceeding with your command..."
    stow bat
    stow ghostty
    stow lsd
    stow starship
    stow zsh
else
    echo "stow is not installed, cannot add dotfile links"
fi

# Set mac settings
macos/macosdefaults.sh
