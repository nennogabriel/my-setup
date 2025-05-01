#!/bin/bash

# Download Git configuration files
echo "Downloading Git configuration files..."

# Create temporary directory
TEMP_DIR=$(mktemp -d)

# Clone the repository temporarily
git clone --depth 1 https://github.com/nennogabriel/my-setup.git "$TEMP_DIR"

# Copy Git configuration files if they don't exist
if [ ! -f "$HOME/.gitconfig" ]; then
    cp "$TEMP_DIR/apps/git/files/.gitconfig" "$HOME/.gitconfig"
    echo "Created new .gitconfig"
else
    echo ".gitconfig already exists, skipping..."
fi

if [ ! -f "$HOME/.gitignore" ]; then
    cp "$TEMP_DIR/apps/git/files/.gitignore" "$HOME/.gitignore"
    echo "Created new .gitignore"
else
    echo ".gitignore already exists, skipping..."
fi

# Copy scripts if they exist and destination doesn't
if [ -d "$TEMP_DIR/apps/git/files/.my-scripts" ]; then
    mkdir -p "$HOME/.my-scripts"
    for file in "$TEMP_DIR/apps/git/files/.my-scripts/"*; do
        filename=$(basename "$file")
        if [ ! -f "$HOME/.my-scripts/$filename" ]; then
            cp "$file" "$HOME/.my-scripts/"
            echo "Created new script: $filename"
        else
            echo "Script $filename already exists, skipping..."
        fi
    done
fi

# Clean up
rm -rf "$TEMP_DIR"

echo "Git configuration files download completed!" 