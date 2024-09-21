# Remember to use pamac to install packages
# Remember to activate AUR and Flatpack in pamac

# open pamac GUI
pamac-manager

sudo pacman -Syu git base-devel                  

# install docker and run on startup
pamac install docker
sudo systemctl enable docker
sudo systemctl start docker

# install docker-compose
pamac install docker-compose --no-confirm

sudo usermod -aG docker $USER

# avoid flatpack to install vscode
pamac install visual-studio-code-bin --no-confirm

# Remember to force reboot
sudo reboot