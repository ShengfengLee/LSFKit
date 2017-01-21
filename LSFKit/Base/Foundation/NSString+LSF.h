//
//  NSString+LSF.h
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/1/21.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LSF)


//清除空格
- (NSString *)lsf_stringByClearSpace;

/*!
 *  清除首尾空格
 *
 *  @return string
 */
- (NSString *)lsf_stringByTrimmingSpace;

//清除空格
+ (NSString *)bb_stringByClearSpaceWithString:(NSString *)string;

///阿拉伯数字替换成中文字符
-(NSString*)lsf_replaceNumbersWithChineseChar;

///字符串中所有阿拉伯数字替换成中文字符
-(NSString*)lsf_replaceNumberStringWhenAllDiscoverToChineseChar;
@end
