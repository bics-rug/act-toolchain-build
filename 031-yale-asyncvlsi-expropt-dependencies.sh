#!/bin/bash

# this file builds
# - readline
# - tcl
# - libffi
# - ABC
# - yosys

echo "#############################"
echo "# expropt dependencies"
echo "# libreadline"
cd $EDA_SRCDIR/readline
cp COPYING $ACT_HOME/license/LICENSE_readline
./configure --prefix=$ACT_HOME
make -j || exit 1
make install || exit 1

echo "#############################"
echo "# tcl"
cd $EDA_SRCDIR/org-tcltk-tcl
cp license.terms $ACT_HOME/license/LICENSE_org-tcltk-tcl
cd unix
./configure --prefix=$ACT_HOME
make -j || exit 1
make install || exit 1
if [ ! -f $ACT_HOME/bin/tclsh ]; then
  ln -s $ACT_HOME/bin/tclsh* $ACT_HOME/bin/tclsh
fi

echo "#############################"
echo "# libffi"
cd $EDA_SRCDIR/org-libffi-libffi
cp LICENSE $ACT_HOME/license/LICENSE_org-libffi-libffi
./configure --prefix=$ACT_HOME
sed -i 's/\/..\/lib64//' Makefile
cd x86*
sed -i 's/\/..\/lib64//' Makefile
cd $EDA_SRCDIR/org-libffi-libffi
make -j || exit 1
make install || exit 1

echo "#############################"
echo "# ABC"

cd $EDA_SRCDIR/berkeley-berkeley-abc-abc

cp copyright.txt $ACT_HOME/license/LICENSE_berkeley-abc

mv $EDA_SRCDIR/berkeley-berkeley-abc-abc/Makefile $EDA_SRCDIR/berkeley-berkeley-abc-abc/Makefile.original
echo "LIBS += -lncurses" > $EDA_SRCDIR/berkeley-berkeley-abc-abc/Makefile
echo "CFLAGS += -I${ACT_HOME}/include -L${ACT_HOME}/lib" >> $EDA_SRCDIR/berkeley-berkeley-abc-abc/Makefile
echo "LDFLAGS += -L${ACT_HOME}/lib -Wl,-rpath=\\$\$ORIGIN/../lib,-rpath=$ACT_HOME/lib" >> $EDA_SRCDIR/berkeley-berkeley-abc-abc/Makefile
cat $EDA_SRCDIR/berkeley-berkeley-abc-abc/Makefile.original >> $EDA_SRCDIR/berkeley-berkeley-abc-abc/Makefile
make ABC_USE_LIBSTDCXX=1 -j || exit 1
# so build broken but probably not used
#make -j ABC_USE_PIC=1 libabc.so || exit 1
make -j ABC_USE_LIBSTDCXX=1  libabc.a || exit 1
mv abc $ACT_HOME/bin/
mv libabc.* $ACT_HOME/lib/

echo "####################"
echo "# yosys"

cd $EDA_SRCDIR/org-yosyshq-yosys

echo "CONFIG := gcc" > Makefile.conf
echo "PREFIX := $ACT_HOME" >> Makefile.conf
echo "LDLIBS += -lncurses" >> Makefile.conf
echo "ABCEXTERNAL := abc" >> Makefile.conf
echo "CXXFLAGS += -I${ACT_HOME}/include -L${ACT_HOME}/lib" >> Makefile.conf
echo "LDFLAGS += -L${ACT_HOME}/lib -Wl,-rpath=\\$\$ORIGIN/../lib,-rpath=$ACT_HOME/lib" >> Makefile.conf
make -j2 || exit 1
make install || exit 1
cp COPYING $ACT_HOME/license/LICENSE_org-yosyshq-yosys

