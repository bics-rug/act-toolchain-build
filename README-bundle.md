# ACT tool chain (https://github.com/asyncvlsi), as a drop in binary package with out filesystem path dependence and without library dependencies (almost no)

it was verified to be working out of the box on the following systems:
 - CentOS/RHEL/Oracle Linux 7.2+
 - RHEL/RockyLinux/AlmaLinux/Orecle Linux 8
 - Debian 9/10/11
 - Ubuntu 16.04/18.04/20.04/22.04
 - OpenSUSE 15
 - ArchLinux
 - Fedora 20/latest

should also work on other systems with kernel 3.10+ (libc version) and GNU linker ld or compatible, like BSD OSes (but not tested).

## install

just set in your shell (this is for bash, setenv works eqiv.)
```
export ACT_HOME=<path to extracted folder>
export PATH=${ACT_HOME}/bin:${PATH}
```
or execute in the folder you extracted the tar in, so the folder that than has a single new folder called act after extraction!
```
export ACT_HOME=$(pwd)/act
export PATH=${ACT_HOME}/bin:${PATH}
```

and start working with it!

the async memory compiler you can find in $ACT_HOME/amc

## bugs or problems:

please file bugs at https://github.com/bics-rug/act-toolchain-build

## documentation:

have a peek at the ACT online docs at https://avlsi.csl.yale.edu/act

## included tools:

 - interact
 - act (act2v, adepend, aflat, atrace, ext2sp, pgen, prs2cells, prs2net, prs2sim, prsim, prspack, sv2act, act2v, techgen, test\_inlinepass, test\_statepass, tlint, tr2alint, v2act)
 - chp2prs
 - dflowmap
 - async memory compiler
 - prs2fpga
 - lefdef
 - expropt (incl yosys and abc)
 - pwroute
 - triton route
 - sproute
 - phyDB
 - rect2lef
 - actsim (without xyce)

## tools to come

 - xyce (with MPI)
 - verilog AMS support for xyce
 - magic
 - irsim
 - dali
 - BiPart ?


# licenses

please find all the tool licenses in the license folder