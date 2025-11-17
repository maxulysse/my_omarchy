# My Omarchy Setup

This repository contains comprehensive documentation on how to install and configure Omarchy Linux on a laptop, along with a curated collection of dot files for common development tools.

## 📚 Documentation

### Getting Started

1. **[Installation Guide](docs/installation.md)** - Complete guide for installing Omarchy on your laptop
   - System requirements
   - Creating bootable media
   - Step-by-step installation process
   - Post-installation checklist

2. **[Configuration Guide](docs/configuration.md)** - Essential configuration after installation
   - System updates and software installation
   - Development environment setup
   - Graphics drivers installation
   - Power management and optimization
   - Backup configuration

3. **[Troubleshooting Guide](docs/troubleshooting.md)** - Solutions to common issues
   - Boot problems
   - Display issues
   - Network connectivity
   - Audio problems
   - Performance optimization

## 🔧 Dot Files

The `dotfiles/` directory contains ready-to-use configuration files for various tools:

- **`.bashrc`** - Enhanced Bash shell configuration with custom aliases and functions
- **`.gitconfig`** - Git configuration with useful aliases and better defaults
- **`.vimrc`** - Vim editor configuration optimized for development
- **`.tmux.conf`** - Tmux terminal multiplexer configuration

See the [Dot Files README](dotfiles/README.md) for detailed information about each configuration file and installation instructions.

## 🚀 Quick Start

### 1. Install Omarchy

Follow the [Installation Guide](docs/installation.md) to install Omarchy on your laptop.

### 2. Configure Your System

After installation, use the [Configuration Guide](docs/configuration.md) to set up essential software and tools:

```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install essential development tools
sudo apt install -y build-essential git vim tmux
```

### 3. Install Dot Files

#### Option A: Using the Installation Script (Recommended)

The easiest way to install all dot files with automatic backup:

```bash
# Clone this repository
git clone https://github.com/maxulysse/my_omarchy.git
cd my_omarchy

# Run the installation script
./install-dotfiles.sh

# Apply bash configuration
source ~/.bashrc
```

#### Option B: Manual Installation

Copy the provided dot files to your home directory manually:

```bash
# Clone this repository
git clone https://github.com/maxulysse/my_omarchy.git
cd my_omarchy

# Backup existing configs
mkdir -p ~/.config/backup
cp ~/.bashrc ~/.config/backup/bashrc.bak 2>/dev/null || true
cp ~/.gitconfig ~/.config/backup/gitconfig.bak 2>/dev/null || true
cp ~/.vimrc ~/.config/backup/vimrc.bak 2>/dev/null || true
cp ~/.tmux.conf ~/.config/backup/tmux.conf.bak 2>/dev/null || true

# Copy new dot files
cp dotfiles/.bashrc ~/
cp dotfiles/.gitconfig ~/
cp dotfiles/.vimrc ~/
cp dotfiles/.tmux.conf ~/

# Create necessary directories
mkdir -p ~/.vim/undodir

# Update git config with your information
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Apply bash configuration
source ~/.bashrc
```

## 📖 What's Included

### Documentation
- Comprehensive installation instructions
- Post-installation configuration steps
- Troubleshooting guide for common issues
- Performance tuning tips
- Security best practices

### Configuration Files
- Bash shell with enhanced features and git-aware prompt
- Git with color output and useful aliases
- Vim with sensible defaults and helpful key bindings
- Tmux with ergonomic configuration and mouse support

## 🤝 Contributing

This is a personal configuration repository, but feel free to:
- Open issues for questions or suggestions
- Submit pull requests with improvements
- Fork and adapt to your own needs

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ⚠️ Disclaimer

These configurations and instructions work for my setup. Always:
- Backup your data before making system changes
- Test configurations in a safe environment
- Customize settings to match your preferences
- Read through scripts before executing them

## 🔗 Resources

- [Official Omarchy Website](#)
- [Omarchy Documentation](#)
- [Omarchy Community Forums](#)

## 📧 Contact

For questions or suggestions, please open an issue in this repository.

---

**Note:** Remember to update the `.gitconfig` file with your own name and email address after installation.
