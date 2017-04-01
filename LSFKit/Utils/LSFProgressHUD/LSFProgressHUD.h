//
//  LSFProgressHUD.h
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/27.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface LSFProgressHUD : MBProgressHUD


+ (void)lsf_showActivityInView:(UIView *)view;
+ (void)lsf_showActivity;

+ (void)lsf_showTipMessageInWindow:(NSString *)message;
+ (void)lsf_showTipMessageInView:(NSString *)message;
+ (void)lsf_showTipMessageInWindow:(NSString *)message timeInterval:(NSTimeInterval)timeInterval;
+ (void)lsf_showTipMessageInView:(NSString *)message timeIntarval:(NSTimeInterval)timeInterval;

+ (void)lsf_showActivityMessageInWindow:(NSString *)message;
+ (void)lsf_showActivityMessageInView:(NSString *)message;
+ (void)lsf_showActivityMessageInWindow:(NSString *)message timeInterval:(NSTimeInterval)timeInterval;
+ (void)lsf_showActivityMessageInView:(NSString *)message timeInterval:(NSTimeInterval)timeInterval;

+ (void)lsf_showCustomIconInWindow:(NSString *)iconName message:(NSString *)message;
+ (void)lsf_showCustomIconInView:(NSString *)iconName message:(NSString *)message;

+ (void)lsf_hideHUD;

@end
