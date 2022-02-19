echo "environment variables "

if [ -z $EDA_SRCDIR ]; then 
  export EDA_SRCDIR=$(pwd)/src
fi

if [ -z $ACT_HOME ]; then 
  export ACT_HOME=$(pwd)/act
fi

if [ -z $VLSI_TOOLS_SRC ]; then 
  export VLSI_TOOLS_SRC=$EDA_SRCDIR/yale-asyncvlsi-act
fi
echo "."
export LD_LIBRARY_PATH=$ACT_HOME/lib:$LD_LIBRARY_PATH
echo "."
export EXECDIR=$(pwd)
echo "loaded"
