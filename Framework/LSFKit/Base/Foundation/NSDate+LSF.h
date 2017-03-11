//
//  BBDateUtils.h
//  BBTools
//
//  Created by 李胜锋 on 16/8/1.
//  Copyright © 2016年 YouShiXiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (LSF)


/**
 *  将时长转换成字符串格式，
 *  小于一小时，返回“00:00”
 *  大于一小时返回"00:00:00"
 *
 *  @param interval 时长
 *
 *  @return 时长字符串
 */
+ (NSString *)lsf_durationStringWithTimeInterval:(NSTimeInterval)interval;


/**
 *  根据指定格式获取日期字符串
 *
 *  @param date   日期
 *  @param format 格式化字符串
 *
 *  @return 字符串
 */
+ (NSString *)lsf_stringFromDate:(NSDate *)date
                        formate:(NSString *)format;

/**
 *  根据时间戳生成日期字符串
 *
 *  @param time       服务器返回的时间戳
 *  @param dateFormat 时间格式
 *
 *  @return 时间字符串
 */
+ (NSString *)lsf_dateFormatStringWithTimeInterval:(NSTimeInterval)time
                                       dateFormat:(NSString *)dateFormat;
/*!
 *  根据时间戳生成日期字符串，格式为yyyyMMdd HH:mm
 *
 *  @param time 服务器返回的时间戳
 *
 *  @return 时间字符串
 */
+ (NSString *)lsf_dateFormatStringWithTimeInterval:(NSTimeInterval)time;


/**
 *  获取当前时间字符串
 *
 *  @param format 字符串格式
 *
 *  @return 返回当前时间字符串
 */
+ (NSString *)lsf_stringByNowWithFormate:(NSString *)format;

/**
 *  根据月、日获取星座
 *
 *  @param month 月份
 *  @param day   日
 *
 *  @return 星座
 */
+ (NSString *)lsf_getAstroWithMonth:(NSInteger)month day:(NSInteger)day;

/**
 *  根据日期时间戳获取星座
 *
 *  @param timeInterval 日期时间戳
 *
 *  @return 星座
 */
+ (NSString *)lsf_getAstroWithTimeInterval:(NSTimeInterval)timeInterval;

/**
 *  根据时间戳计算年龄
 *
 *  @param timeInterval 时间戳
 *
 *  @return 年龄
 */
+ (NSInteger)lsf_getAgeWithTimeInterval:(NSTimeInterval)timeInterval;

/*!
 *  动态时间格式化转换方法，发布时间
 *
 *  @param time 服务器返回的时间戳
 *
 *  @return 时间字符串
 */
+ (NSString *)lsf_dynamicDateFormatStringWithTimeInterval:(NSTimeInterval)time;

@end
