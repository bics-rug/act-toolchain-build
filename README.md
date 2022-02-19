# buider for path and (almost) library independent act tool chain

[![CircleCI](https://circleci.com/gh/bics-rug/act-toolchain-build-oss/tree/main.svg?style=svg)](https://circleci.com/gh/bics-rug/act-toolchain-build-oss/tree/main)

the goal is to have a package ready $ACT\_HOME directory that you can drop on almost any gnu/linux OS (for the CI build any os newer than 2013) and start working after setting 2 variables $ACT\_HOME and $PATH. A bit like the other commertial EDA tools.

the second goal is to have an easy build script collection for self compilation if are worry of all the dependencies. 

## current state:
- only the Front End QDI tools are included, rest is WIP and will come
- out of the box it will build only the part of the toolcain that is open source.
- to include not yet open sourced and work in progress components, specify the closed git-urls as environment variales with your username. the specific variables you can find in the scripts.
- the CI does not package its nightly buids yet, as we need to check if all OSS license are adheared before distribution.
- pathes need to be upstreamed

## for future features see issue section

## OS requirements:

the build scripts will take care of library dependencies, but buid tool dependencies you have to take care of: 
for convinience there is a script to check if everything is availible (checks are not exaustive) `bash check_build_environment.sh`

gcc needs to support cpp11 (we check for gcc7 probably to high)

the older the build OS is the wider compatibility you should have.

eg CentOS7 / RHEL7 / derivates
```
yum install -y centos-release-scl git wget
yum-config-manager --enable rhel-server-rhscl-7-rpms
yum install -y devtoolset-8 m4 autoconf automake

source scl_source enable devtoolset-8
```

RockyLinux8 / RHEL8 / derivates / CentOS Stream (to be confirmed)
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
## run the build

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
