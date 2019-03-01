if [ "$CC" == "" ] ; then CC=gcc-4.4;  fi
if [ "$CXX" == "" ]; then CXX=g++-4.4; fi

CFLAGS=""
LIBS="-ltcl8.6"

if [ "$TRAVIS_OS_NAME" == "<UNDEFINED>" ]; then
 CC=gcc
 LIBS="-L$PREFIX/lib -ltcl8.6"
fi

if [ "$TRAVIS_OS_NAME" == "linux" ]; then
 CFLAGS="--static -O3 -fexpensive-optimizations -ffast-math"
 LIBS="-ltcl8.6 -lpthread -ldl -lrt -lm"
fi
if [ "$CROSS_COMPILE" == "1" ]; then
 CC=x86_64-w64-mingw32-gcc
 LIBS="-Llib -ltcl8.6"
fi
if [ "$TRAVIS_OS_NAME" == "osx" ]; then
 LIBS="-ltcl8.6"
fi

make "TRAVIS_BUILD_DIR=$TRAVIS_BUILD_DIR" "CC=$CC" "CXX=$CXX" "CFLAGS=$CFLAGS" "LIBS=$LIBS"
mkdir -p "$PREFIX/bin"
cp psfgen "$PREFIX/bin/psfgen"

if [ "$CROSS_COMPILE" == "1" ]; then
 cp lib/*dll "$PREFIX/bin"
fi

chmod +x "$PREFIX/bin/psfgen"

