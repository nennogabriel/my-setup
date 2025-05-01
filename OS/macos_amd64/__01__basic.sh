#!/bin/zsh

# For Basic we need to install the following:
# - Homebrew
# - Git
# - asdf
# - mas-cli
# and basic fonts:
# jetbrains mono nerd font
# meslo lg nerd font


print_header "Installing Package Managers"

# Install Homebrew (using bash specifically for Homebrew installation)
print_header "Installing Homebrew"
check_and_install "brew" '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'

# Add Homebrew to PATH for Apple Silicon Macs
if [[ $(uname -m) == 'arm64' ]]; then
    echo "Configuring Homebrew for Apple Silicon..."
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install git
print_header "Installing git"
check_and_install "git" "brew install git"

# Install asdf prerequisites
print_header "Installing asdf prerequisites"
check_and_install "openssl" "brew install openssl"
check_and_install "readline" "brew install readline"
check_and_install "zlib" "brew install zlib"
check_and_install "unixodbc" "brew install unixodbc"

# Install asdf
print_header "Installing asdf"
check_and_install "asdf" "brew install asdf"

# Install mas-cli
print_header "Installing Mac App Store cli (mas)"
check_and_install "mas" "brew install mas"

print_header "Installing Fonts"
check_and_install "font-jetbrains-mono-nerd-font" "brew install font-jetbrains-mono-nerd-font"
check_and_install "font-meslo-lg-nerd-font" "brew install font-meslo-lg-nerd-font"



