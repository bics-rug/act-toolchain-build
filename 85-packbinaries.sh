#!/bin/bash

echo "#############################"
echo "# pack all binaries"

tar -czf async_circuit_toolkit.tar.gz README.md $(realpath --relative-to ./ $ACT_HOME)

