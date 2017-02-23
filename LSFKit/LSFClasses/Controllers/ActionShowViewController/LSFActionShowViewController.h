//
//  LSFActionShowViewController.h
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/23.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import "LSFShowViewController.h"
#import "LSFActionShowModel.h"

/**
 
 调用方法
 LSFActionShowModel *weixin = [[LSFActionShowModel alloc] init];
 weixin.name = @"微信";
 weixin.iconImageName = @"Facebook";
 weixin.tag = 1;
 
 LSFActionShowModel *qq = [[LSFActionShowModel alloc] init];
 qq.name = @"QQ";
 qq.iconImageName = @"Twitter";
 qq.tag = 2;
 
 LSFActionShowModel *facebook = [[LSFActionShowModel alloc] init];
 facebook.name = @"Facebook Facebook";
 facebook.iconImageName = @"Facebook";
 facebook.tag = 3;
 
 LSFActionShowModel *twitter = [[LSFActionShowModel alloc] init];
 twitter.name = @"Twitter";
 twitter.iconImageName = @"Twitter";
 twitter.tag = 3;
 
 LSFActionShowModel *twitter1 = [[LSFActionShowModel alloc] init];
 twitter1.name = @"Facebook";
 twitter1.iconImageName = @"Facebook";
 twitter1.tag = 3;
 
 ///每行显示元素
 NSArray *arr = @[weixin, qq, facebook, twitter, twitter1];
 
 ///总共显示两行
 NSArray *array = @[arr, arr];
 LSFActionShowViewController *viewController = [LSFActionShowViewController actionShowViewControllerArray:array presentController:self];
 [viewController show];
 */
@interface LSFActionShowViewController : LSFShowViewController

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, copy) void (^selectCompleteHandel)(LSFActionShowModel *model);

+ (instancetype)actionShowViewCotroller;

+ (instancetype)actionShowViewControllerArray:(NSArray *)array
                            presentController:(UIViewController *)presentController;
@end
