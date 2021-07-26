 
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FF_NewWorkHTTPError : NSObject
@property (nonatomic,assign) NSInteger code;

@property (nonatomic,copy) NSString *note;

@property (nonatomic,retain) NSDictionary *userInfo;
@end

NS_ASSUME_NONNULL_END
