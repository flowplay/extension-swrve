#import <UIKit/UIKit.h>

@interface SwrveAppDelegate : NSObject

typedef void (^DeepLinkHandler)(NSString *url);

+ (instancetype)sharedInstance;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

@end
