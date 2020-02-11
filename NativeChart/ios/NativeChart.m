#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(NativeChart, RCTViewManager)

RCT_CUSTOM_VIEW_PROPERTY(data, NSArray, NativeChart)
{
    for (id num in json) {
        NSLog(@"%@\n", num);
    }
}

@end
