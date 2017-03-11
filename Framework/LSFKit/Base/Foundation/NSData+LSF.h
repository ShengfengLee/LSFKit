//
//  NSData+LSF.h
//  LSFKit
//
//  Created by 李胜锋 on 2017/1/21.
//  Copyright © 2017年 ShengfengLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (LSF)


///获取子data的range
- (NSRange)lsf_rangeofData:(NSData *)dataToFind;

///获取文件内容的编码格式
- (NSStringEncoding)getCharEncodingWithFilePath:(NSString *)filePath;
@end
