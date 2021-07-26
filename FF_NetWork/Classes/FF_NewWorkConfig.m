 

#import "FF_NewWorkConfig.h"
#import "YTKNetworkConfig.h"
#import "YTKNetworkAgent.h"
#import "AFSecurityPolicy.h"
@implementation FF_NewWorkConfig

+ (NSString *)config:(FF_NewWorkSever)sever{
    
    //改变网络请求的一些配置  Authorization
    YTKNetworkAgent *agent = [YTKNetworkAgent sharedAgent];
    [agent setValue:[NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json",@"text/html",@"text/css", nil] forKeyPath:@"_manager.responseSerializer.acceptableContentTypes"];
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    //  设置HTTPS请求
    config.securityPolicy.allowInvalidCertificates = YES;
    config.securityPolicy.validatesDomainName = NO;
    config.cdnUrl = @"https://www.ppbar.com.cn:8443/file/";  // 图片地址
    // -- 测试环境
//    #define BNDSL_BaseHost                     @"https://sl.bndxqc.com/"
//    #define BNDSL_BaseHostTest                 @"https://test.shanglike.com/"
//    #define BNDSL_BaseHostBeta                 @"https://beta.shanglike.com/"
//    #define BNDSL_BaseHostDemo                 @"https://sldemo.bndxqc.com/"
//    #define BNDSL_BaseHostDev                 @"https://dev.bndxqc.com/"
    NSString *msg = @"";
    NSString *BNDSLNETXSL = @"";
    NSString * BNDSLNETXBX = @"";
    NSString * BNDSLNETXSLSOCKET = @"";
    switch (sever) {
        case SeverDEV:     // 开发服务器地址
            config.baseUrl = @"https://dev.bndxqc.com/";
            BNDSLNETXSL = @"https://xslh5test.bndxqc.com/";
            BNDSLNETXBX = @"http://ztybxtest.bndxqc.com/";
            BNDSLNETXSLSOCKET = @"wss://xslh5test.bndxqc.com/wss/";
            msg = [NSString stringWithFormat:@"开发网%@",config.baseUrl];
            break;
        case SeverTEST:     //测试服务器地址
            config.baseUrl = @"https://test.shanglike.com/";
            BNDSLNETXSL = @"https://xslh5test.bndxqc.com/";
            BNDSLNETXBX = @"http://ztybxtest.bndxqc.com/";
            BNDSLNETXSLSOCKET = @"wss://xslh5test.bndxqc.com/wss/";
            msg = [NSString stringWithFormat:@"测试网%@",config.baseUrl];
            break;
        case SeverRELEASE:   //发布版服务器地址
            config.baseUrl = @"https://sl.bndxqc.com/";
            BNDSLNETXSL = @"https://xslh5.bndxqc.com/";
            BNDSLNETXBX = @"https://ztybxh5.bndxqc.com/";
            BNDSLNETXSLSOCKET = @"wss://xslh5.bndxqc.com/wss/";
            msg = [NSString stringWithFormat:@"外网%@",config.baseUrl];
            break;
        case SeverBeta:   //体验版服务器地址
            config.baseUrl = @"https://beta.shanglike.com/";
            BNDSLNETXSL = @"https://xslh5beta.bndxqc.com/";
            BNDSLNETXBX = @"https://ztybxtyh5.bndxqc.com/";
            BNDSLNETXSLSOCKET = @"wss://xslh5beta.bndxqc.com/wss/";
            msg = [NSString stringWithFormat:@"体验网%@",config.baseUrl];
             break;
            
        case SeverDemo:   //演示服务器地址
        config.baseUrl = @"https://sldemo.bndxqc.com/";
        msg = [NSString stringWithFormat:@"演示网%@",config.baseUrl];
        break;
            
        default:
            break;
    }
    msg = [NSString stringWithFormat:@"服务器网%@",config.baseUrl];
    /// 薪商旅
    [[NSUserDefaults standardUserDefaults] setValue:BNDSLNETXSL forKey:@"BNDSLNETXSL"];
    [[NSUserDefaults standardUserDefaults] setValue:BNDSLNETXSLSOCKET forKey:@"BNDSLNETXSLSOCKET"];
    /// 薪报销
    [[NSUserDefaults standardUserDefaults] setValue:BNDSLNETXBX forKey:@"BNDSLNETXBX"];
    NSLog(@"\n\n-----------------<%@>-------------------------\n\n",msg);
    return msg;
}
#pragma mark:-     获取薪消费域名
+ (NSString *)getBaseUrl{
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    return config.baseUrl;
}
#pragma mark:-     获取薪商旅域名
+ (NSString *)getBaseUrlXSL{
    NSString * BNDSLNETXSL = [NSString stringWithFormat:@"%@", [[NSUserDefaults standardUserDefaults] valueForKey:@"BNDSLNETXSL"]];
    return BNDSLNETXSL;
}
#pragma mark:-     获取薪报销域名地址
+ (NSString *)getBaseUrlXBX{
    NSString * BNDSLNETXBX = [NSString stringWithFormat:@"%@", [[NSUserDefaults standardUserDefaults] valueForKey:@"BNDSLNETXBX"]];
    return BNDSLNETXBX;
}
#pragma mark:-     获取薪商旅socket的配置
+ (NSString *)getSocketXSL{
//    测试环境 wss://xslh5test.bndxqc.com/wss/{data}
//
//    体验环境 wss://xslh5beta.bndxqc.com/wss/{data}
//
//    生产环境 wss://xslh5.bndxqc.com//wss/{data}
    NSString * BNDSLNETXSLSOCKET = [NSString stringWithFormat:@"%@", [[NSUserDefaults standardUserDefaults] valueForKey:@"BNDSLNETXSLSOCKET"]];
    return BNDSLNETXSLSOCKET;
    
}
@end
