//
//  LSFLogManager.m
//  LSFKit
//
//  Created by 李胜锋 on 2017/1/20.
//  Copyright © 2017年 ShengfengLee. All rights reserved.
//

#import "LSFLogManager.h"

@implementation LSFLogManager


- (id)init
{
    if (!(self = [super init])) {
        return self;
    }
    
    _logFilePath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:BBLOG_FILENAME];
    [self limitLogFileSize];
    [self redirectPrintToLogFile];
    return self;
}

+ (id)logManagerDefault
{
    static LSFLogManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)limitLogFileSize
{
    NSFileManager *filemanager = [[NSFileManager alloc] init];
    if (![filemanager fileExistsAtPath:_logFilePath]) {
        return;
    }
    
    NSFileHandle *file = [NSFileHandle fileHandleForUpdatingAtPath:_logFilePath];
    [file synchronizeFile];
    [file seekToEndOfFile];
    unsigned long long fileSize = [file offsetInFile];
    if (fileSize > BBLOG_FILE_MAX_SIZE) {
        [file seekToFileOffset:(fileSize / 100 * 95)];
        NSData *data = [file readDataToEndOfFile];
        [file truncateFileAtOffset:0];
        [file writeData:data];
    }
    [file closeFile];
    return;
}

- (void)redirectPrintToLogFile
{
    // Device connect with xcode
    if (isatty(STDOUT_FILENO)) {
        return;
    }
    // Simulator
    UIDevice *device = [UIDevice currentDevice];
    if([[device model] hasSuffix:@"Simulator"]) {
        return;
    }
    // Redirect
    freopen([_logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stdout);
    freopen([_logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stderr);
}

- (void)redirectPrintToLogFile:(NSString *)filePath
{
    _logFilePath = filePath;
    [self redirectPrintToLogFile];
}



@end
