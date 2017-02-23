//
//  LSFActionShowCollectionViewCell.m
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/23.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import "LSFActionShowCollectionViewCell.h"

@implementation LSFActionShowCollectionViewCell


- (void)setIconWithImageName:(NSString *)imageName
                       title:(NSString *)title{
    self.iconImageView.image = [UIImage imageNamed:imageName];
    self.titleLabel.text = title;
}
@end
