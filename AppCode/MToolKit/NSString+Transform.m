//
//  NSString+Transform.m
//  AppCode
//
//  Created by Majq on 2018/8/29.
//  Copyright © 2018年 Majq. All rights reserved.
//

#import "NSString+Transform.h"
#import <UIKit/UIKit.h>
@implementation NSString (Transform)
//MARK: - json对象与字符串相互转换

//字符串转json对象
+ (id)m_JSONObjectWithString:(NSString *)jsonString
{
    if (jsonString == nil || jsonString.length == 0) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    id json = [NSJSONSerialization JSONObjectWithData:jsonData
                                              options:NSJSONReadingMutableContainers
                                                error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return json;
}

//json对象转字符串
+ (NSString *)m_stringWithJSONObject:(NSDictionary *)jsonObject
{
    if (jsonObject == nil) {
        return nil;
    }
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    NSString *jsonString;
    
    if (!jsonData) {
        return nil;
        
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    jsonString =  [self m_clearSpace:jsonString];
    
    return jsonString;
}

//MARK: - HTML
+ (NSString *)m_attributesStringWithHTMLText:(NSString *)text
{
    if (text == nil) {
        return nil;
    }
    NSData *data = [text dataUsingEncoding:NSUnicodeStringEncoding];
    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:data options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    return  attrStr.string;
}

//去空格、换行
+ (NSString *)m_clearSpace:(NSString *)text
{
    NSMutableString *mutStr = [NSMutableString stringWithString:text];
    NSRange range = {0,text.length};
    
    //去掉字符串中的空格
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return [mutStr copy];
}

//对url 中文字符串编码
+ (NSString *)m_stringByAddingPercentEncoding:(NSString *)string
{
    string = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    return string;
}

+ (NSString*)m_stringByReplacingUnicode:(NSString*)unicodeString
{
    NSString*tepStr1 = [unicodeString stringByReplacingOccurrencesOfString:@"\\u"withString:@"\\U"];
    NSString*tepStr2 = [tepStr1 stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""];
    NSString*tepStr3 = [[@"\"" stringByAppendingString:tepStr2]stringByAppendingString:@"\""];
    NSData*tepData = [tepStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *axiba = [NSPropertyListSerialization propertyListWithData:tepData options:NSPropertyListMutableContainers format:NULL error:NULL];
    return [axiba stringByReplacingOccurrencesOfString:@"\\r\\n"withString:@"\n"];
}

//NARK: - 基本数据类型转换
+ (NSString *)m_stringDecimalNumberWithDouble:(double)conversionValue
{
    NSString *doubleString  = [NSString stringWithFormat:@"%lf", conversionValue];
    NSDecimalNumber *decNumber  = [NSDecimalNumber decimalNumberWithString:doubleString];
    return [decNumber stringValue];
}

@end
