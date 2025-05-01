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

source ~/.zshrc