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

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set ZSH_CUSTOM if not already set
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

# Install Powerlevel10k theme
echo "Installing Powerlevel10k theme..."
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Install zsh plugins
echo "Installing zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Create necessary directories and files
echo "Creating necessary directories and files..."
mkdir -p ~/.oh-my-zsh/custom/themes
mkdir -p ~/.oh-my-zsh/custom/plugins
touch ~/Desktop/dotfiles/.gitconfig
touch ~/Desktop/dotfiles/.zshrc

# Create symbolic links for dotfiles
echo "Setting up dotfiles..."
ln -sf ~/Desktop/dotfiles/.zshrc ~/.zshrc
ln -sf ~/Desktop/dotfiles/.gitconfig ~/.gitconfig

# Source the .zshrc file only if it exists
if [ -f ~/.zshrc ]; then
    source ~/.zshrc
fi

echo "Setup complete!"

