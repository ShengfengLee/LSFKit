//
//  UIViewController+LSF.h
//  xReader-iOS
//
//  Created by lishengfeng on 2017/2/26.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import <UIKit/UIKit.h>


///方向
typedef enum : NSUInteger {
    LSFDirectionTop,
    LSFDirectionLeft,
    LSFDirectionRight,
    LSFDirectionBottom
} LSFDirection;

@interface UIViewController (LSF)


/**
 判断页面DidDisappear时是 push进入还是pop退出
 
 @return YES表示是push， NO表示是pop退出
 */
- (BOOL)lsf_isPushWhenDidDisapperar;

///指定方向push页面
- (void)lsf_navigationPushViewController:(UIViewController *)viewController
                           direction:(LSFDirection)direction;

///指定方向pop页面
- (void)lsf_navigationPophViewControllerWithDirection:(LSFDirection)direction;
@end
