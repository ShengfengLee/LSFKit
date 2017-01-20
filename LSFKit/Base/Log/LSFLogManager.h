//
//  LSFLogManager.h
//  LSFKit
//
//  Created by 李胜锋 on 2017/1/20.
//  Copyright © 2017年 ShengfengLee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define BBLOG_FILENAME         @"ShengfengLee.log"
#define BBLOG_FILE_MAX_SIZE    (1024 * 1024 * 2)

@interface LSFLogManager : NSObject

///日志文件路径
@property (nonatomic, copy) NSString *logFilePath;
+ (id)logManagerDefault;

- (void)limitLogFileSize;
- (void)redirectPrintToLogFile;
- (void)redirectPrintToLogFile:(NSString *)filePath;

@end
