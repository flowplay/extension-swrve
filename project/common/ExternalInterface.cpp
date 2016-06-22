#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif


#include <hx/CFFI.h>
#include "Utils.h"


using namespace extension_swrve;


static value extension_swrve_init (value appId, value apiKey) {
	
	//int returnValue = init(val_int(appId), val_string(apiKey));
	return alloc_null();
	
}
DEFINE_PRIM (extension_swrve_init, 2);



extern "C" void extension_swrve_main () {
	
	val_int(0); // Fix Neko init
	
}
DEFINE_ENTRY_POINT (extension_swrve_main);



extern "C" int extension_swrve_register_prims () { return 0; }