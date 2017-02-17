//
//  LSFNetworkConfig.h
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/16.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
@interface LSFNetworkConfig : NSObject

@property (nonatomic, copy) NSString *apiHost;
@property (nonatomic, copy) NSString *wapHost;

@property (nonatomic, copy) NSString *defaultApiHost;
@property (nonatomic, copy) NSString *defaultWapHost;

@property (nonatomic, assign, getter=isLogEnable) BOOL logEnabled;

/**
 设置证书文件路径，同时初始化 securityPolicy
 */
@property (nonatomic, copy) NSString *cerFilePath;
@property (nonatomic, copy, readonly) AFSecurityPolicy *securityPolicy;

singletion_interface;


@end
