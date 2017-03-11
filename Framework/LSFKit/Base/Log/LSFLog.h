//
//  LSFLog.h
//  LSFKit
//
//  Created by 李胜锋 on 2017/1/20.
//  Copyright © 2017年 ShengfengLee. All rights reserved.
//

#ifndef LSFLog_h
#define LSFLog_h

#import "LSFLogManager.h"

#ifdef DEBUG
#define LSFLogI(format, ...) \
do { \
NSLog(@"[INFO][%s-%d]: " format, __FUNCTION__, __LINE__, ##__VA_ARGS__); \
} while (0)

#define LSFLogD(format, ...) \
do { \
NSLog(@"[DEBUG][%s-%d]: " format, __FUNCTION__, __LINE__, ##__VA_ARGS__); \
} while (0)
#else
#define LSFLogD(format, ...)
#define LSFLogI(format, ...)
#endif

#define LSFLogW(format, ...) \
do { \
NSLog(@"[WARN][%s-%d]: " format, __FUNCTION__, __LINE__, ##__VA_ARGS__); \
} while (0)

#define LSFLogE(format, ...) \
do { \
NSLog(@"[ERROR][%s-%d]: " format, __FUNCTION__, __LINE__, ##__VA_ARGS__); \
} while (0)


#endif /* LSFLog_h */
