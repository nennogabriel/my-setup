#!/bin/zsh

# Install Homebrew (using bash specifically for Homebrew installation)
check_and_install "brew" '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
