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
sudo apt-get update && sudo apt-get upgrade && sudo apt-get install -y git nano curl wget

# generate and add ssh key to github - use your own email
ssh-keygen -t rsa -C "EpiphanyMachine@gmail.com" && cat ~/.ssh/id_rsa.pub

# clone and bootstrap dotfiles (ssh key required)
mkdir ~/Downloads/projects && cd ~/Downloads/projects && git clone git@github.com:EpiphanyMachine/dotfiles.git && cd dotfiles && git checkout chromeos && ./bootstrap.sh && source ~/.bash_profile

# install hub
mkdir ~/bin && cd ~/Downloads && wget https://github.com/github/hub/releases/download/v2.2.0/hub-linux-amd64-2.2.0.tar.gz && tar -xzf hub-linux-amd64-2.2.0.tar.gz && cp hub-linux-amd64-2.2.0/hub ~/bin/hub && rm hub-linux-amd64-2.2.0.tar.gz && rm -rf hub-linux-amd64-2.2.0/

# install nvm
curl https://raw.githubusercontent.com/creationix/nvm/v0.23.3/install.sh | bash && reload

# install iojs (nvm required)
mkdir /home/em/.node && nvm install iojs

# install rvm
curl -sSL https://get.rvm.io | bash && reload

# install ruby (rvm required)
rvm install current && rvm use current

# intall linuxbrew (ruby required)
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)" && brew update && brew upgrade && brew install pkg-config && brew unlink pkg-config && brew link pkg-config

# running servers (https://github.com/dnschneid/crouton/wiki/Running-servers-in-crouton)
sudo apt-get update && sudo apt-get install -y iptables && echo "**********" && echo "add '/sbin/iptables -P INPUT ACCEPT' to '/etc/rc.local'" && echo "**********"

# install redis (brew required)
brew update && brew install redis

# install postgres (brew required)
sudo apt-get update && sudo apt-get install libxslt-dev uuid-dev
brew update && brew install --without-tcl --without-perl postgres
pg_ctl -D ~/.linuxbrew/Cellar/postgresql/9.4.1/data initdb && pg_ctl -D ~/.linuxbrew/Cellar/postgresql/9.4.1/data start
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
