//
//  NSString+DateFormat.m
//  AppCode
//
//  Created by Majq on 2018/8/29.
//  Copyright © 2018年 Majq. All rights reserved.
//

#import "NSString+DateFormat.h"
#import "NSDate+MCalendar.h"

@implementation NSString (DateFormat)

+ (NSString *)m_dateStringChangeDateFormatWithString:(NSString *)dateString dateStringFormat:(NSString *)dateFormat changeToDateFormat:(NSString *)changeDateFormat
{
    if (dateString.length == 0 || dateString == nil) {
        return nil;
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = dateFormat;
    NSDate* date = [dateFormatter dateFromString:dateString];

    dateFormatter.dateFormat = changeDateFormat;
    NSString *s =  [dateFormatter stringFromDate:date];
    return s;
}

//MARK: - 时间戳转字符串
// 把时间戳字符串转成指定时间格式【yyyy-MM-dd】字符串
+ (NSString *)m_dateStringWithTimeIntervalSince1970:(NSString *)timeInterval
{
    return [NSString m_dateStringWithTimeIntervalSince1970:timeInterval dateFormat:@"yyyy-MM-dd"];
}

// 把时间戳字符串转成指定时间格式字符串
+ (NSString *)m_dateStringWithTimeIntervalSince1970:(NSString *)timeInterval dateFormat:(NSString *)dateFormat
{
    if (timeInterval == nil) {
        return nil;
    }
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"beijing"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:dateFormat];
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeInterval doubleValue]/1000];
    return [formatter stringFromDate:date];
}

//MARK: - 当前时间
+ (NSString*)m_currentTimesString
{
   return [NSString m_currentTimesStringWithDateFormat:@"YYYY-MM-dd HH:mm:ss"];
}

+ (NSString*)m_currentTimesStringWithDateFormat:(NSString *)dateFormat
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormat];
   
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;
}

//MARK: - 聊天显示时间
+ (NSString *)m_displayDateStringWithTimeIntervalSince1970:(NSString *)timeInterval
{
    return [self m_displayDateStringWithReferenceDate:[NSDate date] TimeIntervalSince1970:timeInterval];
}

+ (NSString *)m_displayDateStringWithReferenceDate:(NSDate *)date TimeIntervalSince1970:(NSString *)timeInterval
{
    NSDate *currentDate = nil;
    if (date == nil) {
        currentDate = [NSDate date];
    } else {
        currentDate = date;
    }
    //获取当前日历对象
    //NSDate *currentDate = [NSDate date];
    NSDateComponents *currentDC = [currentDate m_dateComponents];
    
    //获取给定的时间日历对象
    NSDate* myDate = [NSDate dateWithTimeIntervalSince1970:[timeInterval doubleValue]/1000];
    NSDateComponents *myDC = [myDate m_dateComponents];
    
    NSDateFormatter *dateFmt = [[NSDateFormatter alloc ] init ];
    
    if (currentDC.year == myDC.year ) { //同年
        NSInteger num = [NSDate m_numberOfDaysWithFromDate:myDate toDate:currentDate];
        if (num == 0) { //当日
            dateFmt.AMSymbol = @"上午";
            dateFmt.PMSymbol = @"下午";
            dateFmt.dateFormat = @"aaa hh:mm";
        } else if (num == 1) {  //昨日
            dateFmt.AMSymbol = @"上午";
            dateFmt.PMSymbol = @"下午";
            dateFmt.dateFormat = @"昨天 aaahh:mm";
        } else if (num <= 7) {  //前7天
            dateFmt.AMSymbol = @"上午";
            dateFmt.PMSymbol = @"下午";
            
            switch (myDC.weekday) {
                case 1:
                    dateFmt.dateFormat = @"星期日 aaahh:mm";
                    break;
                case 2:
                    dateFmt.dateFormat = @"星期一 aaahh:mm";
                    break;
                case 3:
                    dateFmt.dateFormat = @"星期二 aaahh:mm";
                    break;
                case 4:
                    dateFmt.dateFormat = @"星期三 aaahh:mm";
                    break;
                case 5:
                    dateFmt.dateFormat = @"星期四 aaahh:mm";
                    break;
                case 6:
                    dateFmt.dateFormat = @"星期五 aaahh:mm";
                    break;
                case 7:
                    dateFmt.dateFormat = @"星期六 aaahh:mm";
                    break;
                default:
                    break;
            }
        }
        
        else {
            dateFmt.dateFormat = @"MM-dd hh:mm";
        }
    }
    
    else {
        dateFmt.dateFormat = @"yyyy-MM-dd hh:mm";
    }
    
    return [dateFmt stringFromDate:myDate];
}


@end
