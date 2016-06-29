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

        NSLog(@"initalize swrve from the deep recesses of objc hell");

        [Swrve sharedInstanceWithAppID:val_int(appId)
                        apiKey:[NSString stringWithUTF8String:val_string(apiKey)]
                        config:config
                        launchOptions:options];

    }



}