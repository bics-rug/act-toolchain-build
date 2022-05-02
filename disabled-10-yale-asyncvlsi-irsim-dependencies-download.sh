#!/bin/bash

echo "#############################"
echo "#tcl"
if [ ! -d "$EDA_SRCDIR/org-tcltk-tcl" ]; then
  cd $EDA_SRCDIR
  echo "download & check"
  wget --quiet https://prdownloads.sourceforge.net/tcl/tcl8.6.12-src.tar.gz
  echo "9c0fd1f78fc90ca9b69ae4ab704687d5544220005ccd7678bf58cc13135e67e0 tcl8.6.12-src.tar.gz" | sha256sum --check || exit 1
  mkdir $EDA_SRCDIR/org-tcltk-tcl
  tar -C "$EDA_SRCDIR/org-tcltk-tcl" --strip-components=1 -xf tcl8.6.12-src.tar.gz
  rm tcl8.6.12-src.tar.gz
fi

echo "#############################"
echo "#tcl"
if [ ! -d "$EDA_SRCDIR/org-tcltk-tk" ]; then
  cd $EDA_SRCDIR
  echo "download & check"
  wget --quiet https://prdownloads.sourceforge.net/tcl/tk8.6.12-src.tar.gz
  echo "9c0fd1f78fc90ca9b69ae4ab704687d5544220005ccd7678bf58cc13135e67e0 tk8.6.12-src.tar.gz" | sha256sum --check || exit 1
  mkdir $EDA_SRCDIR/openmpi
  tar -C "$EDA_SRCDIR/org-tcltk-tk" --strip-components=1 -xf tk8.6.12-src.tar.gz
  rm tk8.6.12-src.tar.gz
fi
