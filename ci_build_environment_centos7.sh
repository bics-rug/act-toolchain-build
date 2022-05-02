echo "environment variables "
source scl_source enable devtoolset-11
echo "devtoolset-11 active"

if [ -z $EDA_SRCDIR ]; then 
  export EDA_SRCDIR=$(pwd)/src
fi
echo "EDA_SRCDIR $EDA_SRCDIR"

if [ -z $ACT_HOME ]; then 
  export ACT_HOME=$(pwd)/act
  export PATH=${ACT_HOME}/bin:${PATH}
fi
echo "ACT_HOME $ACT_HOME"

if [ -z $LIB_HOME ]; then 
  export LIB_HOME=$(pwd)/build
fi
echo "LIB_HOME $LIB_HOME"

if [ -z $VLSI_TOOLS_SRC ]; then 
  export VLSI_TOOLS_SRC=$EDA_SRCDIR/yale-asyncvlsi-act
fi
echo "VLSI_TOOLS_SRC $VLSI_TOOLS_SRC"

export WORK_DIR=$(pwd)
echo "WORK_DIR $WORK_DIR"

export FORCE_GIT_RESET="true"

ls -la
echo "loaded"
