This github contains files to analyse the pressure response of a circuit breaker due to a localised pressure/temperature pulse.


#OpenFoam Installation

This exercise uses OpenFoam. There are 3 flavours - '.com' (2301), '.org' (v10) or 'extend'. It doesnt matter which one you use except
there are small changes to some of the files. The software is open source and can run on Windows, MacOS and linux. The instructions are as follows
.
For MacOS, install brew (https://brew.sh/ - one line install with 3 commands listed at the end) and then use 

_brew install --no-quarantine gerlero/openfoam/openfoam@2312_

(taken from https://github.com/gerlero/openfoam-app).


#Running the circuit breaker example

The validation example is a spherical pressure/temperature cloud.
