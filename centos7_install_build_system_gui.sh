#!/bin/bash
# graphic libraries are not shipped in the package
export BUILD_GUI="true"
echo "yum install -y libX11-devel mesa-libGL-devel mesa-libGLU-devel | cat" | bash
