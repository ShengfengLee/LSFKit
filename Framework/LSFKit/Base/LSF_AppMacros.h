//
//  LSF_AppMacros.h
//  LSFKit
//
//  Created by 李胜锋 on 2017/1/20.
//  Copyright © 2017年 ShengfengLee. All rights reserved.
//

#ifndef LSF_AppMacros_h
#define LSF_AppMacros_h

#ifndef LSF_FIX_CATEGORY_BUG
///修复category不能加载的bug
#define LSF_FIX_CATEGORY_BUG(name) @interface LSF_FIX_CATEGORY_BUG_##name : NSObject @end \
@implementation LSF_FIX_CATEGORY_BUG_##name @end

#endif

//应用名称
#define kAPPName                [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleDisplayName"]

//版本号
#define kAppVersion             [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//Build版本号
#define kBuildVersion             [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleVersion"]

//Bundle identifier
#define kAppBundleID             [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleIdentifier"]

///屏幕尺寸
#define kScreenWidth          ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight         ([UIScreen mainScreen].bounds.size.height)

//iOS系统版本号
#define kSystemVersion   ([[UIDevice currentDevice] systemVersion])
#define IOS_Version ([kSystemVersion floatValue])
#define IOS7_OR_LATER   (IOS_Version >= 7.0) //ios 7
#define IOS8_OR_LATER   (IOS_Version >= 8.0) //ios 8
#define IOS9_OR_LATER   (IOS_Version >= 9.0) //ios 9
#define IOS10_OR_LATER   (IOS_Version >= 10.0) //ios 10

//获取用户的语言偏好设置列表
#define kCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

#define IsRetina    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

//判断是ipad 还是 iphone
#define IsPad       (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IsIPhone    (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)


///GCD，获取一个全局队列
#define GCDBackground(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)

//主线程
#define GCDMain(block)       (dispatch_async(dispatch_get_main_queue(),block))

///延迟处理
#define GCDAfter(seconds, block) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)( seconds * NSEC_PER_SEC)),dispatch_get_main_queue(), block)


#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

//16进制RGB颜色转换
#define RGBTO16COLOR(rgb) [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0 green:((float)((rgb & 0xFF00) >> 8))/255.0 blue:((float)(rgb & 0xFF))/255.0 alpha:1.0]

#define RGBATO16COLOR(rgb,alphaValue) [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0 green:((float)((rgb & 0xFF00) >> 8))/255.0 blue:((float)(rgb & 0xFF))/255.0 alpha:1.0]


///id对象与NSData之间转换
#define kObjectToData(object)   [NSKeyedArchiver archivedDataWithRootObject:object]
#define kDataToObject(data)     [NSKeyedUnarchiver unarchiveObjectWithData:data]


///单例宏定义
//.h 文件中申明
#define singletion_interface + (instancetype)shareInstance;

// .m文件中实现
#define singletion_implementation(class) \
static class *_instance;    \
\
+ (id)allocWithZone:(struct _NSZone *)zone{ \
    static dispatch_once_t onceToken;   \
    dispatch_once(&onceToken, ^{    \
        _instance = [super allocWithZone:zone]; \
    }); \
\
    return _instance;   \
}   \
\
+ (instancetype)shareInstance{   \
    if (_instance == nil) { \
        _instance == [[class alloc] init];  \
    }   \
\
    return _instance;   \
}



#endif /* LSF_AppMacros_h */
