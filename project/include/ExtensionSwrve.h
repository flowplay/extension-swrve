#ifndef EXTENSION_SWRVE_H
#define EXTENSION_SWRVE_H

#import <Foundation/Foundation.h>
#include <hx/CFFI.h>

@interface ExtensionSwrve : NSObject
@end

namespace swrveExt {


	static void initSwrve(value appId, value apiKey, value userId, value appVersion );
	static void userUpdate(value jsonPayload);
	static void customEvent(value eventName, value jsonPayload);
	static void purchaseItem(value item, value currency, value cost, value quantity);
	static void currencyGiven(value currency, value amount );
	static void virtualItemPurchaseComplete(value sku, value quantity, value localCost, value localCurrency, value productId);
	static void virtualCurrencyPurchaseComplete(value currency, value quantity, value localCost, value localCurrency);

	//static NSDictionary* shitDictionaryFromJson(NSString * jsonString);

	DEFINE_PRIM(initSwrve, 4);
	DEFINE_PRIM(userUpdate, 1);
	DEFINE_PRIM(customEvent, 2);
	DEFINE_PRIM(purchaseItem, 4);
	DEFINE_PRIM(currencyGiven, 2);
	DEFINE_PRIM(virtualItemPurchaseComplete, 5);
	DEFINE_PRIM(virtualCurrencyPurchaseComplete, 4);

}


#endif