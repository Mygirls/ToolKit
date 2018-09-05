//
//  UIColor+MCommon.h
//  AppCode
//
//  Created by Majq on 2018/8/30.
//  Copyright © 2018年 Majq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (MCommon)

//MARK: - 颜色

/// 随机颜色，alpha = 1
+ (UIColor *)m_randomColor;

/// 随机颜色
+ (UIColor *)m_randomColorWithAlpha:(CGFloat)alpha;

//MARK: - #FFFFFF格式颜色
/**
 *  转换#FFFFFF格式颜色【透明度alpha = 1】
 *
 *  @param string 颜色字符串
 *  @return UIColor
 */
+ (UIColor *)m_RGBColor:(NSString *)string;

/**
 *  转换#FFFFFF格式颜色
 *
 *  @param string 颜色字符串
 *  @param alpha 透明度【0-1】
 *  @return UIColor
 */
+ (UIColor *)m_RGBColor:(NSString *)string alpha:(CGFloat)alpha;

/**
 *  颜色转字符串
 *
 *  @param color 颜色
 *  @return NSString
 */
- (NSString *)m_stringRGBColor:(UIColor *)color;

@end
