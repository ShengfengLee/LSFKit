//
//  BBDeviceUtils.m
//  BBTools
//
//  Created by 李胜锋 on 16/8/1.
//  Copyright © 2016年 YouShiXiu. All rights reserved.
//

#import "UIDevice+LSF.h"
#import "sys/utsname.h"
#import "sys/stat.h"

@implementation UIDevice (LSF)
+(NSString*)lsf_getDeviceModel
{
    NSString *modelIdentifier = [self lsf_platformRawString];
    
    // iPhone http://theiphonewiki.com/wiki/IPhone
    
    if ([modelIdentifier isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([modelIdentifier isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([modelIdentifier isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([modelIdentifier isEqualToString:@"iPhone3,1"])    return @"iPhone 4 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone3,2"])    return @"iPhone 4 (GSM Rev A)";
    if ([modelIdentifier isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
    if ([modelIdentifier isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([modelIdentifier isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (Global)";
    if ([modelIdentifier isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (Global)";
    if ([modelIdentifier isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (Global)";
    if ([modelIdentifier isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([modelIdentifier isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([modelIdentifier isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([modelIdentifier isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([modelIdentifier isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    if ([modelIdentifier isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
    if ([modelIdentifier isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
    if ([modelIdentifier isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
    if ([modelIdentifier isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
    
    // iPad http://theiphonewiki.com/wiki/IPad
    
    if ([modelIdentifier isEqualToString:@"iPad1,1"])      return @"iPad 1G";
    
    if ([modelIdentifier isEqualToString:@"iPad2,1"])      return @"iPad 2 (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([modelIdentifier isEqualToString:@"iPad2,4"])      return @"iPad 2 (Rev A)";
    
    if ([modelIdentifier isEqualToString:@"iPad3,1"])      return @"iPad 3 (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad3,3"])      return @"iPad 3 (Global)";
    
    if ([modelIdentifier isEqualToString:@"iPad3,4"])      return @"iPad 4 (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad3,6"])      return @"iPad 4 (Global)";
    
    if ([modelIdentifier isEqualToString:@"iPad4,1"])      return @"iPad Air (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    
    if ([modelIdentifier isEqualToString:@"iPad5,3"])      return @"iPad Air 2 (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad5,4"])      return @"iPad Air 2 (Cellular)";
    
    
    if ([modelIdentifier isEqualToString:@"iPad6,3"])      return @"iPad Pro (Wi-Fi) 9.7 inch";
    if ([modelIdentifier isEqualToString:@"iPad6,4"])      return @"iPad Pro (Cellular) 9.7 inch";
    if ([modelIdentifier isEqualToString:@"iPad6,7"])      return @"iPad Pro (Wi-Fi) 12.9 inch";
    if ([modelIdentifier isEqualToString:@"iPad6,8"])      return @"iPad Pro (Cellular) 12.9 inch";
    
    // iPad Mini http://theiphonewiki.com/wiki/IPad_mini
    
    if ([modelIdentifier isEqualToString:@"iPad2,5"])      return @"iPad mini 1G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad2,6"])      return @"iPad mini 1G (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad2,7"])      return @"iPad mini 1G (Global)";
    
    if ([modelIdentifier isEqualToString:@"iPad4,4"])      return @"iPad mini 2G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad4,5"])      return @"iPad mini 2G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad4,7"])      return @"iPad mini 3G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad4,8"])      return @"iPad mini 3G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad4,9"])      return @"iPad mini 3G (Cellular)";
    
    // iPod http://theiphonewiki.com/wiki/IPod
    
    if ([modelIdentifier isEqualToString:@"iPod1,1"])      return @"iPod touch 1G";
    if ([modelIdentifier isEqualToString:@"iPod2,1"])      return @"iPod touch 2G";
    if ([modelIdentifier isEqualToString:@"iPod3,1"])      return @"iPod touch 3G";
    if ([modelIdentifier isEqualToString:@"iPod4,1"])      return @"iPod touch 4G";
    if ([modelIdentifier isEqualToString:@"iPod5,1"])      return @"iPod touch 5G";
    if ([modelIdentifier isEqualToString:@"iPod7,1"])      return @"iPod touch 6G";
    
    // Simulator
    if ([modelIdentifier hasSuffix:@"86"] || [modelIdentifier isEqual:@"x86_64"])
    {
        BOOL smallerScreen = ([[UIScreen mainScreen] bounds].size.width < 768.0);
        return (smallerScreen ? @"iPhone Simulator" : @"iPad Simulator");
    }
    
    return modelIdentifier;
}

+ (NSString *)lsf_platformRawString
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *machine = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    
    return machine;
}

+ (NSString *)lsf_uuid{
    return [[UIDevice currentDevice] identifierForVendor].UUIDString;
}

+ (NSString *)lsf_buildVersion{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (NSString *)lsf_appName{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

+ (NSString *)lsf_appVersion{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)lsf_bundleId{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
}

+ (NSString *)lsf_systemVersion{
    return [UIDevice currentDevice].systemVersion;
}

+ (NSString *)lsf_model{
    return [UIDevice currentDevice].model;;
}

+ (NSString *)lsf_idfa{
    NSString *idfa;
    //    if ([ASIdentifierManager sharedManager].isAdvertisingTrackingEnabled) {
    //        idfa = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
    //    }
    return idfa;
}

/**
 *  强制改变设备的方向
 *
 *  @param interfaceOrientation 指定的方向
 */
+ (void)lsf_changeInterfaceOrientaion:(UIInterfaceOrientation)interfaceOrientation{
    
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        
        SEL selector = NSSelectorFromString(@"setOrientation:");
        
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        
        [invocation setSelector:selector];
        
        [invocation setTarget:[UIDevice currentDevice]];
        
        int val = interfaceOrientation;
        
        [invocation setArgument:&val atIndex:2];
        
        [invocation invoke];
        
    }
}

/**
 *  判断设备是否越狱
 *
 *  @return 是否是越狱设备
 */
+ (BOOL)lsf_isJailBreak{
    //1.判定常见的越狱文件是否存在
    NSArray *paths = @[@"/Applications/Cydia.app",
                       @"/Library/MobileSubstrate/MobileSubstrate.dylib",
                       @"/bin/bash",
                       @"/usr/sbin/sshd",
                       @"/etc/apt"];
    for (NSString *path in paths) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
            //            BBLogI(@"The device is jail broken!-----1");
            return YES;
        }
    }
    
    //2.判断cydia的URL scheme
    NSURL *url = [NSURL URLWithString:@"cydia://"];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        //        BBLogI(@"The device is jail broken!-----2");
        return YES;
    }
    
    //3. 读取系统所有应用的名称
    //   这个是利用不越狱的机器没有这个权限来判定的。
    if ([[NSFileManager defaultManager] fileExistsAtPath:@"/User/Applications/"]) {
        //        BBLogI(@"The device is jail broken!-----3");
//        NSArray *applist = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/User/Applications/" error:nil];
        //        BBLogI(@"applist = %@", applist);
        return YES;
    }
    
    //4.攻击者可能会hook NSFileManager 的方法，让你的想法不能如愿。
    //那么，你可以回避 NSFileManager，使用stat系列函数检测Cydia等工具
    struct stat stat_info;
    if (0 == stat("/Applications/Cydia.app", &stat_info)) {
        //        BBLogI(@"The device is jail broken!-----4");
        return YES;
    }
    
    //    BBLogI(@"The device is NOT jail broken!");
    return NO;
}


/*!
 *  获取设备存储总容量
 *
 *  @return 总大小
 */
+ (long long)lsf_totalDiskSpace
{
    NSError *error;
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    return [[fattributes objectForKey:NSFileSystemSize] longLongValue];
}

/*!
 *  获取磁盘可用大小
 *
 *  @return 磁盘可用大小
 */
+ (long long)lsf_freeDiskSpace
{
    NSError *error;
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    return [[fattributes objectForKey:NSFileSystemFreeSize] longLongValue];
}
@end
