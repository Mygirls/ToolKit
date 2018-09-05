//
//  NSDate+MCalendar.h
//  AppCode
//
//  Created by Majq on 2018/8/30.
//  Copyright © 2018年 Majq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (MCalendar)


//MARK: - 获取年月日时分秒星期
/// 获取date 对应的year（年）
- (NSInteger)m_year;

/// 获取date 对应的month（月）
- (NSInteger)m_month;

/// 获取date 对应的day（天）
- (NSInteger)m_day;

/// 获取date 对应的hour（时）
- (NSInteger)m_hour;

/// 获取date 对应的minute（分）
- (NSInteger)m_minute;

/// 获取date 对应的second（秒）
- (NSInteger)m_seconds;

/// 表示date 对应的月里面的第几周
- (NSInteger)m_weekOfMonth;

/// 表示date 对应的周里面的天 1代表周日 2代表周一 7代表周六
- (NSInteger)m_weekday;

/// 表示WeekDay在下一个更大的日历单元中的位置。例如WeekDay=3，WeekDayOrdinal=2  就表示这个月的第2个周二。
- (NSInteger)m_weekdayOrdinal;

/// 获取 NSDateComponents
- (NSDateComponents *)m_dateComponents;

/**
 *  获取两个日期之间的天数
 *
 *  @param fromDate 起始日期
 *  @param toDate 终止日期
 *  @return NSInteger
 */
+ (NSInteger)m_numberOfDaysWithFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;

//MARK: - 获取date
/**
 *  根据时间格式字符串、指定格式获取date

 *  @param dateString 时间格式字符串
 *  @param format 时间格式
 *  @return NSDate
 */
+ (NSDate *)m_date:(NSString *)dateString WithFormat:(NSString *)format;


/**
 *  根据指定格式修改指定date数据
 *
 *  @param formatter 时间格式
 *  @return NSDate
 */
- (NSDate *)m_dateWithFormatter:(NSString *)formatter;




@end
