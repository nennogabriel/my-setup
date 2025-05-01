#!/bin/zsh

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

echo "Terminal setup complete! Please restart your terminal to apply changes." 