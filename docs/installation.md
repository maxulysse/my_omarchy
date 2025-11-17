# Omarchy Installation Guide

This guide covers the installation process for Omarchy on a laptop.

## Prerequisites

Before installing Omarchy, ensure you have:

- A computer with at least 4GB of RAM (8GB recommended)
- 20GB of free disk space
- A bootable USB drive (8GB minimum)
- Backup of important data

## Download Omarchy

1. Visit the official Omarchy website to download the latest ISO image
2. Verify the checksum to ensure the download is complete and unmodified
3. Create a bootable USB drive using tools like:
   - `dd` on Linux: `sudo dd if=omarchy.iso of=/dev/sdX bs=4M status=progress && sync`
   - Etcher (cross-platform GUI tool)
   - Rufus (Windows)

## Installation Steps

### 1. Boot from USB

1. Insert the bootable USB drive
2. Restart your computer
3. Enter the boot menu (usually F12, F2, or Del during startup)
4. Select the USB drive from the boot options

### 2. Start Installation

1. Select "Install Omarchy" from the boot menu
2. Choose your language and keyboard layout
3. Configure network settings if needed

### 3. Disk Partitioning

Choose one of the following options:

#### Automatic Partitioning
- Select "Erase disk and install Omarchy" (recommended for new users)
- The installer will create appropriate partitions automatically

#### Manual Partitioning
For advanced users who want custom partitions:

```
/boot/efi - 512MB - EFI System Partition (for UEFI systems)
/boot     - 1GB   - ext4
/         - 30GB+ - ext4 or btrfs
/home     - remaining space - ext4 or btrfs
swap      - 2-8GB (or equal to RAM for hibernation)
```

### 4. User Account Setup

1. Enter your full name
2. Choose a username
3. Set a strong password
4. Enable encryption for your home directory (optional but recommended)

### 5. Complete Installation

1. Review your installation settings
2. Click "Install" to begin the installation
3. Wait for the installation to complete (typically 10-30 minutes)
4. Remove the USB drive when prompted
5. Restart your computer

## Post-Installation

After the first boot, it's recommended to:

1. Update the system:
   ```bash
   sudo apt update && sudo apt upgrade
   ```

2. Install essential tools (see [Configuration Guide](configuration.md))

3. Set up your dot files (see the `dotfiles/` directory)

## Troubleshooting

### Boot Issues

If you encounter boot issues:
- Verify Secure Boot settings in BIOS
- Ensure the USB drive is properly created
- Try booting in compatibility mode

### Installation Fails

If installation fails:
- Check disk space requirements
- Verify the ISO checksum
- Check system logs for error messages

### Graphics Issues

If you experience graphics problems:
- Boot with `nomodeset` parameter
- Install proprietary drivers after installation
- Update the kernel

## Next Steps

- [Configuration Guide](configuration.md) - Configure your system
- [Troubleshooting](troubleshooting.md) - Common issues and solutions
- [Dot Files](../dotfiles/) - Example configuration files
