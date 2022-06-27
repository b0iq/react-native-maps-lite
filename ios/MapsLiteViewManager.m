#import "React/RCTViewManager.h"

@interface RCT_EXTERN_MODULE(MapsLiteViewManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(initialRegion, NSDictionary);
RCT_EXPORT_VIEW_PROPERTY(showUserLocation, NSNumber);
RCT_EXPORT_VIEW_PROPERTY(showCompass, NSNumber);
RCT_EXPORT_VIEW_PROPERTY(onMapWillMove, RCTDirectEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onMapDidMove, RCTDirectEventBlock);
@end
