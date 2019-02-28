# conda-psfgen
This repo creates a conda package for the psfgen executable for Linux, OSX and Windows, compiling on travis.

The source code is taken from the NAMD git repository.

To update the source code to the latest version do:
```
cd ..
git clone https://charm.cs.illinois.edu/gerrit/namd.git
cp ./namd/psfgen/src/* ./conda-psfgen/src/
```