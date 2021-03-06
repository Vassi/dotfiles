#!/bin/zsh

# Dotnet core
echo "Installing Dotnet Core"
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-3.1 && \
  sudo apt-get install -y dotnet-sdk-5.0

dotnet dev-certs https --clean
dotnet dev-certs https --trust
dotnet tool install --global dotnet-ef

# NVM
echo "Installing LTS Node"
nvm install node --lts

# Node MISC
echo "Installing Yarn"
npm install --global yarn

if read -q "REPLY?Configure git? [y/N] "
then
  # Git
  echo " Email to use for Git?"
  read gitmail
  git config --global user.email "$gitmail"

  echo "Name to use for Git?"
  read gitname
  git config --global user.name "$gitname"
fi

if read -q "REPLY?Create SSH Key? [y/N] "
then
  # Git
  echo " Email to use for Key?"
  read gitmail
  ssh-keygen -t ed25519 -C "$gitmail" -f "$HOME/.ssh/id_ed25519"
  echo "Copy this for github/gitlab"
  cat ~/.ssh/id_ed25519.pub
  eval `ssh-agent -s`
  ssh-add ~/.ssh/id_ed25519
fi

echo "Note for WSL Some Dev Cert Issues May Occur https://docs.microsoft.com/en-us/aspnet/core/security/enforcing-ssl?view=aspnetcore-5.0&tabs=visual-studio#ssl-linux"