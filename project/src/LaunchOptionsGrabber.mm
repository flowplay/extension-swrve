#include "LaunchOptionsGrabber.h"

#import <objc/runtime.h>

static NSDictionary *_launchOptions = nil;

@implementation LaunchOptionsGrabber

+ (void)load
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(grabLaunchOptions:)
               name:@"UIApplicationDidFinishLaunchingNotification" object:nil];

}

+ (void)grabLaunchOptions:(NSNotification *)notification
{
    _launchOptions = [notification userInfo] ;
}

+(NSDictionary*) getLaunchOptions
{
    NSLog(@"getLaunchOptions called*********!!!!!!!!!!");
    NSLog( @"launchoptions = %@", _launchOptions );
    return _launchOptions;
}

@end