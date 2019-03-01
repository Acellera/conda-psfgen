# conda-psfgen
This repo creates a conda package for the psfgen executable for Linux, OSX and Windows, compiling on travis.

The source code is taken from the NAMD git repository.

To update the source code to the latest version do:
```
cd ..
git clone https://charm.cs.illinois.edu/gerrit/namd.git
cp ./namd/psfgen/src/* ./conda-psfgen/src/
```

To update the tcl libraries find the last release commit in https://github.com/tcltk/tcl/releases
```
cd ..
git clone https://github.com/tcltk/tcl.git
cd tcl
git checkout RELEASECOMMIT
cd unix
./configure --enable-shared=no --prefix $HOME/tcl/unix/build/
make
make install
./configure --enable-shared=yes --prefix $HOME/tcl/unix/build/
make
make install
```
Then copy over the libs and headers.