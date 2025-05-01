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
    echo "Checking if $1 exists..."
    command -v "$1" &>/dev/null
    local result=$?
    echo "Command $1 check result: $result"
    return $result
}

# Function to check if a tool is installed and install it if needed
# Usage: check_and_install "tool_name" "install_command"
check_and_install() {
    local tool_name=$1
    local install_command=$2
    
    echo "Checking tool: $tool_name"
    if ! command_exists "$tool_name"; then
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
