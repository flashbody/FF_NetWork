 
#import <Foundation/Foundation.h>
#import "FF_NewWorkHTTPError.h"
NS_ASSUME_NONNULL_BEGIN

@interface FF_NewWorkHTTPResponse : NSObject

@property (copy, nonatomic) NSString * jsonStr;  /**< <#注释#> */

@property (nonatomic, assign, getter=isSuccessed)BOOL successed;

@property (nonatomic, copy)NSString * error;

@property (nonatomic, copy)NSString * message;

@property (nonatomic, copy)NSString * path;

@property (nonatomic, copy)NSString * timeStamp;

@property (nonatomic, assign)NSInteger status;

@property (nonatomic, retain)FF_NewWorkHTTPError * errorInfo;

@property (nonatomic, retain)id        data;

@property (nonatomic, retain)id        rows;

- (instancetype)initWithJsonString:(NSString *)jsonString;
@end

NS_ASSUME_NONNULL_END

