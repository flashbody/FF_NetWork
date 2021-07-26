 

#import <YTKNetwork/YTKNetwork.h>

NS_ASSUME_NONNULL_BEGIN

@interface FF_NewWorkBaseApi : YTKRequest

/**
 * 过期时间 默认60s
 */
@property (assign, nonatomic) NSTimeInterval requestTimeout;  /**< 接口请求过期时间 */

/*
 * cacheTime 默认-1,  不要缓存传-1。。最小单位S
 */
@property (assign, nonatomic) NSTimeInterval cacheTime;  /**< 缓存时间 */

/**
 *  默认固定缓存 方法
 */
- (void)defaultCacheTime;

/// 强制更新缓存【不使用缓存数据】
//- (void)startWithoutCache;
/// 返回当前缓存的对象
//- (id)cacheJson;
/// 是否当前的数据从缓存获得
//- (BOOL)isDataFromCache;
/// 返回是否当前缓存需要更新【缓存是否超时】
//- (BOOL)isCacheVersionExpired;

/**
 *requestUrl :  请求地址：bnd-uaac/v1/user/userRegister  ||
 *requestMethod :  请求post、get、等：0=get，1=post。。。 ||
 *requestArgument : 请求体 @{}     ||
 */
/**
 * get请求
    @param requestUrl  :  接口
    @param requestArgument   :     传值
 */
- (id)initWithGetApiUrl:(NSString *)requestUrl
requestArgument:(NSDictionary *)requestArgument;
/**
* post请求
 @param requestUrl  :  接口
 @param requestArgument   :     传值
*/
- (id)initWithPostApiUrl:(NSString *)requestUrl
           requestArgument:(NSDictionary *)requestArgument;
/**
* head请求
 @param requestUrl  :  接口
 @param requestArgument   :     传值
*/
- (id)initWithHEADApiUrl:(NSString *)requestUrl
requestArgument:(NSDictionary *)requestArgument;
/**
* put请求
 @param requestUrl  :  接口
 @param requestArgument   :     传值
*/
- (id)initWithPUTtApiUrl:(NSString *)requestUrl
requestArgument:(NSDictionary *)requestArgument;
/**
* delete请求
 @param requestUrl  :  接口
 @param requestArgument   :     传值
*/
- (id)initWithDELETEApiUrl:(NSString *)requestUrl
requestArgument:(NSDictionary *)requestArgument;
/**
* patch请求
 @param requestUrl  :  接口
 @param requestArgument   :     传值
*/
- (id)initWithPATCHApiUrl:(NSString *)requestUrl
requestArgument:(NSDictionary *)requestArgument;
 
/**
 * 自定义请求。
    @param requestUrl  :  接口
    @param requestMethod   :     请求类型
    @param requestArgument   :     传值
 */
- (id)initWithApiUrl:(NSString *)requestUrl
             requestMethod:(YTKRequestMethod)requestMethod
           requestArgument:(NSDictionary *)requestArgument;
/**
* 自定义请求，带请求类型，HTTP、json。
 @param requestUrl  :  接口
 @param requestMethod   :     请求类型
 @param requestArgument   :     传值
 @param requestSerializerType   :     传值类型
*/
- (id)initWithApiUrl:(NSString *)requestUrl
          requestMethod:(YTKRequestMethod)requestMethod
        requestArgument:(NSDictionary *)requestArgument
  requestSerializerType:(YTKRequestSerializerType)requestSerializerType;

/**
* 自定义请求，带请求类型，HTTP、json。带头部
 @param requestUrl  :  接口
 @param requestMethod   :     请求类型
 @param requestArgument   :     传值
 @param requestSerializerType   :     传值类型
 @param headDict   :     接口头部传值
*/
- (id)initWithApiUrl:(NSString *)requestUrl
          requestMethod:(YTKRequestMethod)requestMethod
        requestArgument:(NSDictionary *)requestArgument
  requestSerializerType:(YTKRequestSerializerType)requestSerializerType requestHeaderFieldValueDictionary:(NSDictionary *)headDict;

/**
* baseURL自定义请求，带请求类型，HTTP、json。带头部
 @param baseUrl  :  域名地址，带/斜杆结尾
 @param requestUrl  :  接口
 @param requestMethod   :     请求类型
 @param requestArgument   :     传值
 @param requestSerializerType   :     传值类型
 @param headDict   :     接口头部传值
*/
- (id)initWithApiBaseUrl:(NSString *)baseUrl requestUrl:(NSString *)requestUrl
          requestMethod:(YTKRequestMethod)requestMethod
        requestArgument:(NSDictionary *)requestArgument
  requestSerializerType:(YTKRequestSerializerType)requestSerializerType requestHeaderFieldValueDictionary:(NSDictionary *)headDict;


/**
* 自定义请求，带请求类型，HTTP、json。带头部
 @param requestUrl  :  接口
 @param requestMethod   :     请求类型
 @param image   :    上传图片
 @param requestArgument   :     传值
 @param requestSerializerType   :     传值类型
 @param headDict   :     接口头部传值
*/
- (id)initWithApiUrl:(NSString *)requestUrl
          requestMethod:(YTKRequestMethod)requestMethod
        requestArgument:(NSDictionary *)requestArgument image:(UIImage *)image requestSerializerType:(YTKRequestSerializerType)requestSerializerType requestHeaderFieldValueDictionary:(NSDictionary *)headDict;

@end

NS_ASSUME_NONNULL_END
