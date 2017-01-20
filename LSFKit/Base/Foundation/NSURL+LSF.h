//
//  NSURL+LSF.h
//  LSFKit
//
//  Created by 李胜锋 on 2017/1/20.
//  Copyright © 2017年 ShengfengLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (LSF)

- (void)lsf_parseWithHost:(NSString **)host
                   scheme:(NSString **)scheme
                parameter:(NSString **)parameter
                    query:(NSDictionary **)query;
/**
 *  解析HTTP请求的URL，获取GET方法的参数
 *
 *  @return 参数集合，返回NSDictionary
 */
- (NSDictionary *)lsf_parseParameters;

/**
 *  根据参数名获取参数数值
 *
 *  @param parameterKey 参数名key
 *
 *  @return 参数值
 */
- (NSString *)lsf_valueForParameterKey:(NSString *)parameterKey;


@end
