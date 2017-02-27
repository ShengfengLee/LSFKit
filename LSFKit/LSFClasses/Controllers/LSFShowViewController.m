//
//  LSFShowViewController.m
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/22.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import "LSFShowViewController.h"

@interface LSFShowViewController ()


@property (nonatomic, strong) UIWindow *window;

@end

@implementation LSFShowViewController


- (void)dealloc
{
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self.view layoutIfNeeded];
    self.contentViewBottomConstraint.constant = 0;
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.window resignKeyWindow];
}

- (void)show{
    
    self.view.frame = self.superView.bounds;
    [self.superView addSubview:self.view];
    [self.presentController addChildViewController:self];
    
}


- (void)close{
    self.contentViewBottomConstraint.constant = 0 - CGRectGetHeight(self.contentView.frame);
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        if (finished) {
            [self.view removeFromSuperview];
            
            [self removeFromParentViewController];
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.contentViewBottomConstraint.constant = 0 - CGRectGetHeight(self.contentView.frame);
    
    UITapGestureRecognizer *backTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
    [self.backView addGestureRecognizer:backTap];
    
    if (!self.superView) {
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.window.windowLevel = UIWindowLevelAlert;
        
        [self.window makeKeyAndVisible];
        self.superView = self.window;
    }
}



//- (UIWindow *)window{
//    if (!_window) {
//        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//        _window.windowLevel = UIWindowLevelAlert;
//    }
//    return _window;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
