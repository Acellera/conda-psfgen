if [ "$CC" == "" ] ; then CC=gcc-4.4;  fi
if [ "$CXX" == "" ]; then CXX=g++-4.4; fi

CFLAGS=""

if [ "$TRAVIS_OS_NAME" == "linux" ]; then
 CFLAGS="--static"
fi

make "CC=$CC" "CXX=$CXX" "CFLAGS=$CFLAGS"
mkdir -p "$PREFIX/bin"
cp psfgen "$PREFIX/bin/psfgen"
#echo 'DIR=$(dirname "$(which python)"); LD_LIBRARY_PATH="$DIR/../lib/compat-libc" "$DIR/psfgen.bin" $@' > "$PREFIX/bin/psfgen"
chmod +x "$PREFIX/bin/psfgen"

