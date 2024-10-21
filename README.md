This github contains files to analyse the pressure response of a circuit breaker due to a localised pressure/temperature pulse.


# OpenFoam Installation

This exercise uses OpenFoam. There are 3 flavours - '.com' (2301), '.org' (v10) or 'extend'. It doesnt matter which one you use except
there are small changes to some of the files. The software is open source and can run on Windows, MacOS and linux. The instructions are as follows
.
For MacOS, install brew (https://brew.sh/ - one line install with 3 commands listed at the end) and then use 

_brew install --no-quarantine gerlero/openfoam/openfoam@2312_

(taken from https://github.com/gerlero/openfoam-app). This installs OpenFoam2312.

For Windows, OpenFoam should be installed in an Ubuntu app. The instructions are listed at

_https://openfoam.org/download/windows/_

This first requires installation of Windows Subsystem for Linux (WSL).  Once Ubuntu is installed, openfoam is installed - in this case it is OpenFoamv12. When you use the subsystem, try to connect to the windows file system using _cd /mnt/c/Desktop_

Separate to all of this, you need to install Paraview - but install as an app or application rather than through the linux or terminal. https://www.paraview.org/

There is quite a lot of information on youtube about running openfoam, but I will give you a basic introduction.

# OpenFoam Philosophy

All CFD consists of 3 parts - (i) 


# Running the circuit breaker example

The validation example is a spherical pressure/temperature cloud.
