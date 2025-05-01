#!/bin/zsh

# Print a header message
print_header() {
    echo ""
    echo "================================================"
    echo "  $1"
    echo "================================================"
    echo ""
}

# Check if a command exists
command_exists() {
    command -v "$1" &>/dev/null
}

# Function to check if a tool is installed and install it if needed
# Usage: check_and_install "tool_name" "install_command"
check_and_install() {
    local tool_name=$1
    local install_command=$2
    
    if command_exists "$tool_name"; then
        echo "$tool_name not found. Installing $tool_name..."
        eval "$install_command"
    else
        echo "$tool_name is already installed"
    fi
}

# Function to install a language using asdf
# Usage: install_language "plugin" "version" ["global"]
install_language() {
    local plugin=$1
    local version=${2:-latest}
    local set_global=$3
    
    # Check if plugin exists
    if ! asdf plugin list | grep -q "$plugin"; then
        echo "Adding $plugin plugin to asdf"
        asdf plugin add "$plugin"
    fi
    
    # Check if version is already installed
    if ! asdf list "$plugin" | grep -q "$version"; then
        echo "Installing $plugin $version"
        asdf install "$plugin" "$version"
    else
        echo "$plugin $version is already installed"
    fi
    
    # Set as global if requested
    if [ "$set_global" = "global" ]; then
        echo "Setting $plugin $version as global version"
        asdf set -u "$plugin" "$version"
    fi
}

# Function to install Mac App Store applications
# Usage: install_mas_app "app_id" "app_name"
install_mas_app() {
    local app_id=$1
    local app_name=$2
    
    # Check if app is already installed using Spotlight metadata
    if ! mdls -rn kMDItemAppStoreAdamID "/Applications/$app_name.app" 2>/dev/null | grep -q "$app_id"; then
        echo "Installing $app_name..."
        mas install "$app_id"
    else
        echo "$app_name is already installed"
    fi
}
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



#!/bin/zsh

print_header "Installing Development Languages"

# Node.js - Latest LTS version
install_language "nodejs" "latest" "global"
install_language "nodejs" "20.12.2"

# Bun - Latest stable version
install_language "bun" "latest" "global"

# pnpm - Latest stable version
install_language "pnpm" "latest"


# Python - Latest stable version
install_language "python" "latest" "global"

# UV - Latest stable version
install_language "uv" "latest" "global"

# Ruby - Latest stable version
install_language "ruby" "latest"

# Go - Latest version
install_language "golang" "latest"

# Java - Latest LTS version
install_language "java" "latest" "global"

# Erlang - Latest stable version
install_language "erlang" "latest"

# Elixir - Latest stable version
install_language "elixir" "latest"



print_header "Language Installation Complete"
echo "Here is the list of installed languages:"
asdf current

source ~/.zshrc#!/bin/zsh

print_header "Setting up Terminal"

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh is already installed"
fi

# Install Powerlevel10k
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    echo "Installing Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
else
    echo "Powerlevel10k is already installed"
fi

# Install zsh-autosuggestions
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
else
    echo "zsh-autosuggestions is already installed"
fi

# Install zsh-syntax-highlighting
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    echo "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
else
    echo "zsh-syntax-highlighting is already installed"
fi

# Add configurations to .zshrc if they don't exist
if ! grep -q "ZSH_THEME=\"powerlevel10k/powerlevel10k\"" ~/.zshrc; then
    echo "Adding Powerlevel10k theme to .zshrc..."
    echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc
fi

if ! grep -q "plugins=(git zsh-autosuggestions zsh-syntax-highlighting)" ~/.zshrc; then
    echo "Adding plugins to .zshrc..."
    echo 'plugins=(git zsh-autosuggestions zsh-syntax-highlighting)' >> ~/.zshrc
fi

if ! grep -q "source \$ZSH/oh-my-zsh.sh" ~/.zshrc; then
    echo "Adding Oh My Zsh source to .zshrc..."
    echo 'source $ZSH/oh-my-zsh.sh' >> ~/.zshrc
fi

if ! grep -q "source ~/.p10k.zsh" ~/.zshrc; then
    echo "Adding Powerlevel10k configuration to .zshrc..."
    echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc
fi

echo "Terminal setup complete! Please restart your terminal to apply changes." #!/bin/zsh

print_header "Installing Applications"

# Homebrew GUI Applications
print_header "Installing Homebrew GUI Applications"
check_and_install "waterfox" "brew install waterfox"
check_and_install "chromium" "brew install chromium"
check_and_install "brave-browser" "brew install brave-browser"
check_and_install "vlc" "brew install vlc"
check_and_install "transmission" "brew install transmission"
check_and_install "dropbox" "brew install dropbox"
check_and_install "discord" "brew install discord"
check_and_install "tradingview" "brew install tradingview"
check_and_install "visual-studio-code" "brew install visual-studio-code"
check_and_install "cursor" "brew install cursor"
check_and_install "orbstack" "brew install orbstack"
check_and_install "rambox" "brew install rambox"

# Homebrew Command Line Tools
print_header "Installing Homebrew Command Line Tools"
check_and_install "wget" "brew install wget"
check_and_install "ffmpeg" "brew install ffmpeg"
check_and_install "yt-dlp" "brew install yt-dlp"
check_and_install "git-lfs" "brew install git-lfs"

# Mac App Store Applications
print_header "Installing Mac App Store Applications"
check_and_install "mas" "brew install mas"

# Install Mac App Store applications
install_mas_app "1352778147" "Bitwarden"
# install_mas_app "801463932" "Stockfish"
# install_mas_app "1499327230" "Art Text 4"
# install_mas_app "1616831348" "Affinity Design 2"
# install_mas_app "441258766" "Magnet"
# install_mas_app "1147396723" "Whatsapp Desktop"
install_mas_app "1141688067" "Coin Tick"
install_mas_app "747648890" "Telegram Desktop"
install_mas_app "803453959" "Slack"
# install_mas_app "1614666244" "Mattermost"
# install_mas_app "1604311726" "Opera Crypto Browser"
install_mas_app "1440147259" "AdGuard for Safari"
# install_mas_app "1485052491" "Dropzone 4"
# install_mas_app "1355679052" "Dropover"
# install_mas_app "1607635845" "Velja"
# install_mas_app "1452453066" "Hidden Bar"
# install_mas_app "1628987979" "Imageoptin"
install_mas_app "1333542190" "1Password" 