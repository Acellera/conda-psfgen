if [ "$CC" == "" ]; then CC=gcc; fi


make CC=$CC
cp psfgen "$PREFIX/bin/psfgen.bin"
echo 'DIR=$(dirname "$(which python)"); LD_LIBRARY_PATH="$DIR/../lib/compat-libc" "$DIR/psfgen.bin" $@' > "$PREFIX/bin/psfgen"
chmod +x "$PREFIX/bin/psfgen"

