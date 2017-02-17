//
//  LSFNetworkConfig.m
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/16.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import "LSFNetworkConfig.h"


@interface LSFNetworkConfig ()


@property (nonatomic, copy, readwrite) AFSecurityPolicy *securityPolicy;

@end

@implementation LSFNetworkConfig

singletion_implementation(LSFNetworkConfig)

//服务器地址
- (NSString *)apiHost
{
    if (!_apiHost) {
        //先从本地配置文件读取
        
        NSDictionary *apiHostDic = [self serverFromLocalPlist];
        NSString *apiHost = [apiHostDic objectForKey:@"ApiUrl"];
        if (apiHost.length) {
            _apiHost = apiHost;
        }
        
        //从info.plist文件中读取
        else{
            
            NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
            NSString *apiUrl = [infoDictionary objectForKey:@"ApiUrl"];
            
            //如果有配置路径，
            if (![apiUrl length]) {
                apiUrl = _defaultApiHost;
            }
            
            _apiHost = apiUrl;
        }
        
        
    }
    return _apiHost;
}


- (NSString *)wapHost
{
    if (!_wapHost) {
        //先从本地配置文件读取
        
        NSDictionary *wapURLDic = [self serverFromLocalPlist];
        NSString *wapUrl = [wapURLDic objectForKey:@"WapUrl"];
        if (wapUrl.length) {
            _wapHost = wapUrl;
        }
        
        //从info.plist文件中读取
        else{
            NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
            wapUrl = [infoDictionary objectForKey:@"WapUrl"];
            
            //如果有配置路径，
            if (![wapUrl length]) {
                wapUrl = _defaultWapHost;
            }
            
            _wapHost = wapUrl;
            
        }
    }
    return _wapHost;
}

//从本地文件中读取域名
- (NSDictionary *)serverFromLocalPlist{
    //获取Documents目录路径的方法：
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];;
    
    path = [path stringByAppendingPathComponent:@"server.plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL hasFile = [fileManager fileExistsAtPath:path];
    if (hasFile) {
        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
        return dic;
    }
    return nil;
}


/**
 设置证书文件路径，同时初始化 securityPolicy

 @param cerFilePath 文件路径
 */
- (void)setCerFilePath:(NSString *)cerFilePath{
    _cerFilePath = cerFilePath;
    self.securityPolicy = nil;
    
    if (_cerFilePath) {
        return;
    }
    
    NSData *certData = [NSData dataWithContentsOfFile:_cerFilePath];
    
    //AFSSLPinningModeCertificate 使用证书验证模式
    self.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    //allowINvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    //如果是需要验证自建证书， 需要设置为YES
    self.securityPolicy.allowInvalidCertificates = YES;
    
    self.securityPolicy.validatesDomainName = NO;
    NSSet *set = [[NSSet alloc] initWithObjects:certData, nil];
    self.securityPolicy.pinnedCertificates = set;
    
}


@end
