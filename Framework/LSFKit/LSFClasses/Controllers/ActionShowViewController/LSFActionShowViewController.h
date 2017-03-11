//
//  LSFActionShowViewController.h
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/23.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import "LSFShowViewController.h"
#import "LSFActionShowModel.h"


@interface LSFActionShowViewController : LSFShowViewController

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, copy) void (^selectCompleteHandel)(LSFActionShowModel *model);

+ (instancetype)actionShowViewCotroller;

+ (instancetype)actionShowViewControllerArray:(NSArray *)array
                            presentController:(UIViewController *)presentController;
@end
