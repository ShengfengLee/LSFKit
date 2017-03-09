//
//  LSFNetworkReachability.m
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/16.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import "LSFNetworkReachability.h"

NSString *const LSFNetworkStatusChangedNotification = @"LSFNetworkReadchabilityStatusChanged";

@interface LSFNetworkReachability ()

@property (nonatomic, assign) AFNetworkReachabilityStatus networkStatus;
@end

@implementation LSFNetworkReachability

singletion_implementation(LSFNetworkReachability)

- (void)dealloc
{
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _networkStatus = AFNetworkReachabilityStatusUnknown;
        
        __weak typeof(self)weakSelf = self;
        [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            weakSelf.networkStatus = status;
            
            //发送系统通知
            [[NSNotificationCenter defaultCenter] postNotificationName:LSFNetworkStatusChangedNotification object:[NSNumber numberWithInteger:weakSelf.networkStatus]];
        }];
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    }
    return self;
}

+ (AFNetworkReachabilityStatus)networkStatus{
    return [LSFNetworkReachability shareInstance].networkStatus;
}

+ (BOOL)isWiFi{
    return [self networkStatus] == AFNetworkReachabilityStatusReachableViaWiFi;
}

+ (BOOL)isWWAN{
    return [self networkStatus] == AFNetworkReachabilityStatusReachableViaWWAN;
}

+ (BOOL)isReachable{
    
    if ([self isWiFi] || [self isWWAN]) {
        return YES;
    }
    return NO;
}
@end
