#!/bin/bash

echo "#############################"
echo "# testing chp2prs"

cd $EDA_SRCDIR/yale-asyncvlsi-chp2prs

sed -i 's/ACTTOOL=..\/..\/chp2prs.$EXT/ACTTOOL=chp2prs/' test/run_expr.sh
sed -i 's/ACTTOOL=..\/..\/chp2prs.$EXT/ACTTOOL=chp2prs/' test/run_expr_qdiopt.sh
sed -i 's/ACTTOOL=..\/..\/chp2prs.$EXT/ACTTOOL=chp2prs/' test/run_expr_bdopt.sh
sed -i 's/.\/run_expr.sh/.\/run_expr.sh || exit 1/' test/run.sh
sed -i 's/.\/run_expr_qdiopt.sh yosys/.\/run_expr_qdiopt.sh yosys || exit 1/' test/run.sh
sed -i 's/.\/run_expr_bdopt.sh yosys/.\/run_expr_bdopt.sh yosys || exit 1/' test/run.sh
sed -i 's/.\/run_expr_qdiopt.sh genus/.\/run_expr_qdiopt.sh yosys || exit 1/' test/run.sh
sed -i 's/.\/run_expr_bdopt.sh genus/.\/run_expr_bdopt.sh yosys || exit 1/' test/run.sh

make runtest || exit 1

