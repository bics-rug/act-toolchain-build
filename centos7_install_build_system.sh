#!/bin/bash
yum install -y centos-release-scl git wget
yum-config-manager --enable rhel-server-rhscl-7-rpms
echo "repo setup"
echo "yum install -y devtoolset-11 m4 autoconf automake bison flex libtool python3 csh patch | cat" | bash
echo "install done"
