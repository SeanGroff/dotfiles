#!/usr/bin/env bash

# PRE-EXECUTION - sudo chmod 755 setup.sh

# Grant permissions to Cellar directory
logger -s "Recursively setting user permissions in /usr/local..."
if [ -d "/usr/local/Cellar" ]; then
  # Control will enter here if $DIRECTORY exists.
  sudo chown -R $(whoami) /usr/local/Cellar
fi

if [ -d "/usr/local/bin/brew" ]; then
  # Control will enter here if $DIRECTORY exists.
  sudo chown -R $(whoami) /usr/local/bin/brew
fi

if [ -d "/usr/local/share/man" ]; then
  # Control will enter here if $DIRECTORY exists.
  sudo chown -R $(whoami) /usr/local/share/man
fi

if [ -d "/usr/local/share/zsh" ]; then
  # Control will enter here if $DIRECTORY exists.
  sudo chown -R $(whoami) /usr/local/share/zsh
fi

if [ -d "/usr/local/etc/bash_completion.d/brew" ]; then
  # Control will enter here if $DIRECTORY exists.
  sudo chown -R $(whoami) /usr/local/etc/bash_completion.d/brew
fi

if [ -d "/usr/local/Homebrew" ]; then
  # Control will enter here if $DIRECTORY exists.
  sudo chown -R $(whoami) /usr/local/Homebrew
fi

if [ -d "/usr/local/var/Homebrew" ]; then
  # Control will enter here if $DIRECTORY exists.
  sudo chown -R $(whoami) /usr/local/var/Homebrew
fi

if [ -d "/usr/local/lib/python2.7" ]; then
  # Control will enter here if $DIRECTORY exists.
  sudo chown -R $(whoami) /usr/local/lib/python2.7
fi

if [ -d "/usr/local/lib/python3.7" ]; then
  # Control will enter here if $DIRECTORY exists.
  sudo chown -R $(whoami) /usr/local/lib/python3.7
fi

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Homebrew cask
brew tap caskroom/cask

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)


# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install zsh
brew install zsh

# Switch to using brew-installed zsh as default shell
sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh

# ohmyzsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen

# Brew Installs
brew install git
brew install imagemagick --with-webp
brew install tree
brew install yarn
brew install nvm
brew install neovim
brew install mongodb
brew install nginx
brew install htop

# Cask Installs
brew cask install google-chrome
brew cask install alfred
brew cask install slack
brew cask install spotify
brew cask install visual-studio-code
brew cask install hyper
brew cask install imageoptim
brew cask install postman

# Remove outdated versions from the cellar.
brew cleanup
