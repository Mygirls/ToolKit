//
//  MRexhelper.m
//  AppCode
//
//  Created by Majq on 2018/8/30.
//  Copyright © 2018年 Majq. All rights reserved.
//

#import "MRexhelper.h"

@implementation MRexhelper


- (void)m_regularExpressionMatchInString:(NSString *)string patternString:(NSString *)pattern TextCheckingResult:(void(^)(NSArray <NSTextCheckingResult *> *resultArr))checkingResult
{
    NSError *error = nil;
    
    //创建对象
    NSRegularExpression *regularExp = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    
    //遍历的模式，正则表达式匹配在指定options和range模式下匹配指定string，传入block中可以获取结果信息
    NSMutableArray *temArray = [[NSMutableArray alloc] init];
    
    [regularExp enumerateMatchesInString:string options:NSMatchingReportProgress range:NSMakeRange(0, string.length) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        
        if (result) {
            [temArray addObject:result];
        }
    }];
    
    if (checkingResult) {
        checkingResult(temArray);
    }
}

- (NSArray<NSTextCheckingResult *> *)m_regularExpressionMatchInString:(NSString *)string patternString:(NSString *)pattern
{
    NSError *error = nil;
    
    //创建对象
    NSRegularExpression *regularExp = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    
    //在指定options和range模式下匹配指定string，通过正则匹配返回一个匹配结果的数组
    NSArray <NSTextCheckingResult *> *resultArr = [regularExp matchesInString:string options:NSMatchingReportProgress range:NSMakeRange(0, string.length)];
    
    /*遍历数组、取出匹配出来的字符串
     for (NSTextCheckingResult *result in resultArr) {
     NSString *subStr = [conentStr substringWithRange:result.range];
     [resultStrM appendString:[NSString stringWithFormat:@"%@\n",subStr]];
     }
     */
    return resultArr;
}


- (NSString *)m_regularExpressionfirstMatchInString:(NSString *)string patternString:(NSString *)pattern
{
    NSError *error = nil;
    
    //创建对象
    NSRegularExpression *regularExp = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSTextCheckingResult *result = [regularExp firstMatchInString:string options:0 range:NSMakeRange(0, string.length)];
    if (result) {
        return [string substringWithRange:result.range];
    }
    return  nil;
}


- (BOOL)m_isMatchOfPredicateInString:(NSString *)string patternString:(NSString *)pattern
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    BOOL b =  [predicate evaluateWithObject:string];
    return b;
    
}

@end
