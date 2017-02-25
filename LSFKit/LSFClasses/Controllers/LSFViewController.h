//
//  LSFViewController.h
//  LSFKit
//
//  Created by 李胜锋 on 2017/1/20.
//  Copyright © 2017年 ShengfengLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSFNavigationController.h"

///方向
typedef enum : NSUInteger {
    LSFDirectionTop,
    LSFDirectionLeft,
    LSFDirectionRight,
    LSFDirectionBottom
} LSFDirection;

@interface LSFViewController : UIViewController

///是否允许右滑返回
@property (nonatomic, assign) BOOL popRecognizerEnable;
@property (nonatomic, assign, getter=isFirstLoad) BOOL firstLoad;

+ (instancetype)viewControllerWithStoryboardName:(NSString *)storyboard
                                      identifier:(NSString *)identifier;

+ (instancetype)viewControllerWithStoryboardName:(NSString *)storyboard;


@end
