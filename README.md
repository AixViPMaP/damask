damask (Docker image)
=====================

[DAMASK](http://damask.mpie.de/) [Docker](http://www.docker.com/) images for [HTCondor](http://research.cs.wisc.edu/htcondor/).

damask
------

    docker build -t damask:latest -t damask:2.0.1 -f Dockerfile .

damask-vtk
----------

    docker build -t damask-vtk:latest -t damask-vtk:2.0.1 -f Dockerfile.damask-vtk .
