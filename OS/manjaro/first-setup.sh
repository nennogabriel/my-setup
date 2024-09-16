sudo pacman -S curl git go wget

cd ~/
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -Syu