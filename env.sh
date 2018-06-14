export DAMASK_ROOT=/opt/damask
export PATH=/opt/damask/bin:/opt/petsc/bin:$PATH
export PYTHONPATH=/opt/damask/lib:$PYTHONPATH

ulimit -s unlimited 2>/dev/null  # Maximum stack size
ulimit -d unlimited 2>/dev/null  # Maximum heap size
ulimit -v unlimited 2>/dev/null  # Maximum virtual memory size
ulimit -m unlimited 2>/dev/null  # Maximum physical memory size
ulimit -c 0         2>/dev/null  # Maximum core file size
