#import <UIKit/UIKit.h>

@interface SwrveAppDelegate : NSObject  <UIApplicationDelegate>

typedef void (^DeepLinkHandler)(NSString *url);

+ (instancetype)sharedInstance;

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

@end
