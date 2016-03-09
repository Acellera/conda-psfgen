

#include <tcl.h>

extern int Psfgen_Init(Tcl_Interp *);

int main(int argc, char *argv[]) {
  Tcl_Main(argc, argv, Psfgen_Init);
  return 0;
}


