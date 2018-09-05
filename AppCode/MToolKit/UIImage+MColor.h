//
//  UIImage+MColor.h
//  AppCode
//
//  Created by Majq on 2018/8/30.
//  Copyright © 2018年 Majq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MColor)


/**
 *  根据颜色color 来生成纯色图片
 *
 *  @param color 颜色
 *  @param size 尺寸
 *  @return UIImage
 */
+ (UIImage *)m_imageWithColor:(UIColor *)color size:(CGSize)size;


/**
 *  根据颜色color 来生成纯色图片,带文本
 *
 *  @param color 颜色
 *  @param size 尺寸
 *  @param text 文本
 *  @param point 文本位置
 *  @return UIImage
 */
+ (UIImage *)m_imageWithColor:(UIColor *)color size:(CGSize)size text:(NSString *)text textPoint:(CGPoint)point;

//MARK: - 颜色
/**
 *  获取指定位置的颜色
 *
 *  @param point 位置CGPoint
 *  @return UIColor
 */
- (UIColor *)m_colorAtPoint:(CGPoint)point;

@end
