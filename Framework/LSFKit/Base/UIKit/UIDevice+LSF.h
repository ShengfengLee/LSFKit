//
//  BBDeviceUtils.h
//  BBTools
//
//  Created by 李胜锋 on 16/8/1.
//  Copyright © 2016年 YouShiXiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (LSF)
///获取设备型号名称， 例如： iPhone 6 Plus
+(NSString*)lsf_getDeviceModel;

///获取设备型号， 例如：iPhone 7.1
+ (NSString *)lsf_platformRawString;

+ (NSString *)lsf_uuid;
+ (NSString *)lsf_buildVersion;
+ (NSString *)lsf_appName;
+ (NSString *)lsf_appVersion;
+ (NSString *)lsf_bundleId;
+ (NSString *)lsf_systemVersion;
+ (NSString *)lsf_model;

///获取广告标识
+ (NSString *)lsf_idfa;

/**
 *  强制改变设备的方向
 *
 *  @param interfaceOrientation 指定的方向
 */
+ (void)lsf_changeInterfaceOrientaion:(UIInterfaceOrientation)interfaceOrientation;

/**
 *  判断设备是否越狱
 *
 *  @return 是否是越狱设备
 */
+ (BOOL)lsf_isJailBreak;

/*!
 *  获取设备存储总容量
 *
 *  @return 总大小
 */
+ (long long)lsf_totalDiskSpace;

/*!
 *  获取磁盘可用大小
 *
 *  @return 磁盘可用大小
 */
+ (long long)lsf_freeDiskSpace;

@end
