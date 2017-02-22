//
//  LSFPlaceholderTextView.h
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/22.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSFPlaceholderTextView : UITextView

@property (nullable, nonatomic, strong) UILabel *placeholderLabel;

@property (nonatomic, assign) UIEdgeInsets placeholderEdgeInsets;

@property(nullable, nonatomic, copy) NSString *placeholder;

@end
