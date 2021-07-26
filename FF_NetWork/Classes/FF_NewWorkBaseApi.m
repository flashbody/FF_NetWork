 
#import "FF_NewWorkBaseApi.h"
#import "YTKNetworkAgent+FF_NewWorkAgent.h"
#import "AFNetWorking.h"
 

@implementation FF_NewWorkBaseApi{
    NSString * _requestUrl;
    YTKRequestMethod  _requestMethod;
    NSDictionary * _requestArgument;
    YTKRequestSerializerType _type;
    NSDictionary * _headDict;
    NSString * _baseUrl;
    
    // 上传图片
    UIImage *_image;
    NSString *_imageStringFile;
}
#pragma mark:-     get
- (id)initWithGetApiUrl:(NSString *)requestUrl requestArgument:(NSDictionary *)requestArgument{
    return [self initWithApiUrl:requestUrl requestMethod:YTKRequestMethodGET requestArgument:requestArgument requestSerializerType:YTKRequestSerializerTypeHTTP];
}
#pragma mark:-     post
- (id)initWithPostApiUrl:(NSString *)requestUrl requestArgument:(NSDictionary *)requestArgument{
    return [self initWithApiUrl:requestUrl requestMethod:YTKRequestMethodPOST requestArgument:requestArgument];
}
- (id)initWithHEADApiUrl:(NSString *)requestUrl
         requestArgument:(NSDictionary *)requestArgument{
    return [self initWithApiUrl:requestUrl requestMethod:YTKRequestMethodHEAD requestArgument:requestArgument];
}
#pragma mark:-     put请求
- (id)initWithPUTtApiUrl:(NSString *)requestUrl
         requestArgument:(NSDictionary *)requestArgument{
    return [self initWithApiUrl:requestUrl requestMethod:YTKRequestMethodPUT requestArgument:requestArgument];
}
#pragma mark:-     delete请求
- (id)initWithDELETEApiUrl:(NSString *)requestUrl
           requestArgument:(NSDictionary *)requestArgument{
    return [self initWithApiUrl:requestUrl requestMethod:YTKRequestMethodDELETE requestArgument:requestArgument];
}
#pragma mark:-     patch请求
- (id)initWithPATCHApiUrl:(NSString *)requestUrl
          requestArgument:(NSDictionary *)requestArgument{
    return [self initWithApiUrl:requestUrl requestMethod:YTKRequestMethodPATCH requestArgument:requestArgument];
}

#pragma mark:-初始化的时候将两个参数值传入（自定义方法）
- (id)initWithApiUrl:(NSString *)requestUrl requestMethod:(YTKRequestMethod)requestMethod requestArgument:(NSDictionary *)requestArgument{
    return [self initWithApiUrl:requestUrl requestMethod:requestMethod requestArgument:requestArgument requestSerializerType:YTKRequestSerializerTypeJSON];
}
#pragma mark:-初始化的时候将两个参数值传入（自定义方法）
- (id)initWithApiUrl:(NSString *)requestUrl requestMethod:(YTKRequestMethod)requestMethod requestArgument:(NSDictionary *)requestArgument requestSerializerType:(YTKRequestSerializerType)requestSerializerType{
    return [self initWithApiUrl:requestUrl requestMethod:requestMethod requestArgument:requestArgument requestSerializerType:requestSerializerType requestHeaderFieldValueDictionary:@{}];
//    self = [super init];
//    if (self) {
////        _requestUrl = [NSString stringWithFormat:@"%@", requestUrl];
////        _requestMethod = requestMethod;
////        _requestArgument = requestArgument;
////        _type = requestSerializerType;
//
//    }
//    return self;
}
#pragma mark:-初始化的时候将两个参数值传入（自定义方法）
- (id)initWithApiUrl:(NSString *)requestUrl requestMethod:(YTKRequestMethod)requestMethod requestArgument:(NSDictionary *)requestArgument requestSerializerType:(YTKRequestSerializerType)requestSerializerType requestHeaderFieldValueDictionary:(NSDictionary *)headDict{
    self = [super init];
    if (self) {
        @try {
            _requestUrl = [NSString stringWithFormat:@"%@", requestUrl];
            _requestMethod = requestMethod;
            _requestArgument = requestArgument;
            _type = requestSerializerType;
            _headDict = headDict;
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
        
    }
    return self;
}

- (id)initWithApiBaseUrl:(NSString *)baseUrl requestUrl:(NSString *)requestUrl requestMethod:(YTKRequestMethod)requestMethod requestArgument:(NSDictionary *)requestArgument requestSerializerType:(YTKRequestSerializerType)requestSerializerType requestHeaderFieldValueDictionary:(NSDictionary *)headDict{
    self = [super init];
    if (self) {
        @try {
            _baseUrl = [NSString stringWithFormat:@"%@", baseUrl];
            _requestUrl = [NSString stringWithFormat:@"%@", requestUrl];
            _requestMethod = requestMethod;
            _requestArgument = requestArgument;
            _type = requestSerializerType;
            _headDict = headDict;
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
        
    }
    return self;
}


#pragma mark:-     上传图片
- (id)initWithApiUrl:(NSString *)requestUrl requestMethod:(YTKRequestMethod)requestMethod requestArgument:(NSDictionary *)requestArgument image:(UIImage *)image requestSerializerType:(YTKRequestSerializerType)requestSerializerType requestHeaderFieldValueDictionary:(NSDictionary *)headDict{
    self = [super init];
    if (self) {
        @try {
            _requestUrl = [NSString stringWithFormat:@"%@", requestUrl];
            _requestMethod = requestMethod;
            _requestArgument = requestArgument;
            _type = requestSerializerType;
            _headDict = headDict;
            _image = image;
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
        
    }
    return self;
}


- (AFConstructingBlock)constructingBodyBlock
{
    
//    NSString *fileName = [NSString stringWithFormat:@"%@.png",[formatter stringFromDate:[NSDate date]]];
    if (_imageStringFile) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        return ^(id<AFMultipartFormData> formData) {
            NSString *fileName = [NSString stringWithFormat:@"%@.png",[formatter stringFromDate:[NSDate date]]];
            NSString *name = @"file";
            NSString *type = @"image/jpg/png/jpeg";//@"image/jpeg";
            NSURL *url = [NSURL URLWithString:_imageStringFile];
            [formData appendPartWithFileURL:url name:name fileName:fileName mimeType:type error:nil];
        };
    }else if (_image) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        return ^(id<AFMultipartFormData> formData) {
            NSData *data = UIImageJPEGRepresentation(_image, 1);
            NSString *fileName = [NSString stringWithFormat:@"%@.png",[formatter stringFromDate:[NSDate date]]];
            NSString *name = @"file";
            NSString *type = @"image/jpg/png/jpeg";//@"image/gif";
            [formData appendPartWithFileData:data name:name fileName:fileName mimeType:type];
        };
    }else {
        return nil;
    }
}


#pragma mark:-     域名地址
- (NSString *)baseUrl{
    @try {
        if (_baseUrl) {
            return _baseUrl;
        }else{
            return [YTKNetworkConfig sharedConfig].baseUrl;
        }
    } @catch (NSException *exception) {
        return [YTKNetworkConfig sharedConfig].baseUrl;
    } @finally {
        
    }
    
}

#pragma mark:-         接口的地址
- (NSString *)requestUrl {
    return _requestUrl;
}
#pragma mark:-   请求类型
- (YTKRequestMethod)requestMethod {
    return _requestMethod;
}
#pragma mark:-   数据类型，HTTP、json
-(YTKRequestSerializerType)requestSerializerType{
    return _type;
}

//请求体
- (id)requestArgument {
    return _requestArgument;
}
#pragma mark:-   请求头部
- (NSDictionary *)requestHeaderFieldValueDictionary {
    if (_headDict) {
        return _headDict;
    }
    return @{};
}

#pragma mark:-     过期时间
- (NSInteger)cacheTimeInSeconds{
    if (self.cacheTime) {
        return self.cacheTime;
    }
    return -1;
}

- (NSTimeInterval)requestTimeoutInterval{
    if (self.requestTimeout) {
        return self.requestTimeout;
    }
    return 30;
}
- (void)defaultCacheTime{
//    self.cacheTime = 60*60*24*60;
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"BNDCache"] integerValue] == 1) {
        self.cacheTime = 60*60*24*60;
    }else{
        self.cacheTime = -1;
    }
}
 
 
 
@end
