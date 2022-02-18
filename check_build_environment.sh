#!/bin/bash

#check the build environment


if [ -z $EDA_SRCDIR ]; then
  echo "please load environment variables first => EDA_SRCDIR top folder for downloading all sources"
  exit 1
fi

if [ -z $ACT_HOME ]; then
  echo "please load environment variables first => ACT_HOME the installation dir"
  exit 1
fi

if [ -z $VLSI_TOOLS_SRC ]; then
  echo "please load environment variables first => VLSI_TOOLS_SRC the act src dir"
  exit 1
fi

#use centos 7 as baseline versions (devtools-7) @TODO use a better method to check
command -v gcc > /dev/null && gcc --version | awk '/gcc/ && ($3+0)<7{print "gcc to old"; exit 1}' || exit 1
command -v m4  > /dev/null || exit 1
command -v autoconf || exit 1
command -v make > /dev/null || exit 1
command -v git > /dev/null || exit 1
command -v wget > /dev/null || exit 1

mkdir $ACT_HOME
mkdir $EDA_SRCDIR
