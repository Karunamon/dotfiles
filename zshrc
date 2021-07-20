#!/usr/bin/env zsh
#.zshrc
#Assorted aliases and things
#WTFPL Michael Parks <mparks@tkware.info>

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep
unsetopt autocd extendedglob
bindkey -e
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH

#Default editor
test -f $(which vim) && export EDTIOR=vim

#Grab work aliases if we have them
test -f .work_aliases && source .work_aliases

#Grab the appropriate specific aliases based on our OS
case $OSTYPE in
  *linux-gnu* ) test -f .profile_linux && source .profile_linux;;
  *darwin*    ) test -f .profile_bsd && source .profile_bsd;;
  *BSD*       ) test -f .profile_bsd && source .profile_bsd;;
esac

#Load various other stuff here
test -f .sudo_package_manager && source .sudo_package_manager
test -f .aliases && source .aliases

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

#Function checking for later
fn_exists() { declare -F "$1" > /dev/null; }

#Deploy humor
[[ -s fortune ]] && [[ -s cowsay ]] && fortune|cowsay

#Make ZSH globbing behave like bash globbing
setopt nonomatch

fn_exists pyenv && eval "$(pyenv init -)"
fn_exists pyenv && eval "$(pyenv virtualenv-init -)"
fn_exists rbenv && eval "$(rbenv init -)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source ~/powerlevel10k/powerlevel10k.zsh-theme

#P10K config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
