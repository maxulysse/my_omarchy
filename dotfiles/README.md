# Dot Files

This directory contains example configuration files (dot files) for various tools and applications used in Omarchy.

## Available Dot Files

### Shell Configuration

#### `.bashrc`
Bash shell configuration with:
- Custom prompt with git branch display
- Useful aliases for common commands
- Git shortcuts
- Safety aliases (interactive rm, cp, mv)
- Helpful functions (mkcd, extract)
- Enhanced history settings
- Color support

**Installation:**
```bash
cp .bashrc ~/
source ~/.bashrc
```

### Version Control

#### `.gitconfig`
Git configuration with:
- Color-coded output
- Useful aliases (st, co, br, ll, ls)
- Better log formatting
- Auto-correct for mistyped commands
- Rebase on pull by default
- Diff3 conflict style

**Installation:**
```bash
cp .gitconfig ~/
# Edit the file to update name and email
vim ~/.gitconfig
```

### Text Editors

#### `.vimrc`
Vim configuration with:
- Line numbers (absolute and relative)
- Syntax highlighting
- Smart indentation
- Search enhancements
- Mouse support
- Custom key mappings
- Persistent undo
- Auto-removal of trailing whitespace
- File-type specific settings

**Installation:**
```bash
cp .vimrc ~/
# Create undo directory
mkdir -p ~/.vim/undodir
```

### Terminal Multiplexer

#### `.tmux.conf`
Tmux configuration with:
- Changed prefix to Ctrl+a (more ergonomic than Ctrl+b)
- Mouse support enabled
- Vi-mode key bindings
- Intuitive pane splitting (| and -)
- Custom status bar
- Fast pane switching with Alt+arrows
- Window navigation with Shift+arrows

**Installation:**
```bash
cp .tmux.conf ~/
# Reload tmux if already running
tmux source-file ~/.tmux.conf
```

## Installation Script

To install all dot files at once:

```bash
#!/bin/bash
# Backup existing configurations
mkdir -p ~/.config/backup
for file in .bashrc .gitconfig .vimrc .tmux.conf; do
    if [ -f ~/$file ]; then
        cp ~/$file ~/.config/backup/${file}.$(date +%Y%m%d_%H%M%S)
        echo "Backed up existing $file"
    fi
done

# Copy new configurations
cp dotfiles/.bashrc ~/
cp dotfiles/.gitconfig ~/
cp dotfiles/.vimrc ~/
cp dotfiles/.tmux.conf ~/

# Create necessary directories
mkdir -p ~/.vim/undodir

# Update git config with your information
echo "Please update your name and email in ~/.gitconfig"

echo "Dot files installed successfully!"
echo "Run 'source ~/.bashrc' to apply bash configuration"
```

## Customization

Feel free to customize these dot files according to your preferences. Each file is well-commented to explain what each setting does.

### Common Customizations

#### Bashrc
- Change the prompt format in the `PS1` variable
- Add your own aliases
- Modify PATH to include additional directories

#### Gitconfig
- Update user name and email
- Add more aliases
- Configure diff and merge tools

#### Vimrc
- Change color scheme
- Adjust tab width for different file types
- Add plugins using a plugin manager

#### Tmux.conf
- Change the prefix key
- Customize status bar appearance
- Adjust key bindings

## Additional Configuration Files

You may also want to create:

### `.bash_aliases`
For additional bash aliases that you don't want in the main `.bashrc`:
```bash
# ~/.bash_aliases
alias work='cd ~/workspace'
alias proj='cd ~/projects'
```

### `.bash_local`
For machine-specific configurations:
```bash
# ~/.bash_local
export CUSTOM_PATH="/opt/custom/bin"
export PATH="$CUSTOM_PATH:$PATH"
```

### `.gitignore_global`
For files to ignore globally:
```bash
# ~/.gitignore_global
*~
.DS_Store
*.swp
*.swo
.vscode/
.idea/
```

Then tell git about it:
```bash
git config --global core.excludesfile ~/.gitignore_global
```

## Backup and Sync

Consider backing up your dot files to a private repository:

```bash
# Create a private dot files repository
mkdir -p ~/dotfiles
cd ~/dotfiles
git init
cp ~/.bashrc .
cp ~/.gitconfig .
cp ~/.vimrc .
cp ~/.tmux.conf .
git add .
git commit -m "Initial dot files backup"
git remote add origin <your-private-repo-url>
git push -u origin main
```

## Troubleshooting

### Bash changes not taking effect
```bash
source ~/.bashrc
# or
exec bash
```

### Vim complains about missing directories
```bash
mkdir -p ~/.vim/undodir
```

### Tmux not loading config
```bash
# In tmux session
tmux source-file ~/.tmux.conf
# or restart tmux
```

### Git config not working
```bash
# Verify config
git config --list
# Check for syntax errors
git config --list --show-origin
```

## Learning Resources

- [Bash Reference Manual](https://www.gnu.org/software/bash/manual/)
- [Git Documentation](https://git-scm.com/doc)
- [Vim Documentation](https://www.vim.org/docs.php)
- [Tmux Manual](https://man.openbsd.org/tmux)
