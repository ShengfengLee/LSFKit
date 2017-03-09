//
//  LSFActionShowModel.h
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/23.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    LSFActionShowType_Bookmark,
    LSFActionShowType_BookReview,
    LSFActionShowType_Comments,
    LSFActionShowType_Report,
    LSFActionShowType_Facebook,
    LSFActionShowType_Twitter,
    LSFActionShowType_WechatSession,    //微信好友
    LSFActionShowType_WechatTimeLine,   //微信朋友圈
    LSFActionShowType_QQ,   //QQ
    LSFActionShowType_QZone, //QQ空间
    LSFActionShowType_Sina, //新浪
} LSFActionShowType;

@interface LSFActionShowModel : NSObject

@property (nonatomic, copy) NSString *iconImageName;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) LSFActionShowType type;

+ (instancetype)actionWithType:(LSFActionShowType)type;

@end
