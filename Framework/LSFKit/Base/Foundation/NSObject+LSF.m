//
//  NSObject+LSF.m
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/16.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import "NSObject+LSF.h"
#import <objc/runtime.h>

@implementation NSObject (LSF)


/**
 *  判断对象是否为空
 *
 *  @return 返回值,NO表示该对象不为空,YES表示为空
 */
- (BOOL)lsf_isNull{
    // 判断是否为空
    if ([self isEqual:[NSNull null]]) {
        return YES;
    }
    else if ([self isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    else if (self == nil){
        return YES;
    }else if ([self isKindOfClass:[NSString class]]){
        NSString *stng = (NSString *)self;
        if ([stng isEqualToString:@"(null)"] ||
            [stng isEqualToString:@"<null>"] ||
            [stng isEqualToString:@"<nil>"] ||
            [stng isEqualToString:@""]) {
            return YES;
        }
    }
    return NO;
}


///exchange implementation of two methods
+ (void)lsf_hookMethod:(Class)myClass originalSelector:(SEL)origSel hookSelector:(SEL)hookSel{
    Method origMethod = class_getInstanceMethod(myClass, origSel);
    Method hookMethod = class_getInstanceMethod(myClass, hookSel);
    
    //class_addMethod will fail if original method already exists
    BOOL didAddMethod = class_addMethod(myClass, origSel, method_getImplementation(hookMethod), method_getTypeEncoding(hookMethod));
    if (didAddMethod) {
        class_replaceMethod(myClass, hookSel, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    }
    else{
        //origMethod and swizMethod already exist
        method_exchangeImplementations(origMethod, hookMethod);
    }
}
@end
