# Builder for ACT tool chain (https://github.com/asyncvlsi)

that builds a drop in binary package with out filesystem path dependence and without library dependencies (almost no)

[![CircleCI](https://circleci.com/gh/bics-rug/act-toolchain-build/tree/main.svg?style=svg)](https://circleci.com/gh/bics-rug/act-toolchain-build/tree/main)

# Download nightly builds:
https://unishare.nl/index.php/s/Fnsgyy6CaEe2Zgi

# build scripts
when build on centos 7.2 as in the CI, it works out of the box on (verified by CI):
 - CentOS/RHEL/Oracle Linux 7.2+
 - RHEL/RockyLinux/AlmaLinux/Orecle Linux 8
 - Debian 9/10/11
 - Ubuntu 16.04/18.04/20.04/22.04
 - OpenSUSE 15
 - ArchLinux
 - Fedora 20/latest

should also work on other systems with kernel 3.10+ (libc version) and GNU linker ld or compatible, like BSD OSes (but not tested).

The goal of this project is to have a package ready $ACT\_HOME directory that you can drop on almost any gnu/linux OS (for the CI build any OS newer than 2013) and start working after setting 2 variables $ACT\_HOME and $PATH. A bit like the other commercial EDA tools.

The second goal is to have an easy build script collection for self compilation with of all the dependencies, apart from the build tools.

## current state:
- Out of the box the project will build only the part of the tool chain that is open source.
- To include not yet open sourced and work in progress components, specify the closed git-urls as environment variables with your login. The specific variables you can find in the scripts.

## For future features see issue section

## OS requirements:

the build scripts will take care of library dependencies, but build tool dependencies you have to take care of: 
for convenience there is a script to check if everything is available (checks are not exhaustive) `bash check_build_environment.sh`

gcc needs to support cpp11 (we check for gcc9)

the older the build OS is the wider compatibility you should have.

on most OSes you need to update and compile Cmake as we require version 3.16+ (just run 05-centos7-buildenv-cmake.sh as root, @todo make rootless version)

CentOS7 / RHEL7 / derivatives
```
yum install -y centos-release-scl git wget
yum-config-manager --enable rhel-server-rhscl-7-rpms
yum install -y devtoolset-11 m4 autoconf automake flex bison libtool

source scl_source enable devtoolset-11
```

RockyLinux8 / RHEL8 / derivatives / CentOS Stream (to be confirmed)
```
yum install -y 'dnf-command(config-manager)'
yum config-manager --set-enabled powertools -y
yum install -y gcc gcc-c++ diffutils make m4 autoconf automake git wget flex bison libtool
```

Debian / Ubuntu
```
apt-get -q update -y
apt-get -q install -y m4 build-essential autoconf automake git wget
```
## Run the build

### Be aware all changes you do to the sources downloaded by this build script, will be purged on a rerun of the script

if you run manual and not in a CI environment, start the build with `act_toolchain_build.sh`

you might want to setup your src and setup locations with before:
```
# this is the default:
export EDA_SRCDIR=$(pwd)/src
export ACT_HOME=$(pwd)/act
export VLSI_TOOLS_SRC=${EDA_SRCDIR}/yale-asyncvlsi-act
export PATH=${ACT_HOME}/bin:${PATH}
```

the CI build sequence you can find in `.circleci/config.yaml`
