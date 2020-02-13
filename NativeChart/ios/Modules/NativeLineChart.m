#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(NativeLineChart, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(chartData, NSArray)
RCT_EXPORT_VIEW_PROPERTY(legendLabel, NSString)
RCT_EXPORT_VIEW_PROPERTY(darkMode, BOOL)
RCT_EXPORT_VIEW_PROPERTY(themeColor, NSString)

@end
