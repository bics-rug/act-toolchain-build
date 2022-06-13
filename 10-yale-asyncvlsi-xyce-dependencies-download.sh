#!/bin/bash

echo "#############################"
echo "#openBLAS"
if [ ! -d "$EDA_SRCDIR/org-xianyi-openblas" ]; then
  cd $EDA_SRCDIR
  git clone --depth 1 --branch v0.3.20 https://github.com/xianyi/OpenBLAS.git
  mv OpenBLAS $EDA_SRCDIR/org-xianyi-openblas
fi

echo "#############################"
echo "# adms"
if [ ! -d "$EDA_SRCDIR/org-qucs-adms" ]; then
  cd $EDA_SRCDIR
  git clone --depth 1 --branch master https://github.com/Qucs/ADMS.git
  mv ADMS $EDA_SRCDIR/org-qucs-adms
fi

echo "#############################"
echo "# suitesparse"

if [ ! -d "$EDA_SRCDIR/tamu-drtimothyaldendavis-suitesparse" ]; then
cd $EDA_SRCDIR
 git clone --depth 1 --branch master https://github.com/DrTimothyAldenDavis/SuiteSparse.git
 mv SuiteSparse "$EDA_SRCDIR/tamu-drtimothyaldendavis-suitesparse"
fi

echo "#############################"
echo "#FFTW"
if [ ! -d "$EDA_SRCDIR/mit-fftw-fftw" ]; then
  cd $EDA_SRCDIR
  echo "download & check"
  wget --quiet http://www.fftw.org/fftw-3.3.10.tar.gz
  echo "8ccbf6a5ea78a16dbc3e1306e234cc5c fftw-3.3.10.tar.gz" | md5sum --check || exit 1
  mkdir $EDA_SRCDIR/mit-fftw-fftw
  tar -C "$EDA_SRCDIR/mit-fftw-fftw" --strip-components=1 -xf fftw-3.3.10.tar.gz
  rm fftw-3.3.10.tar.gz
fi

#echo "#############################"
#echo "#openmpi"
#if [ ! -d "$EDA_SRCDIR/openmpi" ]; then
#  cd $EDA_SRCDIR
#  echo "download & check"
#  wget --quiet https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.3.tar.gz
#  echo "9c0fd1f78fc90ca9b69ae4ab704687d5544220005ccd7678bf58cc13135e67e0 openmpi-4.1.3.tar.gz" | sha256sum --check || exit 1
#  mkdir $EDA_SRCDIR/openmpi
#  tar -C "$EDA_SRCDIR/openmpi" --strip-components=1 -xf openmpi-4.1.3.tar.gz
#  rm openmpi-4.1.3.tar.gz
#fi

echo "#############################"
echo "#trilinos"
if [ ! -d "$EDA_SRCDIR/sandia-trilinos-trilinos" ]; then
  cd $EDA_SRCDIR
  git clone --depth 1 --branch trilinos-release-12-12-1 https://github.com/trilinos/Trilinos.git
  mv Trilinos $EDA_SRCDIR/sandia-trilinos-trilinos
fi


