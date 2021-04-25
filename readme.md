# Setup New Env

This is a personal project to setup a new machine. Right now most of these scripts and instructions are for windows machines using WSL 2 but for obvious reasons most of it should work just fine in a Linux or MacOS machine with a few exceptions (how zsh is installed and some dotnet core config mostly).

## Pre-reqs:
------
If not using ubuntu, install zsh [see this link](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)

## Fonts
------
For Powerline Terminal Fonts: [https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)

For editors: [Fira Code](https://github.com/tonsky/FiraCode)

## New Windows Machine Checklist
-------
1) Install WSL2 [https://docs.microsoft.com/en-us/windows/wsl/install-win10#manual-installation-steps](https://docs.microsoft.com/en-us/windows/wsl/install-win10#manual-installation-steps)
2) Install VS Code [https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user](Direct Download Link)
3) Run powershell as admin, Install chocolatey and basics (copy and paste PS script below)

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install dotnetcore-sdk dotnet-5.0-sdk microsoft-windows-terminal python2 7zip nvm docker-desktop googlechrome git.install --params "/NoAutoCrlf"
```

3) Open Windows Terminal and go into settings, override with terminal/terminal.json as desired
`note that the starting directories and GUIDs are likely to be different`
4) Create new SSH Key and add it to Github

```
ssh-keygen -t ed25519 -C "comment"
cat ~/.ssh/id_ed25519.pub | clip
```

## WSL Install
---------
From WSL terminal clone this repo and CD into it and run the following commands.

```
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# answer Y to switching to ZSH so that ZSH is running before running the following scripts
. ./setup-zsh.sh
. ./setup-env.sh
```

Profit.

### What do?
The WSL setup scripts do basically the same thing the windows chocolately/checklist section does. It will install ZSH with the most common plugins:
* Autosuggest
* syntax highlighting
* powerlevel10k (for prompt)
* nvm for managing node

The env script setups dotnet core 3.1 and 5.0 along with pre-reqs and installs the latest LTS version of node and Yarn.It will then optionally walk you through configuring GIT and generating a new SSH key.

Pre-configured files for oh-my-zsh and powerlevel10k are then dropped in.

Check out powerlevel10k and oh my zsh for more info on how to customize things further.
