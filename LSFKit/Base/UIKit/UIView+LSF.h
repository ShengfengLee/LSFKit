//
//  UIView+LSF.h
//  xReader-iOS
//
//  Created by lishengfeng on 2017/2/25.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    ///左
    LSFCornerSideLeft,
    ///右
    LSFCornerSideRight,
    ///上
    LSFCornerSideUp,
    ///下
    LSFCornerSideBottom,
    ///左上角
    LSFCornerSideTopLeft,
    ///右上角
    LSFCornerSideTopRight,
    ///左下角
    LSFCornerSideBottomLeft,
    ///右下角
    LSFCornerSideBottomRight,
    
    ///所有
    LSFCornerSideAll
} LSFCornerSide;


@interface UIView (LSF)


/**
 设置UIView的圆角
 
 @param cornerRadius 圆角大小
 @param side 圆角放心
 */
- (void)lsf_cornerRadius:(CGFloat)cornerRadius roundSide:(LSFCornerSide)side;

@end
