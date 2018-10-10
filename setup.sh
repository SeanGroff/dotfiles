#!/usr/bin/env bash

# grant permissions to execute script
sudo chmod 755 setup.sh

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Homebrew cask
brew install caskroom/cask/brew-cask

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Grant permissions to Cellar directory
sudo chown -R $(whoami) /usr/local/Cellar

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
