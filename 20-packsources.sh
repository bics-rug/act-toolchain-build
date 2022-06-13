#!/bin/bash

echo "#############################"
echo "# pack all sources"
for directory in $EDA_SRCDIR/*; do rm -rf $directory/.git; done
# llvm is prebuid and all buildfiles need to be exlcuded
tar --exclude-vcs --exclude="$(realpath --relative-to ./ $EDA_SRCDIR/org-llvm-llvm-project/build)" -czf async_circuit_toolkit_sources.tar.gz *.sh README.md $(realpath --relative-to ./ $EDA_SRCDIR)
