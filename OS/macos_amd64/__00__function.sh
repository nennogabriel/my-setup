#!/bin/zsh

# Print a header message
print_header() {
    echo ""
    echo "================================================"
    echo "  $1"
    echo "================================================"
    echo ""
}

# Function to check if a tool is installed and install it if needed
# Usage: check_and_install "tool_name" "install_command"
check_and_install() {
    local tool_name=$1
    local install_command=$2
    
    if ! command -v "$tool_name" &> /dev/null; then
        echo "$tool_name not found. Installing $tool_name..."
        eval "$install_command"
    else
        echo "$tool_name is already installed"
    fi
}