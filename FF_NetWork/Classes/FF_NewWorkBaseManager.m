 

#import "FF_NewWorkBaseManager.h"
#import "FF_NewWorkBaseApi.h"
static FF_NewWorkBaseManager * shareNet = nil;

@implementation FF_NewWorkBaseManager

+ (instancetype)sharedBaseNet{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareNet = [[FF_NewWorkBaseManager alloc]init];
    });
    return shareNet;
}

- (void)startRequest:(YTKRequest*)requestApi success:(FF_NewWorkBaseSuccessCompletion)success failure:(FF_NewWorkBaseFailureCompletion)failure{
    [requestApi startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSString * jsonString = request.responseString;
//        NSLog(@"打印JSON结果=======%@", request.responseString);
        FF_NewWorkHTTPResponse * responseInfo = [[FF_NewWorkHTTPResponse alloc]initWithJsonString:jsonString];
        responseInfo.jsonStr = request.responseString;
        if (responseInfo.isSuccessed) {
            if (success) {
                success(responseInfo);
            }
        }else{
            if (failure) {
                failure(responseInfo.errorInfo);
            }
            
        }
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        if (failure) {
            FF_NewWorkHTTPError * errorInfo = [[FF_NewWorkHTTPError alloc]init];
            errorInfo.code = request.error.code;
            errorInfo.note = @"【网络请求失败，请重试】";
            errorInfo.userInfo = request.userInfo;
            
            failure(errorInfo);
        }
        NSLog(@"打印失败结果=======%@", request.error);
        
    }];
}



-(void)refreshAllToken{
    @try {
        Class class = NSClassFromString(@"PESW_RefreshToken");
        SEL selector = NSSelectorFromString(@"refreshAllToken");
        [class performSelector:selector];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
}



@end
