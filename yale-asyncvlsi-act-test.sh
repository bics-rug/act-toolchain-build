#!/bin/bash

echo "#############################"
echo "# act test binaries"

source test_helper.sh

lookup_binary "act2v"
lookup_binary "act-test"
lookup_binary "adepend"
lookup_binary "aflat"
lookup_binary "atrace"
lookup_binary "ext2sp"
lookup_binary "pgen"
lookup_binary "prs2cells"
lookup_binary "prs2net"
lookup_binary "prs2sim"
lookup_binary "prsim"
lookup_binary "prspack"
lookup_binary "sv2act"
lookup_binary "act2v"
lookup_binary "techgen"
lookup_binary "test_inlinepass"
lookup_binary "test_statepass"
lookup_binary "tlint"
lookup_binary "tr2alint"
lookup_binary "v2act"

lookup_shared_library "libactpass_sh.so"
lookup_shared_library "libvlsilib_sh.so"
lookup_shared_library "libact_sh.so"


echo "#############################"
echo "# act testsuit"

cd $VLSI_TOOLS_SRC
sed -i 's/ACT=..\/act-test.$EXT/ACT=act-test/' act/test/validate_subdir.sh
sed -i 's/ACT=..\/act-test.$EXT/ACT=act-test/' act/test/run_subdir_vg.sh
sed -i 's/ACT=..\/act-test.$EXT/ACT=act-test/' act/test/run_subdir.sh

sed -i 's/ACT=..\/act-test.$EXT/ACT=act-test/' act/test/print/validate.sh
sed -i 's/ACT=..\/act-test.$EXT/ACT=act-test/' act/test/print/run_vg.sh
sed -i 's/ACT=..\/act-test.$EXT/ACT=act-test/' act/test/print/run.sh

sed -i 's/ACTTOOL=..\/v2act.$EXT/ACTTOOL=v2act/' transform/v2act/test/run.sh
sed -i 's/ACTTOOL=..\/v2act.$EXT/ACTTOOL=v2act/' transform/v2act/test/run_vg.sh
sed -i 's/ACTTOOL=..\/v2act.$EXT/ACTTOOL=v2act/' transform/v2act/test/validate.sh

sed -i 's/ACTTOOL=..\/test_inlinepass.$EXT/ACTTOOL=test_inlinepass/' transform/testing/inline/test/run.sh
sed -i 's/ACTTOOL=..\/test_inlinepass.$EXT/ACTTOOL=test_inlinepass/' transform/testing/inline/test/run_vg.sh
sed -i 's/ACTTOOL=..\/test_inlinepass.$EXT/ACTTOOL=test_inlinepass/' transform/testing/inline/test/validate.sh

sed -i 's/ACTTOOL=..\/test_statepass.$EXT/ACTTOOL=test_statepass/' transform/testing/state/test/run.sh
sed -i 's/ACTTOOL=..\/test_statepass.$EXT/ACTTOOL=test_statepass/' transform/testing/state/test/run_vg.sh
sed -i 's/ACTTOOL=..\/test_statepass.$EXT/ACTTOOL=test_statepass/' transform/testing/state/test/validate.sh
sed -i 's/ACTTOOL=..\/test_statepass.$EXT/ACTTOOL=test_statepass/' transform/testing/state/test/view.sh

sed -i 's/ACTTOOL=..\/prs2sim.$EXT/ACTTOOL=prs2sim/' transform/prs2sim/test/run.sh
sed -i 's/ACTTOOL=..\/prs2sim.$EXT/ACTTOOL=prs2sim/' transform/prs2sim/test/run_vg.sh
sed -i 's/ACTTOOL=..\/prs2sim.$EXT/ACTTOOL=prs2sim/' transform/prs2sim/test/validate.sh

sed -i 's/ACTTOOL=..\/prs2net.$EXT/ACTTOOL=prs2net/' transform/prs2net/test/run.sh
sed -i 's/ACTTOOL=..\/prs2net.$EXT/ACTTOOL=prs2net/' transform/prs2net/test/run_vg.sh
sed -i 's/ACTTOOL=..\/prs2net.$EXT/ACTTOOL=prs2net/' transform/prs2net/test/validate.sh

sed -i 's/ACTTOOL=..\/prs2cells.$EXT/ACTTOOL=prs2cells/' transform/prs2cells/test/run.sh
sed -i 's/ACTTOOL=..\/prs2cells.$EXT/ACTTOOL=prs2cells/' transform/prs2cells/test/run_vg.sh
sed -i 's/ACTTOOL=..\/prs2cells.$EXT/ACTTOOL=prs2cells/' transform/prs2cells/test/validate.sh

sed -i 's/ACTTOOL=..\/ext2sp.$EXT/ACTTOOL=ext2sp/' transform/ext2sp/test/run.sh
sed -i 's/ACTTOOL=..\/ext2sp.$EXT/ACTTOOL=ext2sp/' transform/ext2sp/test/run_vg.sh
sed -i 's/ACTTOOL=..\/ext2sp.$EXT/ACTTOOL=ext2sp/' transform/ext2sp/test/validate.sh

sed -i 's/ACTTOOL=..\/aflat.$EXT/ACTTOOL=aflat/' transform/aflat/test/run.sh
sed -i 's/ACTTOOL=..\/aflat.$EXT/ACTTOOL=aflat/' transform/aflat/test/run_vg.sh
sed -i 's/ACTTOOL=..\/aflat.$EXT/ACTTOOL=aflat/' transform/aflat/test/validate.sh

sed -i 's/ACTTOOL=..\/act2v.$EXT/ACTTOOL=act2v/' transform/act2v/test/run.sh
sed -i 's/ACTTOOL=..\/act2v.$EXT/ACTTOOL=act2v/' transform/act2v/test/run_vg.sh
sed -i 's/ACTTOOL=..\/act2v.$EXT/ACTTOOL=act2v/' transform/act2v/test/validate.sh

make runtest || exit 1

