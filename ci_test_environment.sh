echo "environment variables "

if [ -z $EDA_SRCDIR ]; then 
  export EDA_SRCDIR=$(pwd)/src
fi
echo "EDA_SRCDIR $EDA_SRCDIR"

if [ -z $ACT_HOME ]; then 
  # moving the install folder, to test if the dynamic linking works on relative pathses
  if [ -d $(pwd)/act ]; then
    mv act acttest
  fi
  export ACT_HOME=$(pwd)/acttest
fi
echo "ACT_HOME $ACT_HOME"

if [ -z $VLSI_TOOLS_SRC ]; then 
  export VLSI_TOOLS_SRC=$EDA_SRCDIR/yale-asyncvlsi-act
fi
echo "VLSI_TOOLS_SRC $VLSI_TOOLS_SRC"

export PATH=${ACT_HOME}/bin:${PATH}
echo "PATH $PATH"

echo "LD_LIBRARY_PATH $LD_LIBRARY_PATH"

export WORK_DIR=$(pwd)
echo "WORK_DIR $WORK_DIR"
ls -la
echo "loaded"

