//
//  LSFViewController.m
//  LSFKit
//
//  Created by 李胜锋 on 2017/1/20.
//  Copyright © 2017年 ShengfengLee. All rights reserved.
//

#import "LSFViewController.h"

@interface LSFViewController ()

@end

@implementation LSFViewController

+ (instancetype)viewControllerWithStoryboardName:(NSString *)storyboardName
                                      identifier:(NSString *)identifier{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    return [storyboard instantiateViewControllerWithIdentifier:identifier];
}

+ (instancetype)viewControllerWithStoryboardName:(NSString *)storyboard{
    NSString *identifier = NSStringFromClass([self class]);
    return [self viewControllerWithStoryboardName:storyboard identifier:identifier];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.firstLoad = YES;
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    ///友盟页面统计
    //    NSString *classString = NSStringFromClass([self class]);
    //    [MobClick beginLogPageView:classString];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    ///友盟页面统计
    //    NSString *classString = NSStringFromClass([self class]);
    //    [MobClick endLogPageView:classString];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark - 右滑返回开关
- (void)setPopRecognizerEnable:(BOOL)popRecognizerEnable{
    UINavigationController *navigationController = self.navigationController;
    if ([navigationController isKindOfClass:[LSFNavigationController class]]) {
        LSFNavigationController *bbNavigation = (LSFNavigationController *)navigationController;
        bbNavigation.popRecognizer.enabled = popRecognizerEnable;
    }
    else{
        UIGestureRecognizer *popRecognizer = navigationController.interactivePopGestureRecognizer;
        popRecognizer.enabled = popRecognizerEnable;
    }
}

- (BOOL)popRecognizerEnable{
    UINavigationController *navigationController = self.navigationController;
    if ([navigationController isKindOfClass:[LSFNavigationController class]]) {
        LSFNavigationController *bbNavigation = (LSFNavigationController *)navigationController;
        return bbNavigation.popRecognizer.enabled;
    }
    else{
        UIGestureRecognizer *popRecognizer = navigationController.interactivePopGestureRecognizer;
        return popRecognizer.enabled;
    }
}

#pragma mark 旋转
// New Autorotation support. IOS(6_0);
- (BOOL)shouldAutorotate
{
    return NO;
}

//IOS(6_0)
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
    
}
//// Returns interface orientation masks. IOS(6_0);
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}


@end
