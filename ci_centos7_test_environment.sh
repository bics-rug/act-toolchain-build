echo "environment variables "

if [ -z $EDA_SRCDIR ]; then 
  export EDA_SRCDIR=$(pwd)/src
fi

if [ -z $ACT_HOME ]; then 
  # moving the install folder, to test if the dynamic linking works on relative pathses
  if [ -d $(pwd)/act ]; then
    mv act acttest
  fi
  export ACT_HOME=$(pwd)/acttest
fi

if [ -z $VLSI_TOOLS_SRC ]; then 
  export VLSI_TOOLS_SRC=$EDA_SRCDIR/yale-asyncvlsi-act
fi
echo "."
export PATH=${ACT_HOME}/bin:${PATH}

echo "."
export EXECDIR=$(pwd)
echo "loaded"

