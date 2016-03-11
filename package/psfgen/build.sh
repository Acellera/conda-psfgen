if [ "$CC" == "" ]; then CC=gcc; fi


make CC=$CC
cp psfgen $PREFIX/bin

