CC=gcc-4.4

which gcc-4.4
if [ "$?" != "0" ]; then 
	CC=gcc
fi


make CC=$CC
cp psfgen $PREFIX/bin

