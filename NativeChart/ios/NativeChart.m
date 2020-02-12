#import <React/RCTViewManager.h>
#import <React/RCTBridgeModule.h>
#import "NativeChart-Swift.h"

@interface RCT_EXTERN_MODULE(NativeChart, RCTViewManager)

RCT_CUSTOM_VIEW_PROPERTY(chartData, NSArrat, NativeChart) {
    [view setChartData:json];
}

@end
