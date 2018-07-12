##############################################################################################################
### XCode Command Line Tools
#      thx https://github.com/alrra/dotfiles/blob/ff123ca9b9b/os/os_x/installs/install_xcode.sh

if ! xcode-select --print-path &> /dev/null; then

    # Prompt user to install the XCode Command Line Tools
    xcode-select --install &> /dev/null

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until the XCode Command Line Tools are installed
    until xcode-select --print-path &> /dev/null; do
        sleep 5
    done

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Point the `xcode-select` developer directory to
    # the appropriate directory from within `Xcode.app`
    # https://github.com/alrra/dotfiles/issues/13

    sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Prompt user to agree to the terms of the Xcode license
    # https://github.com/alrra/dotfiles/issues/10

    sudo xcodebuild -license
fi

##############################################################################################################
### homebrew!

# (if your machine has /usr/local locked down (like google's), you can do this to place everything in ~/.homebrew
source .exports
mkdir $HOMEBREW_HOME && curl -L https://github.com/mxcl/homebrew/tarball/master | tar xz --strip 1 -C $HOMEBREW_HOME

# install all the things
brew bundle

# setup custom dns-crypt settings
rm $HOMEBREW_HOME/etc/dnscrypt-proxy.toml
ln -s $dir/dnscrypt-proxy.toml ~/dnscrypt-proxy.toml
sudo brew services start dnscrypt-proxy

./symlink-setup.sh

# setup correct git url for this repo (downloaded without being logged int)
git remote remove origin
git remote add origin git@github.com:EpiphanyMachine/dotfiles.git

# Final install instructions
echo Install the dnscrypt-proxy bitbar plugin
echo https://getbitbar.com/plugins/Network/dnscrypt-proxy-switcher.10s.sh
echo
echo Install / Copy the gpg and ssh keys
echo 
echo DONE
