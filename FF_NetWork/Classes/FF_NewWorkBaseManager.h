 
#import <Foundation/Foundation.h>

#import "FF_NewWorkHTTPResponse.h"
#import "FF_NewWorkHTTPError.h"
@class YTKRequest;

NS_ASSUME_NONNULL_BEGIN
typedef void(^FF_NewWorkBaseSuccessCompletion)(FF_NewWorkHTTPResponse * response);
typedef void(^FF_NewWorkBaseFailureCompletion)(FF_NewWorkHTTPError * error);

@interface FF_NewWorkBaseManager : NSObject

+ (instancetype)sharedBaseNet;

- (void)startRequest:(YTKRequest*)requestApi success:(FF_NewWorkBaseSuccessCompletion)success failure:(FF_NewWorkBaseFailureCompletion)failure;
@end

NS_ASSUME_NONNULL_END
