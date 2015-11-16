#!/bin/bash
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
  *)
  echo "OS unknown! Got $LSBNAME"
  exit 1
  ;;

esac
echo "This is $OS - attempting to bootstrap Salt with $PKGER"
INSTALLCMD="sudo $PKGER $DOIT $INST_SYNTAX salt-minion"
$INSTALLCMD
