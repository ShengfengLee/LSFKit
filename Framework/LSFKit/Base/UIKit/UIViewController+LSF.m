//
//  UIViewController+LSF.m
//  xReader-iOS
//
//  Created by lishengfeng on 2017/2/26.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import "UIViewController+LSF.h"

@implementation UIViewController (LSF)

/**
 判断页面DidDisappear时是 push进入还是pop退出
 
 @return YES表示是push， NO表示是pop退出
 */
- (BOOL)lsf_isPushWhenDidDisapperar{
    NSArray *viewControllers = self.navigationController.viewControllers;
    if (viewControllers.count > 1 && [viewControllers containsObject:self]) {
        //push
        return YES;
    }
    else{
        //pop
        return NO;
    }
}


///指定方向push页面
- (void)lsf_navigationPushViewController:(UIViewController *)viewController
                               direction:(LSFDirection)direction{
    
    
    //自定义切换动画效果
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.25];
    [animation setType:kCATransitionMoveIn];
    
    NSString *subtype;
    switch (direction) {
        case LSFDirectionRight:{
            subtype = kCATransitionFromRight;
            break;
        }
            
        case LSFDirectionLeft:{
            subtype = kCATransitionFromLeft;
            break;
        }
            
        case LSFDirectionBottom:{
            subtype = kCATransitionFromBottom;
            break;
        }
            
        default:{
            subtype = kCATransitionFromTop;
            break;
        }
    }
    [animation setSubtype:subtype];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
    
    [self.navigationController pushViewController:viewController animated:NO];
}

///指定方向pop页面
- (void)lsf_navigationPophViewControllerWithDirection:(LSFDirection)direction{
    
    
    //自定义切换动画效果
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.35];
    [animation setType:kCATransitionReveal];
    
    NSString *subtype;
    switch (direction) {
        case LSFDirectionRight:{
            subtype = kCATransitionFromRight;
            break;
        }
            
        case LSFDirectionLeft:{
            subtype = kCATransitionFromLeft;
            break;
        }
            
        case LSFDirectionTop:{
            subtype = kCATransitionFromTop;
            break;
        }
            
        default:{
            subtype = kCATransitionFromBottom;
            break;
        }
    }
    [animation setSubtype:subtype];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
    
    [self.navigationController popViewControllerAnimated:NO];
}
@end
