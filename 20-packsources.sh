#!/bin/bash

echo "#############################"
echo "# pack all sources"
for directory in $EDA_SRCDIR/*; do rm -rf $directory/.git; done
tar --exclude-vcs -czf async_circuit_toolkit_sources.tar.gz *.sh README.md $(realpath --relative-to ./ $EDA_SRCDIR)
