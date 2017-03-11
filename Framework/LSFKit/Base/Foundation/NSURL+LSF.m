//
//  NSURL+LSF.m
//  LSFKit
//
//  Created by 李胜锋 on 2017/1/20.
//  Copyright © 2017年 ShengfengLee. All rights reserved.
//

#import "NSURL+LSF.h"

@implementation NSURL (LSF)

- (void)lsf_parseWithHost:(NSString **)host
                   scheme:(NSString **)scheme
                parameter:(NSString **)parameter
                    query:(NSDictionary **)query{
    NSURL *url = self;
    
    if ([url isKindOfClass:[NSString class]]) {
        url = [NSURL URLWithString:(NSString *)url];
    }
    
    if ([url scheme]) {
        *scheme = [url scheme];
    }
    
    
    if ([url host]) {
        *host = [url host];
    }
    
    if ([url parameterString]) {
        *parameter = [url parameterString];
    }
    
    if ([url query]) {
        //        NSString *queryString = [url query];
        *query = [self lsf_parseParameters];
    }
}

/**
 *  解析HTTP请求的URL，获取GET方法的参数
 *
 *  @return 参数集合，返回NSDictionary
 */
- (NSDictionary *)lsf_parseParameters{
    NSString *urlString;
    NSURL *url = self;
    if ([url isKindOfClass:[NSURL class]]) {
        urlString = url.absoluteString;
    }
    
    else if ([url isKindOfClass:[NSString class]]){
        urlString = (NSString *)url;
    }
    
    //根据 ? 和 & 来分割URL
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"?&"];
    NSArray *array = [urlString componentsSeparatedByCharactersInSet:set];
    
    if (!array.count) {
        return nil;
    }
    
    NSMutableDictionary *mutableDic = [NSMutableDictionary dictionary];
    
    for (NSString *string in array) {
        NSArray *parameters = [string componentsSeparatedByString:@"="];
        if (parameters.count == 2) {
            NSString *key = parameters[0];
            NSString *value = parameters[1];
            if (key.length && value.length) {
                [mutableDic setObject:parameters[1] forKey:parameters[0]];
            }
            
        }
    }
    
    return mutableDic;
}

/**
 *  根据参数名获取参数数值
 *
 *  @param parameterKey 参数名key
 *
 *  @return 参数值
 */
- (NSString *)lsf_valueForParameterKey:(NSString *)parameterKey{
    
    return [[self lsf_parseParameters] objectForKey:parameterKey];
}
@end
