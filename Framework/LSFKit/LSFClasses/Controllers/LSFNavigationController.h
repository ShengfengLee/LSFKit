//
//  LSFNavigationController.h
//  LSFKit
//
//  Created by 李胜锋 on 2017/1/20.
//  Copyright © 2017年 ShengfengLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSFNavigationController : UINavigationController

@property (nonatomic ,strong) UIPanGestureRecognizer *popRecognizer;
@property (nonatomic ,strong) id popRecognizerTarget;
@property (nonatomic ,assign) SEL popRecognizerHandleTransition;

@end
