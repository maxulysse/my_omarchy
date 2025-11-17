# Troubleshooting Guide

Common issues and their solutions when running Omarchy.

## Boot Issues

### System Won't Boot

**Symptoms:** Black screen, system hangs at boot

**Solutions:**

1. **Try nomodeset parameter:**
   - At GRUB menu, press 'e' to edit boot options
   - Add `nomodeset` to the kernel line
   - Press F10 to boot

2. **Check Secure Boot:**
   - Enter BIOS/UEFI settings
   - Disable Secure Boot
   - Save and restart

3. **Verify GRUB installation:**
   ```bash
   sudo update-grub
   sudo grub-install /dev/sda  # Replace with your boot drive
   ```

### Stuck at Plymouth Screen

**Solution:**
```bash
# Remove quiet splash from GRUB
sudo nano /etc/default/grub
# Change: GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
# To: GRUB_CMDLINE_LINUX_DEFAULT=""
sudo update-grub
```

## Display Issues

### Black Screen After Login

**Solutions:**

1. **Switch to TTY:**
   - Press Ctrl+Alt+F2 to switch to text console
   - Login with your credentials

2. **Reinstall display manager:**
   ```bash
   sudo apt install --reinstall gdm3
   sudo systemctl restart gdm3
   ```

3. **Check graphics drivers:**
   ```bash
   # For NVIDIA
   nvidia-smi
   # If fails, reinstall drivers
   sudo apt install --reinstall nvidia-driver-XXX
   ```

### Screen Tearing

**Solution for Intel graphics:**
```bash
sudo mkdir -p /etc/X11/xorg.conf.d/
sudo nano /etc/X11/xorg.conf.d/20-intel.conf
```

Add:
```
Section "Device"
   Identifier  "Intel Graphics"
   Driver      "intel"
   Option      "TearFree"    "true"
EndSection
```

**Solution for NVIDIA:**
```bash
nvidia-settings
# Enable "Force Full Composition Pipeline" in X Server Display Configuration
```

## Network Issues

### WiFi Not Working

**Solutions:**

1. **Check if WiFi is disabled:**
   ```bash
   rfkill list
   sudo rfkill unblock wifi
   ```

2. **Restart NetworkManager:**
   ```bash
   sudo systemctl restart NetworkManager
   ```

3. **Install firmware:**
   ```bash
   sudo apt install linux-firmware
   sudo reboot
   ```

### Ethernet Not Detected

**Solution:**
```bash
# Check network interfaces
ip link show

# Check driver
lspci -k | grep -A 3 Ethernet

# Restart networking
sudo systemctl restart networking
```

## Audio Issues

### No Sound

**Solutions:**

1. **Check volume and mute status:**
   ```bash
   alsamixer
   # Press M to unmute channels
   ```

2. **Restart PulseAudio:**
   ```bash
   pulseaudio -k
   pulseaudio --start
   ```

3. **Reinstall audio packages:**
   ```bash
   sudo apt install --reinstall alsa-base pulseaudio
   ```

### Crackling or Popping Sound

**Solution:**
```bash
sudo nano /etc/pulse/default.pa
# Add at the end:
# load-module module-udev-detect tsched=0
pulseaudio -k
```

## Performance Issues

### System Running Slow

**Solutions:**

1. **Check disk usage:**
   ```bash
   df -h
   # Clean package cache
   sudo apt clean
   sudo apt autoremove
   ```

2. **Check running processes:**
   ```bash
   htop
   # Kill problematic processes with F9
   ```

3. **Check disk health:**
   ```bash
   sudo smartctl -a /dev/sda
   ```

### High CPU Usage

**Solution:**
```bash
# Identify process
top
# or
htop

# Check for updates that might fix the issue
sudo apt update && sudo apt upgrade
```

## Package Management Issues

### Broken Packages

**Solutions:**

```bash
# Fix broken dependencies
sudo apt --fix-broken install

# Reconfigure packages
sudo dpkg --configure -a

# Clean and update
sudo apt clean
sudo apt update
sudo apt upgrade
```

### Repository Errors

**Solution:**
```bash
# Reset repository list
sudo rm /etc/apt/sources.list.d/*
sudo apt update

# If still issues, check main sources file
sudo nano /etc/apt/sources.list
```

## Bluetooth Issues

### Bluetooth Not Working

**Solutions:**

1. **Restart Bluetooth service:**
   ```bash
   sudo systemctl restart bluetooth
   ```

2. **Check if blocked:**
   ```bash
   rfkill list
   sudo rfkill unblock bluetooth
   ```

3. **Reinstall Bluetooth stack:**
   ```bash
   sudo apt install --reinstall bluez
   ```

## USB Issues

### USB Devices Not Recognized

**Solutions:**

1. **Check USB devices:**
   ```bash
   lsusb
   dmesg | tail
   ```

2. **Reset USB:**
   ```bash
   sudo modprobe -r usb_storage
   sudo modprobe usb_storage
   ```

## System Recovery

### Boot into Recovery Mode

1. Restart computer
2. Hold Shift key during boot
3. Select "Advanced options for Omarchy"
4. Select "Recovery mode"
5. Choose "root" for root shell

### Repair Filesystem

From recovery mode:
```bash
# Check filesystem
fsck -f /dev/sdaX  # Replace X with your partition number

# If root filesystem
mount -o remount,rw /
```

## Getting More Help

### System Information

Collect system information for bug reports:
```bash
# System details
uname -a
lsb_release -a

# Hardware info
lspci
lsusb
lshw -short

# Logs
journalctl -xb
dmesg | tail -50
```

### Useful Log Locations

- System logs: `/var/log/syslog`
- Kernel messages: `dmesg`
- X server: `/var/log/Xorg.0.log`
- Boot: `journalctl -b`

## Community Resources

- Official Omarchy forums
- IRC channels
- Stack Exchange
- GitHub issues

## Backup Before Major Changes

Always backup before attempting major fixes:
```bash
# Backup home directory
tar -czf ~/backup-$(date +%Y%m%d).tar.gz ~/

# Create system snapshot with Timeshift
sudo timeshift --create
```
