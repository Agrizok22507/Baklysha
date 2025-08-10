pacman -Syu
pacman -S kitty wofi swaybg waybar

mkdir ~/.config/hypr
mkdir ~/.config/waybar
mkdir ~/.config/wofi

cp ~/Baklysha/hypr/hyprland.conf ~/.config/hypr
cp ~/Baklysha/waybar/config ~/.config/waybar
cp ~/Baklysha/waybar/style.css ~/.config/waybar
cp ~/Baklysha/wofi/style.css ~/.config/wofi
cp ~/Baklysha/wofi/config ~/.config/wofi
