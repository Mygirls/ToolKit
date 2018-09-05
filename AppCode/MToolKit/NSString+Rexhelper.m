//
//  NSString+Rexhelper.m
//  AppCode
//
//  Created by Majq on 2018/8/29.
//  Copyright © 2018年 Majq. All rights reserved.
//

#import "NSString+Rexhelper.h"
#import "MRexhelper.h"
@implementation NSString (Rexhelper)

// 判断手机号码是否正确
- (BOOL)m_isValidMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符  ^[1][35789][0-9]{9}$
    //    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSString *phoneRegex = @"^[1][345789][0-9]{9}$";
    return [self m_predicateMatchInString:mobile patternString:phoneRegex];
}

- (BOOL)m_predicateMatchInString:(NSString *)string patternString:(NSString *)pattern
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    BOOL b =  [predicate evaluateWithObject:string];
    return b;
}
@end
