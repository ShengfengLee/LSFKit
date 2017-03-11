//
//  NSData+LSF.m
//  LSFKit
//
//  Created by 李胜锋 on 2017/1/21.
//  Copyright © 2017年 ShengfengLee. All rights reserved.
//

#import "NSData+LSF.h"

@implementation NSData (LSF)

///获取子data的range
- (NSRange)lsf_rangeofData:(NSData *)dataToFind{
    const void *bytes = [self bytes];
    NSUInteger length = [self length];
    
    const void *searchBytes = [dataToFind bytes];
    NSUInteger searchLength = [dataToFind length];
    NSUInteger searchIndex = 0;
    
    NSRange foundRange = {NSNotFound, searchLength};
    for (NSUInteger index = 0;  index < length; index++) {
        if ( ((char *)bytes)[index] == ((char *)searchBytes)[searchIndex]) {
            if (foundRange.location == NSNotFound) {
                foundRange.location = index;
            }
            searchIndex++;
            if (searchIndex >= searchLength) {
                return foundRange;
            }
        }
        else{
            searchIndex = 0;
            foundRange.location = NSNotFound;
        }
    }
    return foundRange;
}


///获取文件内容的编码格式
- (NSStringEncoding)getCharEncodingWithFilePath:(NSString *)filePath{
    NSStringEncoding encoding;
    NSError *error = nil;
    
    NSString *encodingString = [[NSString alloc] initWithContentsOfFile:filePath usedEncoding:&encoding error:&error];
    if (!error || !encodingString) {
        return encoding;
    }
    
    if ([[NSString alloc] initWithData:self encoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGBK_95)]) {
        return CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGBK_95);
    }
    
    if ([[NSString alloc] initWithData:self encoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_2312_80)]) {
        return CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_2312_80);
    }
    
    if ([[NSString alloc] initWithData:self encoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)]) {
        return CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    }
    
    return NSUTF8StringEncoding;
    
}
@end
