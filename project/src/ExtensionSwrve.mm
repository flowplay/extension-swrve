#include "ExtensionSwrve.h"
#import "LaunchOptionsGrabber.h"
#import "Swrve.h"

@implementation ExtensionSwrve : NSObject
@end

namespace swrveExt {

    static void initSwrve(value appId, value apiKey, value userId, value appVersion ){

        SwrveConfig* config = [[SwrveConfig alloc] init];
        config.userId = [NSString stringWithUTF8String:val_string(userId)];
        config.appVersion = [NSString stringWithUTF8String:val_string(appVersion)];

        NSDictionary* options = [LaunchOptionsGrabber getLaunchOptions];

        [Swrve sharedInstanceWithAppID:val_int(appId)
                        apiKey:[NSString stringWithUTF8String:val_string(apiKey)]
                        config:config
                        launchOptions:options];

    }

   static void userUpdate(value jsonPayload) {
        // convert jsonPayload to NSDictionary
        // this should be in a helper method but I can't figure out how to call it. see dictionaryFromJson below
        NSData * jsonData = [[NSString stringWithUTF8String:val_string(jsonPayload)] dataUsingEncoding:NSUTF8StringEncoding];
        NSError * error=nil;
        NSDictionary * parsedData = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
        [[Swrve sharedInstance] userUpdate: parsedData ];
   }

    static void customEvent(value eventName, value jsonPayload) {
        NSLog(@"swrve custom event" );
        //NSLog(@"swrve custom event %@ - %@",eventName, jsonPayload);

        NSData * jsonData = [[NSString stringWithUTF8String:val_string(jsonPayload)] dataUsingEncoding:NSUTF8StringEncoding];
        NSError * error=nil;
        NSDictionary * parsedData = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];

        [[Swrve sharedInstance] event: [NSString stringWithUTF8String:val_string(eventName)]
                        payload: parsedData];
    }

    static void purchaseItem(value item, value currency, value cost, value quantity) {

        [[Swrve sharedInstance] purchaseItem:[NSString stringWithUTF8String:val_string(item)]
                                currency: [NSString stringWithUTF8String:val_string(currency)]
                                cost: val_int(cost)
                                quantity: val_int(quantity)];
    }

    static void currencyGiven(value currency, value amount ) {
        [[Swrve sharedInstance] currencyGiven: [NSString stringWithUTF8String:val_string(currency)]
                                givenAmount: val_int(amount)];
    }

    static void virtualItemPurchaseComplete(value sku, value quantity, value localCost, value localCurrency, value productId) {
        SwrveIAPRewards* rewards = [[SwrveIAPRewards alloc] init];
        [rewards addItem: [NSString stringWithUTF8String:val_string(sku)] withQuantity: val_int(quantity)];
        // Send the IAP event to Swrve. Won’t be validated in our servers.
        [[Swrve sharedInstance] unvalidatedIap:rewards
                                localCost: val_int(localCost)
                                localCurrency: [NSString stringWithUTF8String:val_string(localCurrency)] //@"USD"
                                productId: [NSString stringWithUTF8String:val_string(productId)]
                                productIdQuantity: val_int(quantity)];
    }

    static void virtualCurrencyPurchaseComplete(value currency, value quantity, value localCost, value localCurrency) {
        SwrveIAPRewards* rewards = [[SwrveIAPRewards alloc] init];
        [rewards addCurrency:[NSString stringWithUTF8String:val_string(currency)] withAmount: val_int(quantity)];
        // Send the IAP event to Swrve. Won’t be validated in our servers.
        [[Swrve sharedInstance] unvalidatedIap:rewards
                                localCost: val_int(localCost)
                                localCurrency: [NSString stringWithUTF8String:val_string(localCurrency)] //@"USD"
                                productId: [NSString stringWithUTF8String:val_string(currency)]
                                productIdQuantity: val_int(quantity)];
    }

    /*static NSDictionary* dictionaryFromJson(NSString * jsonString) {
        NSData * jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSError * error=nil;
        NSDictionary * parsedData = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
        NSLog(@"swrve convert json %@ - %@", jsonString, parsedData);
        return parsedData;
    }*/


}