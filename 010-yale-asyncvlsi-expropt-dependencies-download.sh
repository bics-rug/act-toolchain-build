#!/bin/bash

echo "#############################"
echo "# expropt dependencies"

echo "#############################"
echo "# readline for abc"
if [ ! -d "$EDA_SRCDIR/readline" ]; then
  cd $EDA_SRCDIR
  echo "download & check"
  wget --quiet --no-check-certificate https://ftp.gnu.org/gnu/readline/readline-8.1.2.tar.gz
  echo "7589a2381a8419e68654a47623ce7dfcb756815c8fee726b98f90bf668af7bc6 readline-8.1.2.tar.gz" | sha256sum --check || exit 1
  mkdir $EDA_SRCDIR/readline
  tar -C "$EDA_SRCDIR/readline" --strip-components=1 -xf readline-8.1.2.tar.gz
  rm readline-8.1.2.tar.gz
fi
echo "#############################"
echo "# yosys"

if [ ! -d "$EDA_SRCDIR/org-yosyshq-yosys" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch master https://github.com/yosyshq/yosys.git
  mv yosys $EDA_SRCDIR/org-yosyshq-yosys
fi
echo "#############################"
echo "# abc"

#if [ ! -d "$EDA_SRCDIR/berkeley-berkeley-abc-abc" ]; then
#cd $EDA_SRCDIR
#  git clone --depth 1 --branch master https://github.com/berkeley-abc/abc.git
#  mv abc $EDA_SRCDIR/berkeley-berkeley-abc-abc
#fi

if [ ! -d "$EDA_SRCDIR/yale-rmanohar-abc" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch master https://github.com/rmanohar/abc.git
  mv abc $EDA_SRCDIR/yale-rmanohar-abc
fi

echo "#############################"
echo "# TCL"

if [ ! -d "$EDA_SRCDIR/org-tcltk-tcl" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch release https://github.com/tcltk/tcl.git
  mv tcl $EDA_SRCDIR/org-tcltk-tcl
fi

echo "#############################"
echo "# TK"

if [ ! -d "$EDA_SRCDIR/org-tcltk-tk" ]; then
cd $EDA_SRCDIR
  git clone --depth 1 --branch release https://github.com/tcltk/tk.git
  mv tk $EDA_SRCDIR/org-tcltk-tk
fi

echo "#############################"
echo "# libffi"
if [ ! -d "$EDA_SRCDIR/org-libffi-libffi" ]; then
  cd $EDA_SRCDIR
  echo "download & check"
  wget --quiet https://github.com/libffi/libffi/releases/download/v3.4.2/libffi-3.4.2.tar.gz
  echo "540fb721619a6aba3bdeef7d940d8e9e0e6d2c193595bc243241b77ff9e93620 libffi-3.4.2.tar.gz" | sha256sum --check || exit 1
  mkdir $EDA_SRCDIR/org-libffi-libffi
  tar -C "$EDA_SRCDIR/org-libffi-libffi" --strip-components=1 -xf libffi-3.4.2.tar.gz
  rm libffi-3.4.2.tar.gz
fi
