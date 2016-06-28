#ifndef EXTENSION_SWRVE_H
#define EXTENSION_SWRVE_H

#import <Foundation/Foundation.h>
#include <hx/CFFI.h>

@interface ExtensionSwrve : NSObject
@end

namespace swrveExt {


	static void initSwrve(value appId, value apiKey, value userId, value appVersion );

	DEFINE_PRIM(initSwrve, 4);
}


#endif