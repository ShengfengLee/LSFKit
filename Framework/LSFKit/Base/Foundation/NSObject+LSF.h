//
//  NSObject+LSF.h
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/16.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LSF)

/**
 *  判断对象是否为空
 *
 *  @return 返回值,NO表示该对象不为空,YES表示为空
 */
- (BOOL)lsf_isNull;

///exchange implementation of two methods
+ (void)lsf_hookMethod:(Class)myClass originalSelector:(SEL)origSel hookSelector:(SEL)hookSel;

@end
