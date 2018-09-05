//
//  UIImage+MCommon.h
//  AppCode
//
//  Created by Majq on 2018/8/30.
//  Copyright © 2018年 Majq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MCommon)
//MARK: - 透明通道

/// 是否含有透明通道，如含有就返回TRUE
- (BOOL)m_hasAlpha;

/// 如果不存在透明通道就添加透明通道并返回结果
- (UIImage *)m_setImageAlpha;

/**
 生成缩略图

 @param image 原始图片
 @param size 生成缩略图的size
 @return UIImage
 */
+ (UIImage *)m_imageWithOriginImage:(UIImage *)image size:(CGSize)size;

//MARK: - 截图、截屏
/// 截屏
+ (UIImage *)m_imageOfCaptureScreen;

/**
 *  从给定UIView中截图：UIView转UIImage
 *
 *  @param view 指定的view
 *  @return UIImage
 */
+ (UIImage *)m_imageOfCaptureFromView:(UIView *)view;

/**
 *  从给定UIView中截图指定的部分
 *
 *  @param view 指定的view
 *  @param rect 截图的CGRect
 *  @return UIImage
 */
+ (UIImage *)m_imageOfCaptureFromView:(UIView *)view rect:(CGRect)rect;

/**
 *  从给定UIImage和指定Frame截图：
 *
 *  @param frame 指定Frame
 *  @return UIImage
 */
- (UIImage *)m_imageOfcaptureWithFrame:(CGRect)frame;
@end
