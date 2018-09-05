//
//  NSString+DateFormat.h
//  AppCode
//
//  Created by Majq on 2018/8/29.
//  Copyright © 2018年 Majq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DateFormat)

//MARK: - 时间格式字符串的修改
/**
 *  对时间格式字符串修改成指定格式的字符串
 *  例如：[NSString dateStringChangeDateFormatWithString:@"2017.06.11" dateStringFormat:@"yyyy.MM.dd" changeToDateFormat:@"yyyy-MM-dd HH:mm:ss"]
 *
 *  @param dateString 指定被修改的字符串
 *  @param dateFormat 指定被修改的字符串的时间格式，必须与被指定修改的字符串的格式保持一致
 *  @param changeDateFormat 新的时间字符串格式
 *  @return NSString
 */
+ (NSString *)m_dateStringChangeDateFormatWithString:(NSString *)dateString dateStringFormat:(NSString *)dateFormat changeToDateFormat:(NSString *)changeDateFormat;

//MARK: - 时间戳转字符串
/**
 *  把时间戳字符串转成指定时间格式【yyyy-MM-dd】字符串
 *
 *  @param timeInterval 字符串时间戳（这里时间戳用字符串形式，因为现在从后台请求数据，很多公司约定为字符串）,时间戳以毫秒计数
 *  @return NSString
 */
+ (NSString *)m_dateStringWithTimeIntervalSince1970:(NSString *)timeInterval;

/**
 *  把时间戳字符串转成指定时间格式字符串
 *
 *  @param timeInterval 字符串时间戳（这里时间戳用字符串形式，因为现在从后台请求数据，很多公司约定为字符串）,时间戳以毫秒计数
 *  @param dateFormat 时间格式
 *  @return NSString
 */
+ (NSString *)m_dateStringWithTimeIntervalSince1970:(NSString *)timeInterval dateFormat:(NSString *)dateFormat;


//MARK: - 当前时间
/**
 *  获取当前时间格式字符串
 *
 *  @return NSString
 */
+ (NSString*)m_currentTimesString;

/**
 *  获取当前时间指定格式字符串
 *
 *  @param dateFormat 字符串格式
 *  @return NSString
 */
+ (NSString*)m_currentTimesStringWithDateFormat:(NSString *)dateFormat;


//MARK: - 模拟聊天记录时间
/**
 *  聊天记录时间显示[参照时间为 现在时间]
 *
 *  @param timeInterval 时间戳【字符串,时间戳以毫秒计数】
 *  @return NSString
 */
+ (NSString *)m_displayDateStringWithTimeIntervalSince1970:(NSString *)timeInterval;


/**
 *  聊天记录时间显示[参照时间为 指定的NSDate 对象，如果date == nil，则默认为当前时间]
 *
 *  @param date [参照时间NSDate
 *  @param timeInterval 时间戳【字符串,时间戳以毫秒计数】
 *  @return NSString
 */
+ (NSString *)m_displayDateStringWithReferenceDate:(NSDate *)date TimeIntervalSince1970:(NSString *)timeInterval;

@end
