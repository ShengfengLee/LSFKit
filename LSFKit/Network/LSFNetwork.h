//
//  LSFNetwork.h
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/16.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "LSFNetworkConfig.h"
#import "LSFNetworkReachability.h"


/**
 网络请求失败回调

 @param code 错误码
 @param errorMessage 错误信息
 */
typedef void (^ LSFFailureResponse)(NSInteger code, NSString *errorMessage);


/**
 网络请求成功信息回调

 @param response 服务器返回的数据， 根据指定的Model Class转换的数据：当个对象，或者指定类型对象数组。没有指定Model Class是直接返回responseDic
 @param responseDic 服务器返回的数据，Json转换正Dictionary
 */
typedef void (^ LSFSuccessResponse)(id response, NSDictionary *responseDic);


/**
 网络请求进度

 @param progress 进度
 */
typedef void (^ LSFProgressResponse)(NSProgress *progress);

@interface LSFNetwork : NSObject

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;   //网络请求任务
@property (nonatomic, assign) NSInteger requestCount;   //正在运行的网络请求计数
@property (nonatomic, strong) NSString *aesKey; //加密,解密key

@property (nonatomic, strong) LSFNetworkConfig *config;

singletion_interface


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
                       failure:(LSFFailureResponse)failure;

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
                      failure:(LSFFailureResponse)failure;
@end
