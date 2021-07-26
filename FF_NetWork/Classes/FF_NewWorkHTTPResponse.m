 
#import "FF_NewWorkHTTPResponse.h"
#import "YYKit.h"

@implementation FF_NewWorkHTTPResponse
- (instancetype)initWithJsonString:(NSString *)jsonString {
    if (self = [super init]) {
        [self modelSetWithJSON:jsonString];
    }
    return self;
    
}

- (BOOL)isSuccessed{
    return self.status == 200;
}

- (FF_NewWorkHTTPError *)errorInfo{
    FF_NewWorkHTTPError * err = [[FF_NewWorkHTTPError alloc]init];
    err.code = _status;
    err.note = _message;
    
    if (_status == 601 || _status == 602 || _status == 10008) {
        // token失效发送通知
        [[NSNotificationCenter defaultCenter] postNotificationName:@"BNDSLTOKENFAILURE" object:@""];
    }
    return err;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
@end
