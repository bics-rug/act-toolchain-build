#!/bin/bash

#check the build environment

if [ -z $EDA_SRCDIR ]; then
  echo "please load environment variables first => EDA_SRCDIR top folder for downloading all sources"
  exit 1
elif [ -d $EDA_SRCDIR ]; then
  mkdir -p $EDA_SRCDIR
fi

if [ -z $ACT_HOME ]; then
  echo "please load environment variables first => ACT_HOME the installation dir"
  exit 1
elif [ -d $ACT_HOME ]; then
  mkdir -p $ACT_HOME
fi

#if [ -z $LIB_HOME ]; then
#  echo "Note LIB_HOME is not defind, please define before compiling"
#fi

if [ -z $VLSI_TOOLS_SRC ]; then
  echo "please load environment variables first => VLSI_TOOLS_SRC the act src dir"
  exit 1
fi

#use centos 7 as baseline versions (devtools-9) @TODO use a better method to check
echo "gcc version"
command -v gcc > /dev/null && gcc --version | awk '/gcc/ && ($3+0)<9{print "gcc to old"; exit 1}' || exit 1
echo "gfortran"
command -v gfortran  > /dev/null || exit 1
echo "flex"
command -v flex  > /dev/null || exit 1
echo "bison"
command -v bison  > /dev/null || exit 1
echo "m4"
command -v m4  > /dev/null || exit 1
echo "autoreconf"
command -v autoreconf > /dev/null || exit 1
echo "aclocal"
command -v aclocal > /dev/null || exit 1
echo "make"
command -v make > /dev/null || exit 1
echo "git"
command -v git > /dev/null || exit 1
echo "wget"
command -v wget > /dev/null || exit 1
echo "tar"
command -v tar > /dev/null || exit 1

mkdir -p $ACT_HOME
mkdir -p $EDA_SRCDIR
