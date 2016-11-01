#!/usr/bin/env zsh
#.zshrc
#Assorted aliases and things
#WTFPL Michael Parks <mparks@tkware.info>

##oh-my-zsh things
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
COMPLETION_WAITING_DOTS="true"
DEFAULT_USER="mparks"
plugins=( git git-extras rbenv )
source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH

#Default editor
test -f $(which vim) && export EDTIOR=vim

#Grab work aliases if we have them
test -f .work_aliases && source .work_aliases

#Grab the appropriate specific aliases based on our OS
case $OSTYPE in
  *linux-gnu* ) test -f .profile_linux && source .profile_linux;;
  *darwin*    ) test -f .profile_bsd && source .profile_bsd;;
  *BSD*       ) test -f .profile_bsd &&source .profile_bsd;;
esac

#Load various other stuff here
source .sudo_package_manager
source .aliases

#Colors for grep
alias grep='grep --color=auto'

#Squelch that annoying login banner on SSH
alias ssh='ssh -q'

#Loop visualization, call inside for/while loop to get a spinning cursor
Process()
{
  case $toggle
  in
    1)
      echo -n $1" \ "
      echo -ne "\r"
      toggle="2"
    ;;

    2)
      echo -n $1" | "
      echo -ne "\r"
      toggle="3"
    ;;

    3)
      echo -n $1" / "
      echo -ne "\r"
      toggle="4"
    ;;

    *)
      echo -n $1" - "
      echo -ne "\r"
      toggle="1"
    ;;
  esac
}

#Deploy humor
[[ -s fortune ]] && [[ -s cowsay ]] && fortune|cowsay

#Compress and encrypt a file or directory
function etar(){
tar -cz "$@" | gpg --cipher-algo AES256 --force-mdc -c -o "$@".tgz.gpg
}
