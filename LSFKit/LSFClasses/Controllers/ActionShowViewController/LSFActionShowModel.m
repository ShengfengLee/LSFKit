//
//  LSFActionShowModel.m
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/23.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import "LSFActionShowModel.h"

@implementation LSFActionShowModel


+ (instancetype)actionWithType:(LSFActionShowType)type{
    LSFActionShowModel *model = [[LSFActionShowModel alloc] init];
    model.type = type;
    
    switch (type) {
        case LSFActionShowType_Report:
        {
            model.name = @"Report";
            model.iconImageName = @"share_More";
            break;
        }
            
            
        case LSFActionShowType_Bookmark:
        {
            model.name = @"Book";
            model.iconImageName = @"share_bookmark";
            break;
        }
            
        case LSFActionShowType_Comments:
        {
            model.name = @"Comments";
            model.iconImageName = @"share_Comments";
            break;
        }
            
        case LSFActionShowType_BookReview:
        {
            model.name = @"BookReview";
            model.iconImageName = @"share_Book comments";
            break;
        }
            
        case LSFActionShowType_Twitter:
        {
            model.name = @"Twitter";
            model.iconImageName = @"share_twitter";
            break;
        }
            
        case LSFActionShowType_Facebook:
        {
            model.name = @"Facebook";
            model.iconImageName = @"share_facebook";
            break;
        }
            
            
        case LSFActionShowType_WechatSession:
        {
            model.name = @"WechatSession";
            model.iconImageName = @"share_facebook";
            break;
        }
            
            
        case LSFActionShowType_WechatTimeLine:
        {
            model.name = @"WechatTimeLine";
            model.iconImageName = @"share_facebook";
            break;
        }
            
            
        case LSFActionShowType_QQ:
        {
            model.name = @"QQ";
            model.iconImageName = @"share_facebook";
            break;
        }
            
            
        case LSFActionShowType_QZone:
        {
            model.name = @"QZone";
            model.iconImageName = @"share_facebook";
            break;
        }
            
            
        case LSFActionShowType_Sina:
        {
            model.name = @"Sina";
            model.iconImageName = @"share_facebook";
            break;
        }
            
            
        default:
            break;
    }
    
    
    return model;
}
@end
