#ifndef NME_APP_DELEGATE_DEEPLINK_H
#define NME_APP_DELEGATE_DEEPLINK_H

#import <UIKit/UIKit.h>

@interface NMEAppDelegate : NSObject <UIApplicationDelegate>

@end


@interface NMEAppDelegate (Swrve)

-(id)init;

-(BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

@end

#endif