#include "NMEAppDelegate+Swrve.h"
#include "SwrveAppDelegate.h"

#import <objc/runtime.h>

@implementation NMEAppDelegate (Swrve)

-(id)init {
    self = [super init];

    return self;
}

-(BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *) launchOptions
{
    NSLog(@"hit willFinishLaunchingWithOptions --- - - -- - - - - - -");
    return [[SwrveAppDelegate sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
}


@end