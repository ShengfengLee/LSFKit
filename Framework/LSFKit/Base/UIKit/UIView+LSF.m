//
//  UIView+LSF.m
//  xReader-iOS
//
//  Created by lishengfeng on 2017/2/25.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import "UIView+LSF.h"

@implementation UIView (LSF)


/**
 设置UIView的圆角

 @param cornerRadius 圆角大小
 @param side 圆角放心
 */
- (void)lsf_cornerRadius:(CGFloat)cornerRadius roundSide:(LSFCornerSide)side
{
    UIBezierPath *maskPath;
    
    UIRectCorner corners;
    
    switch (side) {
        case LSFCornerSideUp:{
            corners = UIRectCornerTopLeft | UIRectCornerTopRight;
            break;
        }
            
        case LSFCornerSideLeft:{
            corners = UIRectCornerTopLeft | UIRectCornerBottomLeft;
            break;
        }
            
        case LSFCornerSideRight:{
            corners = UIRectCornerTopRight | UIRectCornerBottomRight;
            break;
        }
            
        case LSFCornerSideBottom:{
            corners = UIRectCornerBottomRight | UIRectCornerBottomLeft;
            break;
        }
            
        case LSFCornerSideTopLeft:{
            corners = UIRectCornerTopLeft;
            break;
        }
            
        case LSFCornerSideTopRight:{
            corners = UIRectCornerTopRight;
            break;
        }
            
        case LSFCornerSideBottomLeft:{;
            corners = UIRectCornerBottomLeft;
            break;
        }
            
        case LSFCornerSideBottomRight:{
            corners = UIRectCornerBottomRight;
            break;
        }
            
        case LSFCornerSideAll:{
            corners = UIRectCornerAllCorners;
            break;
        }
        default:
            break;
    }
    
    
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:corners
                                           cornerRadii:CGSizeMake(cornerRadius,
                                                                  cornerRadius)];
    
    // Create the shape layer and set its path
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    
    // Set the newly created shape layer as the mask for the image view's layer
    self.layer.mask = maskLayer;
    
    [self.layer setMasksToBounds:YES];
}


@end
