#import "NeonIos.h"
#import "ReactNativeEvents.h"
@implementation NeonIos  

RCT_EXPORT_MODULE()


RCT_EXPORT_METHOD(sampleMethod:(NSString *)stringArgument numberParameter:(nonnull NSNumber *)numberArgument callback:(RCTResponseSenderBlock)callback)
{
    // TODO: Implement some actually useful functionality
    callback(@[[NSString stringWithFormat: @"numberArgument: %@ stringArgument: %@", numberArgument, stringArgument]]);
//
//
   //[[NSNotificationCenter defaultCenter] postNotificationName:ReactEventCloseModal object:nil];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *rootVC = UIApplication.sharedApplication.delegate.window.rootViewController;
        ViewController *controller = [[ViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
        [rootVC presentViewController:nav animated:YES completion:^{
        }];
    });
}

@end
