# rm -rf ~/.config
# rm -rf ~/.themes
# 
# mirror

DEPS="yay uv flatpak ghostty \
	tesseract tesseract-data-osd tesseract-data-eng tesseract-data-rus \
	grim slurp cliphist wl-clipboard \
	labwc fuzzel waybar \
	lemurs wlopm lxqt-policykit xdg-desktop-portal-gtk \
	swayidle swaybg swaylock brightnessctl \
	mate-calc gpicview mpv thunar" 

sudo pacman -Sy --noconfirm --needed $DEPS

printf $EUID

git clone https://github.com/lunowpagarib/disable-c6.git

# gio mime image/webp gpicview.desktop
# gio mime image/jpeg gpicview.desktop
# gio mime image/png gpicview.desktop
# 
# gio mime video/mp4 gpicview.desktop
# gio mime video/mpv gpicview.desktop
# gio mime video/webm gpicview.desktop
# 
# gio mime inode/directory thunar.desktop
# 
# git clone 
