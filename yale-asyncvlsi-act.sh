#!/bin/bash

echo "#############################"
echo "# act"

if [ ! -d $VLSI_TOOLS_SRC ]; then
cd $EDA_SRCDIR
  git clone https://github.com/asyncvlsi/act.git
  mv act $VLSI_TOOLS_SRC
fi
cd $VLSI_TOOLS_SRC
git reset --hard && git checkout master && git pull

#build system patches for using external includes

#put in additional compiler flags
sed -i 's/c_compiler_flags=-O2/c_compiler_flags="\\"-O2 -I${ACT_HOME}\/include -L${ACT_HOME}\/lib\\""/' configure
sed -i 's/sh_link="\\"-shared -Wl,-x,-rpath=$ACT_HOME\/lib\\""/sh_link="\\"-shared -Wl,-x,-rpath=\\\\\\$\\$ACT_HOME\/lib,-rpath=\\\\\\$\\$ORIGIN\/..\/lib\\""/' configure
sed -i 's/sh_exe_options="\\"-Wl,-rpath=$ACT_HOME\/lib\\""/sh_exe_options="\\"-Wl,-rpath=\\\\\\$\\$ACT_HOME\/lib,-rpath=\\\\\$\\$ORIGIN\/..\/lib\\""/' configure
# make the check script use the compiler flags
sed -i 's/if ! $C_COMPILER_NAME -c __tst1.c  >\/dev\/null 2>\&1/if ! $C_COMPILER_NAME $C_COMPILER_FLAGS -c __tst1.c  #>\/dev\/null 2>\&1/' scripts/check
sed -i 's/if ! $C_COMPILER_NAME __tst1.o -lz >\/dev\/null 2>\&1/if ! $C_COMPILER_NAME $C_COMPILER_FLAGS __tst1.o -lz #>\/dev\/null 2>\&1/' scripts/check
# make the makefile remove the parantesis because sh vars and make vars treat parentisis incompatible
sed -i 's/CFLAGS=$(C_COMPILER_FLAGS)/CFLAGS=$(subst ",,$(C_COMPILER_FLAGS))/' scripts/Makefile.std

./configure $ACT_HOME || exit 1
make realclean 2> /dev/null
./build || exit 1
make install || exit 1

