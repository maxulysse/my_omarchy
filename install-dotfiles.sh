#!/bin/bash

# install-dotfiles.sh
# Script to install dot files from this repository

set -e

echo "======================================"
echo "  Omarchy Dot Files Installation"
echo "======================================"
echo ""

# Define colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if we're in the right directory
if [ ! -d "dotfiles" ]; then
    echo -e "${RED}Error: dotfiles directory not found!${NC}"
    echo "Please run this script from the repository root directory."
    exit 1
fi

# Create backup directory
BACKUP_DIR="$HOME/.config/backup/dotfiles-$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"
echo -e "${GREEN}✓${NC} Created backup directory: $BACKUP_DIR"

# Function to backup and copy file
install_dotfile() {
    local file=$1
    local source="dotfiles/$file"
    local target="$HOME/$file"
    
    if [ -f "$target" ]; then
        cp "$target" "$BACKUP_DIR/$file"
        echo -e "${YELLOW}!${NC} Backed up existing $file to $BACKUP_DIR"
    fi
    
    cp "$source" "$target"
    echo -e "${GREEN}✓${NC} Installed $file"
}

# Install dot files
echo ""
echo "Installing dot files..."
install_dotfile ".bashrc"
install_dotfile ".gitconfig"
install_dotfile ".vimrc"
install_dotfile ".tmux.conf"

# Create necessary directories
echo ""
echo "Creating necessary directories..."
mkdir -p "$HOME/.vim/undodir"
echo -e "${GREEN}✓${NC} Created ~/.vim/undodir"

# Prompt for git configuration
echo ""
echo "======================================"
echo "  Git Configuration"
echo "======================================"
echo ""
echo "The .gitconfig file needs your personal information."
echo "Please enter your details (or press Enter to skip):"
echo ""

read -p "Your name: " git_name
read -p "Your email: " git_email

if [ -n "$git_name" ] && [ -n "$git_email" ]; then
    git config --global user.name "$git_name"
    git config --global user.email "$git_email"
    echo -e "${GREEN}✓${NC} Updated Git configuration"
else
    echo -e "${YELLOW}!${NC} Skipped Git configuration. Remember to update ~/.gitconfig manually."
fi

echo ""
echo "======================================"
echo "  Installation Complete!"
echo "======================================"
echo ""
echo "Your previous configurations have been backed up to:"
echo "$BACKUP_DIR"
echo ""
echo "To apply the new bash configuration, run:"
echo "  source ~/.bashrc"
echo ""
echo "For tmux changes to take effect in existing sessions, run:"
echo "  tmux source-file ~/.tmux.conf"
echo ""
echo "Enjoy your new setup!"
