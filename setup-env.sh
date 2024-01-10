#!/bin/zsh

# Get Ubuntu version
declare repo_version=$(if command -v lsb_release &> /dev/null; then lsb_release -r -s; else grep -oP '(?<=^VERSION_ID=).+' /etc/os-release | tr -d '"'; fi)

# Download Microsoft signing key and repository
wget https://packages.microsoft.com/config/ubuntu/$repo_version/packages-microsoft-prod.deb -O packages-microsoft-prod.deb

# Install Microsoft signing key and repository
sudo dpkg -i packages-microsoft-prod.deb

# Clean up
rm packages-microsoft-prod.deb

# Update packages
sudo apt update

# Dotnet core
echo "Installing Dotnet Core"

sudo apt-get install -y apt-transport-https && \
sudo apt-get update && \
sudo apt-get install -y dotnet-sdk-7.0 && \
sudo apt-get install -y dotnet-sdk-8.0

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