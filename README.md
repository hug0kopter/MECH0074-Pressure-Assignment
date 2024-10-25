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

There is a slight difference between openFOAM2301 and OpenFOAMv12. The first is that the controlDict requires the _writeControl_ and _adjustableTime_ statements to be changed. In the sphereToCell _centre_ needs to be defined. Apparently rhoCentralFoam is not supported (though it exists in OpenFOAMv12) and replaced by _shockFluid_.

# OpenFoam Philosophy

All CFD consists of 3 parts - (i) generating the mesh, (ii) running the code and (iii) diagnostics and interpretation.

Mesh generation can occur in a number of ways. These two examples illustrate two approaches - (a) generating a structured mesh and (b) unstructured mesh with complex geometry.

To generate


# Running the circuit breaker example

The validation example is a spherical pressure/temperature cloud.

For the validation case, I have set up an Allrun commmad (use .Allrun) that will generate the mesh, setFields, decompose and run. The commands are 

_blockMesh ; cp -R 0.orig 0 ; setFields ;  decomposePar_

Here the blockMesh command looks up the blockMeshDict file (in systems) and creates a very basic cube (uniform) mesh. The initial conditions may overwrite the initial data, we copy the 0.orig to 0.
The intialisation is performed with setFields, which look up the setFieldsDict where the initial values for temperature and pressure are set. To speed up 


# Running the validation exercise

I have put a processing file in the functions directory. This will automatically load in the data from pressure, temperature and velocity recorded along a path and collate the information.

