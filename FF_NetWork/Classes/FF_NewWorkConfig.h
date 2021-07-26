 
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//网络来源
typedef NS_ENUM(NSInteger,FF_NewWorkSever){
    SeverDEV =  0,           //开发网
    SeverTEST = 1,         //测试网
    SeverRELEASE = 2,         //外网
    SeverBeta = 3,             //体验
    SeverDemo = 4             //演示
};


@interface FF_NewWorkConfig : NSObject
 
+ (NSString *)config:(FF_NewWorkSever)sever;      //配置网络
/// 获取薪消费域名地址
+ (NSString *)getBaseUrl;
///  获取薪商旅域名地址
+ (NSString *)getBaseUrlXSL;
///  获取薪报销域名地址
+ (NSString *)getBaseUrlXBX;
///  获取薪商旅socket的配置
+ (NSString *)getSocketXSL;
@end

NS_ASSUME_NONNULL_END
