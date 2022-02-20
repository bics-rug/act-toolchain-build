lookup_binary () {
  command -v $1 || (echo "missing $1" && exit 1)
  echo "found $1"
  ldd_out=$(ldd $(command -v $1))
  if [[ ldd_out == *"not found"* || ldd_out == *"missing"* || ldd_out == *"No such file"* || ldd_out == *"not a dynamic executable"* ]]; then
    echo "missing shared library: $ldd_out"
    exit 1
  fi
  #echo "Debug: $ldd_out"
}

lookup_shared_library () {
  if [ ! -f $ACT_HOME/lib/$1 ]; then
    echo "missing $1"
    exit 1
  fi
  echo "found $1"
  ldd_out=$(ldd $ACT_HOME/lib/$1)
  if [[ ldd_out == *"not found"* || ldd_out == *"missing"* || ldd_out == *"No such file"* || ldd_out == *"not a dynamic executable"* ]]; then
    echo "missing shared library: $ldd_out"
    exit 1
  fi
  #echo "Debug: $ldd_out"
}
