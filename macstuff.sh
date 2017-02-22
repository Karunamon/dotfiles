#!/usr/bin/env bash


function brewit(){
  echo -n "Checking for $2.. "
  ls $1
  if [ $? != 0 ]; then
    echo "not installed, brewing $2"
    brew install $2
  fi
}

function caskit(){
  echo -n "Checking for $1.. "
  ls /Applications | grep $1
  if [ $? != 0 ]; then
    echo "Not installed, brewing $2"
    brew cask install $2
  fi
}

case $OSTYPE in
  darwin* ) echo "This is a mac! Doing mac things now..";;
  * ) echo "Not a mac - moving on." ; exit 0 ;;
esac

echo "Setting mac defaults"
source mac_system_settings.sh

echo "Software installation"

echo -n "Checking for oh-my-zsh..."
ls ~/.oh-my-zsh
if [ $? != 0 ]; then
   echo "installing"
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
   echo "replacing zshrc"
   mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
 fi

echo -n "Homebrew..."
if [ -a /usr/local/bin/brew ]; then
  echo "already installed"
else
  echo "installing"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brewit '/usr/local/bin/git' 'git'
brewit '/usr/local/bin/sbcl' 'sbcl'
caskit 'iTerm' 'iterm2'
caskit 'Atom' 'atom'
caskit '1Password' '1password'
caskit 'Dropbox' 'dropbox'
caskit 'AppCleaner' 'appcleaner'