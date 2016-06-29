#ifndef NME_LAUNCH_OPTIONS_GRABBER_H
#define NME_LAUNCH_OPTIONS_GRABBER_H

#import <UIKit/UIKit.h>


@interface LaunchOptionsGrabber : NSObject

+(void)load;
+(void)grabLaunchOptions:(NSNotification *)notification;
+(NSDictionary*)getLaunchOptions;

@end

#endif