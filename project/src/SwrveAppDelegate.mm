#import "SwrveAppDelegate.h"
#import "Swrve.h"
#import <objc/runtime.h>

@implementation SwrveAppDelegate {
   NSURL* lastURL;
   DeepLinkHandler _handler;
}

+ (instancetype)sharedInstance
{
  static SwrveAppDelegate *_sharedInstance;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _sharedInstance = [[self alloc] _init];
  });
  return _sharedInstance;
}

- (instancetype)_init
{
  return self;
}

- (instancetype)init
{
  return nil;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"swrve: DeepLinkApplicationDelegate application  ******************************************");
        NSLog(@"buildNumber: ::APP_BUILD_NUMBER::");
        NSLog(@"appId: ::config.swrve.appId::");
        NSLog(@"buildNumber: ::config.swrve.apiKey::");

        NSString *appVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
        NSLog(@"CFBundleVersion = %@", appVersion);

        int appId = [[[NSBundle mainBundle] objectForInfoDictionaryKey:@"swrve.appId"] intValue];
        NSLog(@"appId fuck you ios = %d", appId);

        //NSString *appId = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"swrve.appId"];
        //NSLog(@"appId = %@", appId);

        NSString *apiKey = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"swrve.apiKey"];
        NSLog(@"apiKey = %@", apiKey);



        SwrveConfig* config = [[SwrveConfig alloc] init];
        config.pushEnabled = YES;
        // puting a fake event name here so that the native permission dialog doesn't come up, it is triggered by a swrve conversation
        config.pushNotificationEvents = [[NSSet alloc] initWithArray:@[@"ihateobjc"]];
        config.appVersion = appVersion;
        [Swrve sharedInstanceWithAppID: appId
                        apiKey:apiKey
                        config:config
                        launchOptions:launchOptions];


        return YES;
}

@end