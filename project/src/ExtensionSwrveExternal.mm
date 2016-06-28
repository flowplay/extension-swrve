#include <hx/CFFI.h>

extern "C" {

    void extension_swrve_main() {
        val_int(0);
    }
    DEFINE_ENTRY_POINT(extension_swrve_main);

    int extension_swrve_register_prims(){return 0;}
}