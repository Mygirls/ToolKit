//
//  NSString+Transform.h
//  AppCode
//
//  Created by Majq on 2018/8/29.
//  Copyright © 2018年 Majq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Transform)

//MARK: - json对象与字符串相互转换
/**
 *  字符串转成json 对象
 *
 *  @param jsonString json 字符串
 *  @return json 对象
 */
+ (id)m_JSONObjectWithString:(NSString *)jsonString;

/**
 *  json对象转字符串
 *
 *  @param jsonObject json 对象
 *  @return NSString
 */
+ (NSString *)m_stringWithJSONObject:(NSDictionary *)jsonObject;


//MARK: - html文本转换成字符串
/**
 *  html文本转换成字符串
 *
 *  @param text html文本
 *  @return NSString
 */
+ (NSString *)m_attributesStringWithHTMLText:(NSString *)text;


//MARK: - 其他方法
/**
 *  去空格、换行
 *
 *  @param text 字符串文本
 *  @return NSString
 */
+ (NSString *)m_clearSpace:(NSString *)text;

/**
 *  对url 中文字符串编码
 */
+ (NSString *)m_stringByAddingPercentEncoding:(NSString *)string;


/**
 *  将Unicode编码字符串专成字符串
 *
 *  @param unicodeString Unicode编码字符串
 *  @return NSString
 */
+ (NSString*)m_stringByReplacingUnicode:(NSString*)unicodeString;

//NARK: - 基本数据类型转换

/// 基本数据类型转换成字符串
+ (NSString *)m_stringDecimalNumberWithDouble:(double)conversionValue;

@end
