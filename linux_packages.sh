#!/usr/bin/env bash
echo "Determining OS.."
LSBNAME=$(lsb_release -d)
case $LSBNAME in
  *Fedora*) 
    OS='fedora'
    PKGER='dnf'
    INST_SYNTAX='install'
    DOIT="-y"
    ;;
  *Ubuntu*)
    OS='ubuntu'
    PKGER='apt-get'
    INST_SYNTAX='install'
    DOIT="--yes"
    ;;
  *Devuan* )
    OS="devuan"
    PKGER='apt-get'
    INST_SYNTAX='install'
    DOIT="--yes"
    ;;
  *Debian* )
    OS="debian"
    PKGER='apt-get'
    INST_SYNTAX='install'
    DOIT="--yes"
    ;;
  *Arch* )
    OS="arch"
    PKGER='pacman'
    INST_SYNTAX='-Sy'
    ;;
  *FreeBSD* )
    OS='freebsd'
    PKGER='pkg_add'
    INST_SYNTAX=''
    DOIT=''
    ;;
  *Gentoo* )
    OS='gentoo'
    PKGER='emerge'
    INST_SYNTAX=''
    DOIT=''
    ;;
  *)
  echo "OS unknown! Got $LSBNAME"
  exit 1
  ;;

esac

packages=(zsh vim)
echo "This is $OS - attempting to bootstrap with $PKGER"
for p in ${packages[@]}; do
	INSTALLCMD="sudo $PKGER $DOIT $INST_SYNTAX $p"
        $INSTALLCMD
done

exit 0
