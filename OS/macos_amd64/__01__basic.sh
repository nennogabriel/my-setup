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
if ! command_exists "brew"; then
    eval '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == 'arm64' ]]; then
        echo "Configuring Homebrew for Apple Silicon..."
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "Homebrew is already installed"
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

# Check if logged into Mac App Store
if ! mas account >/dev/null; then
    echo "⚠️ You need to be logged into the Mac App Store to install Mac App Store apps"
    echo "Please open the Mac App Store and sign in, then run this script again"
    exit 1
fi


print_header "Installing Fonts"
brew install font-jetbrains-mono-nerd-font
brew install font-meslo-lg-nerd-font



