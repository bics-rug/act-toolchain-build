# Builder for path and (almost) library independent ACT tool chain (https://github.com/asyncvlsi)

[![CircleCI](https://circleci.com/gh/bics-rug/act-toolchain-build/tree/main.svg?style=svg)](https://circleci.com/gh/bics-rug/act-toolchain-build/tree/main)

The goal of this project is to have a package ready $ACT\_HOME directory that you can drop on almost any gnu/linux OS (for the CI build any OS newer than 2013) and start working after setting 2 variables $ACT\_HOME and $PATH. A bit like the other commercial EDA tools.

The second goal is to have an easy build script collection for self compilation with of all the dependencies, apart from the build tools.

## current state:
- Only the front end QDI tools are included as of now, rest is WIP and will come.
- Out of the box the project will build only the part of the tool chain that is open source.
- To include not yet open sourced and work in progress components, specify the closed git-urls as environment variables with your login. The specific variables you can find in the scripts.
- The CI does not package its nightly builds yet, as we need to check if all OSS licenses before.

## For future features see issue section

## OS requirements:

the build scripts will take care of library dependencies, but build tool dependencies you have to take care of: 
for convenience there is a script to check if everything is available (checks are not exhaustive) `bash check_build_environment.sh`

gcc needs to support cpp11 (we check for gcc7 probably to high)

the older the build OS is the wider compatibility you should have.

CentOS7 / RHEL7 / derivatives
```
yum install -y centos-release-scl git wget
yum-config-manager --enable rhel-server-rhscl-7-rpms
yum install -y devtoolset-8 m4 autoconf automake

source scl_source enable devtoolset-8
```

RockyLinux8 / RHEL8 / derivatives / CentOS Stream (to be confirmed)
```
yum install -y 'dnf-command(config-manager)'
yum config-manager --set-enabled powertools -y
yum install -y gcc gcc-c++ diffutils make m4 autoconf automake git wget
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
