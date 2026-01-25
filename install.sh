#!/bin/bash

OK="$(tput setaf 2)[OK]$(tput sgr0)"
ERROR="$(tput setaf 1)[ERROR]$(tput sgr0)"
NOTE="$(tput setaf 3)[NOTE]$(tput sgr0)"
INFO="$(tput setaf 4)[INFO]$(tput sgr0)"
WARN="$(tput setaf 1)[WARN]$(tput sgr0)"
CAT="$(tput setaf 6)[ACTION]$(tput sgr0)"
MAGENTA="$(tput setaf 5)"
ORANGE="$(tput setaf 214)"
WARNING="$(tput setaf 1)"
YELLOW="$(tput setaf 3)"
GREEN="$(tput setaf 2)"
BLUE="$(tput setaf 4)"
SKY_BLUE="$(tput setaf 6)"
RESET="$(tput sgr0)"

if [[ $EUID -eq 0 ]]; then
    echo "${ERROR} This script should ${WARNING}NOT${RESET} be executed as root! Exiting..."
    printf "\n%.0s" {1..2} 
    exit 1
    
fi

DEPS="yay flatpak \
	tesseract tesseract-data-osd tesseract-data-eng tesseract-data-rus \
	grim slurp cliphist wl-clipboard \
	labwc fuzzel waybar mate-polkit \
	lemurs wlopm xdg-desktop-portal-gtk gvfs \
	swayidle swaybg swaylock brightnessctl \
	unarchiver gpicview mpv thunar mousepad \
	mate-calc zen-browser-bin \
	ghostty fd eza rg"

sudo pacman -S --noconfirm --needed $DEPS

sudo systemctl enable lemurs

gio mime image/webp gpicview.desktop
gio mime image/jpeg gpicview.desktop
gio mime image/png gpicview.desktop

gio mime video/mp4 mpv.desktop
gio mime video/mpv mpv.desktop
gio mime video/webm mpv.desktop

gio mime inode/directory thunar.desktop


AUR_DEPS="xkblayout-state-git \
		wl-gammarelay-rs \
		wlrctl" # goat

yay -S --needed $AUR_DEPS

if ls /sys/class/power_supply | grep -q BAT; then
  # is a laptop
  if lspci | grep -q RTL8852BE; then
    yay -S --needed rtw89-dkms-git
  fi
  if lscpu | grep -q -P "Ryzen [3579] [567]\d\d\d\w\w" ; then
    yay -S --needed amd-disable-c6-git
    sleep 1
    sudo systemctl enable amd-disable-c6
  fi
fi


git clone https://github.com/lunowpagarib/dots.git
cd dots
rm -rf ~/.config && mv config ~/.config
rm -rf ~/.themes && mv themes ~/.themes
cd .. && rm -rf dots

# reboot
