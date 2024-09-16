cd ~/
rm .gitignore
wget https://gist.githubusercontent.com/nennogabriel/75f66ce5b643a950a04cc0009dfbd16e/raw/2034ea451d2a77e981c0fafe7a1787ede3987dd1/.gitignore
rm .gitconfig
wget https://gist.githubusercontent.com/nennogabriel/b795ba14f0fbaa56cb2005dfeedcbbaf/raw/8ff08772b7e50a8b3fa7b4935c46634eca6c4e32/.gitconfig
git config --global core.excludesfile ~/.gitignore
git config --global user.name "Pedro Moreno"
git config --global user.email "nennogabriel@gmail.com" 
