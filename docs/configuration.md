# Omarchy Configuration Guide

This guide covers the essential configuration steps after installing Omarchy on your laptop.

## System Update

First, ensure your system is up to date:

```bash
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
```

## Essential Software Installation

### Development Tools

```bash
# Build essentials
sudo apt install -y build-essential git curl wget

# Version control
sudo apt install -y git git-lfs

# Text editors
sudo apt install -y vim neovim nano

# Terminal utilities
sudo apt install -y tmux zsh htop tree
```

### Programming Languages

```bash
# Python
sudo apt install -y python3 python3-pip python3-venv

# Node.js (via NodeSource)
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs

# Go
sudo apt install -y golang

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Multimedia

```bash
sudo apt install -y vlc gimp inkscape
```

### Utilities

```bash
# File managers and system tools
sudo apt install -y nautilus gnome-tweaks dconf-editor

# Compression tools
sudo apt install -y zip unzip rar unrar p7zip-full

# Network tools
sudo apt install -y net-tools openssh-server
```

## Shell Configuration

### Setting up Zsh (Optional)

If you prefer Zsh over Bash:

```bash
# Install Zsh
sudo apt install -y zsh

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set as default shell
chsh -s $(which zsh)
```

### Installing Dot Files

Copy the provided dot files from the `dotfiles/` directory:

```bash
# Backup existing configurations
mkdir -p ~/.config/backup
cp ~/.bashrc ~/.config/backup/bashrc.bak 2>/dev/null || true
cp ~/.gitconfig ~/.config/backup/gitconfig.bak 2>/dev/null || true
cp ~/.vimrc ~/.config/backup/vimrc.bak 2>/dev/null || true

# Copy new dot files
cp dotfiles/.bashrc ~/
cp dotfiles/.gitconfig ~/
cp dotfiles/.vimrc ~/
cp dotfiles/.tmux.conf ~/

# Source the new configuration
source ~/.bashrc
```

## Graphics Drivers

### NVIDIA Drivers

```bash
# Detect NVIDIA GPU
ubuntu-drivers devices

# Install recommended driver
sudo ubuntu-drivers autoinstall

# Or install specific version
sudo apt install nvidia-driver-XXX

# Reboot after installation
sudo reboot
```

### AMD Drivers

Most AMD GPUs work out of the box with open-source drivers. For latest features:

```bash
sudo apt install -y mesa-vulkan-drivers mesa-vulkan-drivers:i386
```

## Firewall Setup

```bash
# Enable UFW firewall
sudo ufw enable

# Allow SSH (if needed)
sudo ufw allow ssh

# Check status
sudo ufw status
```

## Power Management

### Laptop Power Optimization

```bash
# Install TLP for better battery life
sudo apt install -y tlp tlp-rdw

# Start TLP
sudo tlp start

# Check status
sudo tlp-stat -s
```

## Customization

### GNOME Tweaks

```bash
# Install GNOME Extensions
sudo apt install -y gnome-shell-extensions chrome-gnome-shell

# Install Extension Manager
sudo apt install -y gnome-shell-extension-manager
```

### Recommended Extensions
- Dash to Dock
- Clipboard Indicator
- CPU Power Manager
- User Themes

## Backup Configuration

Set up automatic backups:

```bash
# Install Timeshift for system snapshots
sudo apt install -y timeshift

# Launch Timeshift and configure backups
sudo timeshift-gtk
```

## Development Environment Setup

### Git Configuration

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config --global core.editor "vim"
git config --global init.defaultBranch "main"
```

### SSH Key Generation

```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "your.email@example.com"

# Start SSH agent
eval "$(ssh-agent -s)"

# Add key to agent
ssh-add ~/.ssh/id_ed25519

# Display public key (add to GitHub/GitLab)
cat ~/.ssh/id_ed25519.pub
```

## Docker Installation (Optional)

```bash
# Remove old versions
sudo apt remove docker docker-engine docker.io containerd runc

# Install dependencies
sudo apt install -y ca-certificates curl gnupg lsb-release

# Add Docker's GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add user to docker group
sudo usermod -aG docker $USER

# Log out and back in for group changes to take effect
```

## Performance Tuning

### Reduce Swappiness

```bash
# Check current swappiness
cat /proc/sys/vm/swappiness

# Set swappiness to 10 (reduces swap usage)
sudo sysctl vm.swappiness=10

# Make it permanent
echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf
```

## Next Steps

- [Troubleshooting Guide](troubleshooting.md) - Common issues and solutions
- [Dot Files Documentation](../dotfiles/README.md) - Details about configuration files
