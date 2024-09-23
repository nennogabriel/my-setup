cd ~/
rm .gitignore
wget https://raw.githubusercontent.com/nennogabriel/my-setup/main/apps/git/files/.gitignore

rm .gitconfig
wget https://raw.githubusercontent.com/nennogabriel/my-setup/main/apps/git/files/.gitconfig

# Get important scripts
mkdir -p ~/scripts
cd ~/scripts
wget https://raw.githubusercontent.com/nennogabriel/my-setup/main/apps/git/files/scripts/git-cloneb.sh
chmod +x git-cloneb.sh

git config --global core.excludesfile ~/.gitignore
git config --global user.name "Pedro Moreno"
git config --global user.email "nennogabriel@gmail.com" 
