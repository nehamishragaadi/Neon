#import "NeonIos.h"
#import "ReactNativeEvents.h"


@implementation NeonIos

RCT_EXPORT_MODULE()


RCT_EXPORT_METHOD(sampleMethod:(NSString *)stringArgument numberParameter:(nonnull NSNumber *)numberArgument callback:(RCTResponseSenderBlock)callback)
{
    // TODO: Implement some actually useful functionality
	callback(@[[NSString stringWithFormat: @"numberArgument: %@ stringArgument: %@", numberArgument, stringArgument]]);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:ReactEventCloseModal object:nil];
    
}

@end
