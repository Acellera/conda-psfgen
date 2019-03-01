psfgen:
	$(CC) $(CFLAGS) -o psfgen *.c -I$(TRAVIS_BUILD_DIR)/tcl/include -L$(TRAVIS_BUILD_DIR)/tcl/lib $(LIBS) -lm

clean:
	rm -f *.o psfgen
