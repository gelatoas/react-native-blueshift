#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(Blueshift, NSObject)

RCT_EXTERN_METHOD(setUserInfo:(NSDictionary *)userInfo)

RCT_EXTERN_METHOD(trackEvent:(NSString *)eventName andParams:(NSDictionary*)params andCanBatchThisEvent:(BOOL)canBatchThisEvent)
RCT_EXTERN_METHOD(identify:(NSDictionary *)details andCanBatchThisEvent:(BOOL)canBatchThisEvent)
RCT_EXTERN_METHOD(identifyWithEmail:(NSString *)email andDetails:(NSDictionary *)details andCanBatchThisEvent:(BOOL) canBatchThisEvent)
RCT_EXTERN_METHOD(trackProductView:(NSDictionary *)params andCanBatchThisEvent:(BOOL)canBatchThisEvent)
RCT_EXTERN_METHOD(trackScreenView:(NSString *)name andCanBatchThisEvent:(BOOL)canBatchThisEvent)
RCT_EXTERN_METHOD(trackAddToCart:(NSDictionary*)params andCanBatchThisEvent:(BOOL)canBatchThisEvent)

@end
