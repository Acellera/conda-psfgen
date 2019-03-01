if [ "$CC" == "" ] ; then CC=gcc-4.4;  fi
if [ "$CXX" == "" ]; then CXX=g++-4.4; fi

CFLAGS=""
LIBS="-ltcl"

if [ "$TRAVIS_OS_NAME" == "<UNDEFINED>" ]; then
 CC=gcc
 LIBS="-L$PREFIX/lib -ltcl"
fi

if [ "$TRAVIS_OS_NAME" == "linux" ]; then
 CFLAGS="--static -O3 -fexpensive-optimizations -ffast-math"
 LIBS="-ltcl -lpthread -ldl -lrt -lm"
fi
if [ "$CROSS_COMPILE" == "1" ]; then
 CC=x86_64-w64-mingw32-gcc
 LIBS="-Llib -ltcl86"
fi
if [ "$TRAVIS_OS_NAME" == "osx" ]; then
 LIBS="-ltcl"
fi

make "CC=$CC" "CXX=$CXX" "CFLAGS=$CFLAGS" "LIBS=$LIBS"
mkdir -p "$PREFIX/bin"
cp psfgen "$PREFIX/bin/psfgen"

if [ "$CROSS_COMPILE" == "1" ]; then
 cp lib/*dll "$PREFIX/bin"
fi

chmod +x "$PREFIX/bin/psfgen"

