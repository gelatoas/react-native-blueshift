#import "Blueshift.h"

@interface Blueshift ()
@end

@implementation Blueshift

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(setUserInfo:(NSDictionary *)userInfo)
{
//    // sign in complete
    [[BlueShiftUserInfo sharedInstance] setEmail:@"Email ID here"];
    [[BlueShiftUserInfo sharedInstance] setRetailerCustomerID:@"Customer ID here"];

    // add other user info initializations here.

    // It is important to save the instance of BlueShiftUserInfo after it has been updated
    [[BlueShiftUserInfo sharedInstance] save];
    printf("Did set user info...");
}

@end
