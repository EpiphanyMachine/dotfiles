past commands with ctrl+shift+v in the terminal

Setup
---------------------
1. enable developer mode on chromebook

2. setup crouton and ubuntu
 - [download crouton](https://goo.gl/fd3zc)
 - open shell (ctrl+alt+t) `shell`
 - `sudo sh crouton -r trusty -t cli-extra`
 - choose a username and password at prompt
 - `sudo enter-chroot`

3. configure ubuntu (use your own email in the ssh steps)

```
# install base requirements
sudo apt-get update && sudo apt-get upgrade && sudo apt-get install -y build-essential curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev nano

# generate and add ssh key to github - use your own email
ssh-keygen -t rsa -C "EpiphanyMachine@gmail.com" && cat ~/.ssh/id_rsa.pub

# clone and bootstrap dotfiles
mkdir ~/Downloads/projects && cd ~/Downloads/projects && git clone git@github.com:EpiphanyMachine/dotfiles.git && cd dotfiles && git checkout chromeos && ./bootstrap.sh && source ~/.bash_profile

# install hub
mkdir ~/bin && cd ~/Downloads && wget https://github.com/github/hub/releases/download/v2.2.0/hub-linux-amd64-2.2.0.tar.gz && tar -xzf hub-linux-amd64-2.2.0.tar.gz && cp hub-linux-amd64-2.2.0/hub ~/bin/hub && rm hub-linux-amd64-2.2.0.tar.gz && rm -rf hub-linux-amd64-2.2.0/

# intall linuxbrew (https://github.com/Homebrew/linuxbrew)
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
brew uppdate && brew upgrade && brew install pkg-config && brew unlink pkg-config && brew link pkg-config

# install brew packages
brew install redis
```

Usage
---------------
 - full screen `sudo startcli`
 - in terminal `sudo enter-chroot`

SSH Key
-----------------------
[github tutorial](https://help.github.com/articles/generating-ssh-keys/#platform-linux)

replace your email in the following line
```
ssh-keygen -t rsa -C "EpiphanyMachine@gmail.com" && cat ~/.ssh/id_rsa.pub
```
[github ssh settings](https://github.com/settings/ssh)
