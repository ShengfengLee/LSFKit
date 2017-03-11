//
//  LSFActionShowCollectionViewCell.h
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/23.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSFActionShowCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


- (void)setIconWithImageName:(NSString *)imageName
                       title:(NSString *)title;
@end
