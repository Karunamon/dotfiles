#!/usr/bin/env zsh
#.zshrc
#Assorted aliases and things
#WTFPL Michael Parks <mparks@tkware.info>

##oh-my-zsh things
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
COMPLETION_WAITING_DOTS="true"
DEFAULT_USER="mparks"
plugins=( git git-extras rvm osx cp jira )
source $ZSH/oh-my-zsh.sh
export PATH=/usr/local/bin::/usr/bin:/bin:/usr/sbin:/sbin:$PATH

#Grab corporate aliases if we have them
CORPALIAS=~/.work_aliases && test -f $CORPALIAS && source $CORPALIAS

#Grab the appropriate aliases based on our OS
case $OSTYPE in
  *linux-gnu* ) source .profile_linux;;
  *darwin*    ) source .profile_bsd;;
  *BSD*       ) source .profile_bsd;;
esac

#Enable colors and stop them from polluting
alias grep='grep --color=auto'

#Assorted timesavers
alias lsr='ls -ltr'
alias lsf='ls -f'
alias cls='clear' #DOS-ism i'll never be able to unlearn
alias t='task'
alias resource='source ~/.zshrc'

#Squelch that annoying login banner on SSH
alias ssh='ssh -q'

#Annoying misspelling fixes
alias grpe='grep'
alias sl='ls'
alias gti='git'

#Loop visualization, call mid-for/while loop to get a spinning cursor
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

#RVM Shenanigans
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#Deploy humor
[[ -s fortune ]] && [[ -s cowsay ]] && fortune|cowsay
