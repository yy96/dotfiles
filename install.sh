#!/bin/zsh

# Update and install Homebrew
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install essential tools
echo "Installing essential tools..."
brew install git
brew install python
brew install --cask visual-studio-code

# Install Conda
echo "Installing Miniconda..."
brew install --cask miniconda

# Create symbolic links for dotfiles
echo "Setting up dotfiles..."
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

# Source the profile
source ~/.zshrc

echo "Setup complete!"

