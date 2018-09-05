//
//  NSDate+MCalendar.m
//  AppCode
//
//  Created by Majq on 2018/8/30.
//  Copyright © 2018年 Majq. All rights reserved.
//

#import "NSDate+MCalendar.h"

const NSInteger M_MINUTE = 60;
static const unsigned componentFlags = (NSCalendarUnitYear|
                                        NSCalendarUnitMonth |
                                        NSCalendarUnitDay |
                                        NSCalendarUnitWeekOfMonth |
                                        NSCalendarUnitHour |
                                        NSCalendarUnitMinute |
                                        NSCalendarUnitSecond |
                                        NSCalendarUnitWeekday |
                                        NSCalendarUnitWeekdayOrdinal);

@implementation NSDate (MCalendar)


//单例获取日历对象
+ (NSCalendar *)currentCalendar
{
    static NSCalendar *sharedCalendar = nil;
    if (!sharedCalendar)
        sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
    return sharedCalendar;
}

//获取date 对应的year（年）
- (NSInteger)m_year
{
    NSDateComponents *components = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    return components.year;
}

//获取date 对应的month（月）
- (NSInteger)m_month
{
    NSDateComponents *components = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    return components.month;
}

//获取date 对应的day（天）
- (NSInteger)m_day
{
    NSDateComponents *components = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    return components.day;
}

//获取date 对应的hour（时）
- (NSInteger)m_hour
{
    NSDateComponents *components = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    return components.hour;
}

//获取date 对应的minute（分）
- (NSInteger)m_minute
{
    NSDateComponents *components = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    return components.minute;
}

//获取date 对应的second（秒）
- (NSInteger)m_seconds
{
    NSDateComponents *components = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    return components.second;
}

//表示date 对应的月里面的第几周
- (NSInteger)m_weekOfMonth
{
    NSDateComponents *components = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    return components.weekOfMonth;
}

//表示date 对应的周里面的天 1代表周日 2代表周一 7代表周六
- (NSInteger)m_weekday
{
    NSDateComponents *components = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    return components.weekday;
}

//表示WeekDay在下一个更大的日历单元中的位置。例如WeekDay=3，WeekDayOrdinal=2  就表示这个月的第2个周二。
- (NSInteger)m_weekdayOrdinal // e.g. 2nd Tuesday of the month is 2
{
    NSDateComponents *components = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    return components.weekdayOrdinal;
}


- (NSDateComponents *)m_dateComponents
{
    NSDateComponents *components = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    return components;
}

+ (NSDate *)m_date:(NSString *)dateString WithFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:format];
    NSDate *date = [dateFormatter dateFromString:dateString];
#if ! __has_feature(objc_arc)
    [dateFormatter release];
#endif
    return date;
}


- (NSDate *)m_dateWithFormatter:(NSString *)formatter
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = formatter;
    NSString *selfStr = [fmt stringFromDate:self];
    return [fmt dateFromString:selfStr];
}

//计算两个日期之间的天数
+ (NSInteger)m_numberOfDaysWithFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitDay
                                             fromDate:fromDate
                                               toDate:toDate
                                              options:NSCalendarWrapComponents];
    return dateComponents.day;
}

@end
