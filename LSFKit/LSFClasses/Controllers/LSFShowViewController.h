//
//  LSFShowViewController.h
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/22.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import "LSFViewController.h"


/**
 弹出框，加载在UIWindow上面，， 由下往上显示
 */
@interface LSFShowViewController : LSFViewController

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewBottomConstraint;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (nonatomic, strong) UIViewController *presentController;


@property (nonatomic, strong) UIView *superView;

- (void)show;

- (void)close;
@end
