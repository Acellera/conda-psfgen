if [ "$CC" == "" ] ; then CC=gcc-4.4;  fi
if [ "$CXX" == "" ]; then CXX=g++-4.4; fi

CFLAGS=""
INCLUDES=""
LIBS="-ltcl8.6"

if [ "$TRAVIS_OS_NAME" == "<UNDEFINED>" ]; then
 CC=gcc
 LIBS="-L$PREFIX/lib -ltcl8.6"
fi

if [ "$TRAVIS_OS_NAME" == "linux" ]; then
 CFLAGS="--static -O3 -fexpensive-optimizations -ffast-math"
 LIBS="-L$TRAVIS_BUILD_DIR/tcl/lib -ltcl8.6 -lpthread -ldl -lrt -lm"
 INCLUDES="-I$TRAVIS_BUILD_DIR/tcl/include"
fi
if [ "$CROSS_COMPILE" == "1" ]; then
 CC=x86_64-w64-mingw32-gcc
 LIBS="-L$HOME/miniconda/lib -Llib -ltcl86 -lm"
 INCLUDES="-I$HOME/miniconda/include"
fi
if [ "$TRAVIS_OS_NAME" == "osx" ]; then
 LIBS="-L$HOME/miniconda/lib -ltcl -lm"
 INCLUDES="-I$HOME/miniconda/include"
fi

make "CC=$CC" "CXX=$CXX" "CFLAGS=$CFLAGS" "LIBS=$LIBS" "INCLUDES=$INCLUDES"
mkdir -p "$PREFIX/bin"
cp psfgen "$PREFIX/bin/psfgen"

if [ "$CROSS_COMPILE" == "1" ]; then
 cp lib/*dll "$PREFIX/bin"
fi

chmod +x "$PREFIX/bin/psfgen"

