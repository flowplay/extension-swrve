#ifndef EXTENSION_SWRVE_H
#define EXTENSION_SWRVE_H

#import <Foundation/Foundation.h>
#include <hx/CFFI.h>

@interface ExtensionSwrve : NSObject
@end

namespace swrveExt {


	static void userUpdate(value jsonPayload);
	static void customEvent(value eventName, value jsonPayload);
	static void currencyGiven(value currency, value amount );
	static void virtualItemPurchaseComplete(value sku, value currency, value cost, value quantity);
	static void iapPurchaseComplete(value quantity, value localCurrency, value localCost, value productId);

	DEFINE_PRIM(userUpdate, 1);
	DEFINE_PRIM(customEvent, 2);
	DEFINE_PRIM(currencyGiven, 2);
	DEFINE_PRIM(virtualItemPurchaseComplete, 4);
	DEFINE_PRIM(iapPurchaseComplete, 4);

}


#endif