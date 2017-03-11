//
//  LSFNetwork.m
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/16.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import "LSFNetwork.h"

@implementation LSFNetwork


singletion_implementation(LSFNetwork)

+ (void)initialize
{
    if (self == [LSFNetwork class]) {
        //启动网络监测
        [LSFNetworkReachability shareInstance];
    }
}

- (void)setConfig:(LSFNetworkConfig *)config{
    _config = config;
    NSURL *url = [NSURL URLWithString:_config.apiHost];
    
    self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:url];
    self.sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    self.sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    self.sessionManager.requestSerializer.timeoutInterval = 5.0f;
    
    if (_config.securityPolicy) {
        self.sessionManager.securityPolicy = _config.securityPolicy;
    }
}

- (void)setRequestCount:(NSInteger)requestCount{
    if (requestCount < 0) {
        requestCount = 0;
    }
    _requestCount = requestCount;
    if (_requestCount == 0) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }
    else{
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    }
}


#pragma mark
#pragma mark - Public method
- (void)cancelTask:(NSURLSessionTask *)task{
    [task cancel];
}

/**
 发送POST网络请求
 
 @param urlStr 网址URL
 @param parameters 参数列表
 @param uploadProgress 任务完成进度
 @param success 成功
 @param failure 失败
 @return POST请求任务
 */
- (NSURLSessionDataTask *)POST:(NSString *)urlStr
                    parameters:(NSDictionary *)parameters
                      progress:(void (^)(NSProgress *))uploadProgress
                       success:(LSFSuccessResponse)success
                       failure:(LSFFailureResponse)failure{
    if (![self checkNetworkStatus:failure]) {
        return nil;
    }
    
    //去空值
    parameters = [LSFNetwork removeNilValue:parameters];
    
    //网络请求计数+1
    self.requestCount++;
    
    NSURLSessionDataTask *task = [self.sessionManager POST:urlStr parameters:parameters progress:uploadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                    options:NSJSONReadingAllowFragments
                                                                      error:nil];
        if (![responseDic lsf_isNull] && [responseDic isKindOfClass:[NSDictionary class]]) {
            
            if (success) {
                success(nil, responseDic);
            }
        }
        
        self.requestCount--;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //网络错误
        if (failure) {
            failure(error.code, error.localizedDescription);
        }
        self.requestCount--;
    }];
    
    return task;

}


/**
 发送GET网络请求
 
 @param urlStr 网址URL
 @param parameters 参数列表
 @param uploadProgress 任务完成进度
 @param success 成功
 @param failure 失败
 @return POST请求任务
 */
- (NSURLSessionDataTask *)GET:(NSString *)urlStr
                   parameters:(NSDictionary *)parameters
                     progress:(void (^)(NSProgress *))uploadProgress
                      success:(LSFSuccessResponse)success
                      failure:(LSFFailureResponse)failure{
    if (![self checkNetworkStatus:failure]) {
        return nil;
    }
    
    //去空值
    parameters = [LSFNetwork removeNilValue:parameters];
    
    //网络请求计数+1
    self.requestCount++;
    
    NSURLSessionDataTask *task = [self.sessionManager GET:urlStr parameters:parameters progress:uploadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                    options:NSJSONReadingAllowFragments
                                                                      error:nil];
        if (![responseDic lsf_isNull] && [responseDic isKindOfClass:[NSDictionary class]]) {
            
            if (success) {
                success(nil, responseDic);
            }
        }
        
        self.requestCount--;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //网络错误
        if (failure) {
            failure(error.code, error.localizedDescription);
        }
        self.requestCount--;
    }];
    
    return task;
    
}

/**
 *  去除空值的方法
 *
 *  @param fromDic 传入的对象
 *
 *  @return 然后成功的
 */
+ (NSMutableDictionary *)removeNilValue:(NSDictionary*)fromDic{
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithDictionary:fromDic];
    for (NSString *key in mDic.allKeys) {
        NSString *value = [mDic objectForKey:key];
        if ([value isEqual:[NSNull null]]) {//value == nil ||
            [mDic removeObjectForKey:key];
        }
    }
    return mDic;
}
#pragma mark
#pragma mark - private method
- (BOOL)checkNetworkStatus:(LSFFailureResponse)failure{
    if (![LSFNetworkReachability isReachable]) {
        
        if (failure) {
            NSString *message = @"网络不给力，请检查网络连接";
            failure(0, message);
        }
        return NO;
    }
    return YES;
}
@end
