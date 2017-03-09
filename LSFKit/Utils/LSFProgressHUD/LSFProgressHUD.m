//
//  LSFProgressHUD.m
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/27.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import "LSFProgressHUD.h"

#define k_lsf_pregress_hide_afterDelay 1.5

@implementation LSFProgressHUD

+ (instancetype)createProgressHUDWithMessage:(NSString *)message isWindow:(BOOL)isWindow{
    UIView *view;
    if (isWindow) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    else{
        view = [self getCurrentUIVC].view;
    }
    
    LSFProgressHUD *hud = [LSFProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message ? message : @"Loading...";
    hud.label.font = [UIFont systemFontOfSize:15];
    hud.removeFromSuperViewOnHide = YES;
    hud.dimBackground = NO;
    return hud;
}

#pragma mark
#pragma mark - show Tip
+ (void)lsf_showTipMessageInWindow:(NSString *)message{
    [self showTipMessage:message
                isWindow:YES
                    time:k_lsf_pregress_hide_afterDelay];
}

+ (void)lsf_showTipMessageInView:(NSString *)message{
    [self showTipMessage:message
                isWindow:NO
                    time:k_lsf_pregress_hide_afterDelay];
}

+ (void)lsf_showTipMessageInWindow:(NSString *)message
                      timeInterval:(NSTimeInterval)timeInterval{
    [self showTipMessage:message
                isWindow:YES
                    time:timeInterval];
}

+ (void)lsf_showTipMessageInView:(NSString *)message timeIntarval:(NSTimeInterval)timeInterval{
    [self showTipMessage:message
                isWindow:NO
                    time:timeInterval];
}

+ (void)showTipMessage:(NSString *)message
              isWindow:(BOOL)isWindow
                  time:(NSTimeInterval)timeInterval{
    GCDMain(^{
        
        LSFProgressHUD *hud = [self createProgressHUDWithMessage:message isWindow:isWindow];
        hud.mode = MBProgressHUDModeText;
        [hud hideAnimated:YES afterDelay:k_lsf_pregress_hide_afterDelay];
    });
    
}

#pragma mark
#pragma mark - activity mesage
+ (void)lsf_showActivityMessageInWindow:(NSString *)message{
    [self showActivityMessage:message
                     isWindow:YES
                 timeInterval:k_lsf_pregress_hide_afterDelay];
}

+ (void)lsf_showActivityMessageInView:(NSString *)message{
    [self showActivityMessage:message
                     isWindow:NO
                 timeInterval:k_lsf_pregress_hide_afterDelay];
}

+ (void)lsf_showActivityMessageInWindow:(NSString *)message timeInterval:(NSTimeInterval)timeInterval{
    
    [self showActivityMessage:message
                     isWindow:YES
                 timeInterval:timeInterval];
}

+ (void)lsf_showActivityMessageInView:(NSString *)message timeInterval:(NSTimeInterval)timeInterval{
    
    [self showActivityMessage:message
                     isWindow:NO
                 timeInterval:timeInterval];
}

+ (void)showActivityMessage:(NSString *)message isWindow:(BOOL)isWidnow timeInterval:(NSTimeInterval)timeInterval{
    
    GCDMain(^{
        LSFProgressHUD *hud = [self createProgressHUDWithMessage:message isWindow:isWidnow];
        hud.mode = MBProgressHUDModeIndeterminate;
        if (timeInterval > 0) {
            [hud hideAnimated:YES afterDelay:timeInterval];
        }
    });
    
}


#pragma mark
#pragma mark - custome icon
+ (void)lsf_showCustomIconInWindow:(NSString *)iconName message:(NSString *)message{
    
    [self showCustomIcon:iconName message:message isWindow:YES];
}

+ (void)lsf_showCustomIconInView:(NSString *)iconName message:(NSString *)message{
    
    [self showCustomIcon:iconName message:message isWindow:NO];
}

+ (void)showCustomIcon:(NSString *)iconName message:(NSString *)message isWindow:(BOOL)isWindow{
    
    UIImage *image = [UIImage imageNamed:iconName];
    if (!image) {
        [self showTipMessage:message
                    isWindow:isWindow
                        time:k_lsf_pregress_hide_afterDelay];
    }
    else {
        
        LSFProgressHUD *hud = [self createProgressHUDWithMessage:message isWindow:isWindow];
        
        hud.mode = MBProgressHUDModeCustomView;
        hud.customView = [[UIImageView alloc] initWithImage:image];
        [hud hideAnimated:YES afterDelay:k_lsf_pregress_hide_afterDelay];
    }
}


+ (void)lsf_hideHUD{
    UIView  *winView =(UIView *)[UIApplication sharedApplication].delegate.window;
    [self hideHUDForView:winView animated:YES];
    [self hideHUDForView:[self getCurrentUIVC].view animated:YES];

}


//获取当前屏幕显示的viewcontroller
+(UIViewController *)getCurrentWindowVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tempWindow in windows)
        {
            if (tempWindow.windowLevel == UIWindowLevelNormal)
            {
                window = tempWindow;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
    {
        result = nextResponder;
    }
    else
    {
        result = window.rootViewController;
    }
    return  result;
}
+(UIViewController *)getCurrentUIVC
{
    UIViewController  *superVC = [[self class]  getCurrentWindowVC ];
    
    if ([superVC isKindOfClass:[UITabBarController class]]) {
        
        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
        
        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    }
    return superVC;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
