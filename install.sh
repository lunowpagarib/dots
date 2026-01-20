mirror

DEPS="yay uv flatpak ghostty \
	tesseract tesseract-data-osd tesseract-data-eng tesseract-data-rus \
	grim slurp cliphist wl-clipboard \
	labwc fuzzel waybar \
	lemurs wlopm mate-polkit xdg-desktop-portal-gtk \
	swayidle swaybg swaylock brightnessctl \
	mate-calc gpicview mpv thunar \
	zen-browser-bin" 

sudo pacman -S --noconfirm --needed $DEPS

gio mime image/webp gpicview.desktop
gio mime image/jpeg gpicview.desktop
gio mime image/png gpicview.desktop

gio mime video/mp4 gpicview.desktop
gio mime video/mpv gpicview.desktop
gio mime video/webm gpicview.desktop

gio mime inode/directory thunar.desktop

AUR_DEPS="xkblayout-state-git \
		wl-gammarelay-rs \
		rtw89-dkms-git \
		amd-disable-c6-git"

yay -S --needed $AUR_DEPS

sudo systemctl enable amd-disable-c6

git clone https://github.com/lunowpagarib/dots.git
cd dots
rm -rf ~/.config && mv config ~/.config
rm -rf ~/.themes && mv themes ~/.themes
