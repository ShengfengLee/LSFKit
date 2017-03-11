//
//  LSFNetworkReachability.h
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/16.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

extern NSString *const LSFNetworkStatusChangedNotification;

@interface LSFNetworkReachability : NSObject


singletion_interface;


/**
 返回当前网络状态

 @return <#return value description#>
 */
+ (AFNetworkReachabilityStatus)networkStatus;


/**
 判断当前是否是WiFi网络

 @return <#return value description#>
 */
+ (BOOL)isWiFi;


/**
 判断当前是否是数据流量网络

 @return <#return value description#>
 */
+ (BOOL)isWWAN;


/**
 判断当前是否有网络

 @return <#return value description#>
 */
+ (BOOL)isReachable;
@end
