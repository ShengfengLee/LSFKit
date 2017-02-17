//
//  BBDateUtils.m
//  BBTools
//
//  Created by 李胜锋 on 16/8/1.
//  Copyright © 2016年 YouShiXiu. All rights reserved.
//

#import "NSDate+LSF.h"

@implementation NSDate (LSF)


/**
 *  将时长转换成字符串格式，
 *  小于一小时，返回“00:00”
 *  大于一小时返回"00:00:00"
 *
 *  @param interval 时长
 *
 *  @return 时长字符串
 */
+ (NSString *)lsf_durationStringWithTimeInterval:(NSTimeInterval)interval{
    //四舍五入
    int totalTime = round(interval);
    int hour = totalTime / 3600;
    int min = totalTime % 3600 / 60;
    int second = totalTime % 60;
    
    NSString *resultStr = nil;
    if (hour <= 0) {
        resultStr = [NSString stringWithFormat:@"%02d:%02d", min, second];
    }
    else if (hour > 60) {
        resultStr = [NSString stringWithFormat:@"%d:%02d:%02d", hour, min, second];
    }
    else
    {
        resultStr = [NSString stringWithFormat:@"%02d:%02d:%02d", hour, min, second];
    }
    
    return resultStr;
}


/**
 *  根据指定格式获取日期字符串
 *
 *  @param date   日期
 *  @param format 格式化字符串
 *
 *  @return 字符串
 */
+ (NSString *)lsf_stringFromDate:(NSDate *)date
                        formate:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:date];
}

/**
 *  根据时间戳生成日期字符串
 *
 *  @param timeInterval       服务器返回的时间戳
 *  @param dateFormat 时间格式
 *
 *  @return 时间字符串
 */
+ (NSString *)lsf_dateFormatStringWithTimeInterval:(NSTimeInterval)timeInterval
                                       dateFormat:(NSString *)dateFormat{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    return [self lsf_stringFromDate:date formate:dateFormat];
}

/*!
 *  根据时间戳生成日期字符串，格式为yyyyMMdd HH:mm
 *
 *  @param timeInterval 服务器返回的时间戳
 *
 *  @return 时间字符串
 */
+ (NSString *)lsf_dateFormatStringWithTimeInterval:(NSTimeInterval)timeInterval{
    return [self lsf_dateFormatStringWithTimeInterval:timeInterval dateFormat:@"yyyyMMdd  HH:mm"];
}


/**
 *  获取当前时间字符串
 *
 *  @param format 字符串格式
 *
 *  @return 返回当前时间字符串
 */
+ (NSString *)lsf_stringByNowWithFormate:(NSString *)format{
    NSDate *date = [NSDate date];
    return [self lsf_stringFromDate:date formate:format];
}

/**
 *  根据月、日获取星座
 *
 *  @param month 月份
 *  @param day   日
 *
 *  @return 星座
 */
+ (NSString *)lsf_getAstroWithMonth:(NSInteger)month day:(NSInteger)day{
    NSString *astroString = @"魔羯水瓶双鱼白羊金牛双子巨蟹狮子处女天秤天蝎射手魔羯";
    NSString *astroFormat = @"102123444543";
    NSString *result;
    
    if (month < 1||month > 12||day < 1||day > 31){
        return nil;//@"错误日期格式!";
    }
    
    if(month==2 && day>29)
    {
        return nil;//@"错误日期格式!!";
    }else if(month==4 || month==6 || month==9 || month==11) {
        
        if (day>30) {
            return nil;//@"错误日期格式!!!";
        }
    }
    
    result=[NSString stringWithFormat:@"%@",[astroString substringWithRange:NSMakeRange(month*2-(day < [[astroFormat substringWithRange:NSMakeRange((month-1), 1)] intValue] - (-19))*2,2)]];
    
    return result;
}

/**
 *  根据日期时间戳获取星座
 *
 *  @param timeInterval 日期时间戳
 *
 *  @return 星座
 */
+ (NSString *)lsf_getAstroWithTimeInterval:(NSTimeInterval)timeInterval{
    // 1.获得年月日
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitHour |NSCalendarUnitMinute;
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateComponents *cmpTime = [calendar components:unitFlags fromDate:date];
    NSInteger month = [cmpTime month];
    NSInteger day = [cmpTime day];
    
    return [self lsf_getAstroWithMonth:month day:day];
}

/**
 *  根据时间戳计算年龄
 *
 *  @param timeInterval 时间戳
 *
 *  @return 年龄
 */
+ (NSInteger)lsf_getAgeWithTimeInterval:(NSTimeInterval)timeInterval{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSTimeInterval dateDiff = 0 - [date timeIntervalSinceNow];
    
    NSInteger age = trunc(dateDiff/(60*60*24))/365;
    return age;
}

/*!
 *  动态时间格式化转换方法，发布时间
 *
 *  @param timeInterval 服务器返回的时间戳
 *
 *  @return 时间字符串
 */
+ (NSString *)lsf_dynamicDateFormatStringWithTimeInterval:(NSTimeInterval)timeInterval{
    NSString *resultString;
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    NSDate *now = [NSDate date];
    NSTimeInterval nowTimeInterval = [now timeIntervalSinceDate:date];
    
    if (nowTimeInterval <= 60) {
        resultString = @"刚刚发布";
    }
    
    //60分钟以内
    else if (nowTimeInterval < 60 * 60)
    {
        int intTime = (int)nowTimeInterval;
        resultString = [NSString stringWithFormat:@"%d分钟前", intTime /60];
    }
    
    //24小时以内
    else if (nowTimeInterval < 60 * 60 * 24){
        int intTime = (int)nowTimeInterval;
        resultString = [NSString stringWithFormat:@"%d小时前", intTime / 3600];
    }
    
    //30天以内
    else if (nowTimeInterval < 60 * 60 * 24 * 30){
        
        int intTime = (int)nowTimeInterval;
        resultString = [NSString stringWithFormat:@"%d天前", intTime / (3600 * 24)];
    }
    
    else
    {
        
        // 1.获得年月日
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSUInteger unitFlags = NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitHour |NSCalendarUnitMinute;
        NSDateComponents *cmpTime = [calendar components:unitFlags fromDate:date];
        NSDateComponents *cmpNow = [calendar components:unitFlags fromDate:[NSDate date]];
        
        // 2.格式化日期
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        
        
        //今年
        if ([cmpTime year] == [cmpNow year]) {
            //今天
            if (([cmpTime month] == [cmpTime month]) && ([cmpTime day] == [cmpNow day])) {
                formatter.dateFormat  = @"今天 HH:mm";
            }
            
            //今年
            else
            {
                formatter.dateFormat = @"MM月dd日 HH:mm";
            }
        }
        else
        {
            formatter.dateFormat = @"yyyy-MM-dd HH:mm";
        }
        
        resultString = [formatter stringFromDate:date];
    }
    
    
    
    return resultString;
}
@end
