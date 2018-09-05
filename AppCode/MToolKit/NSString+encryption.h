//
//  NSString+encryption.h
//  AppCode
//
//  Created by Majq on 2018/8/29.
//  Copyright © 2018年 Majq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (encryption)

//MARK: - md5加密【16位与32位】
/**
 *  md5加密：32位 小写
 *
 *  @param encryption 需要加密的字符串
 *  @return 加密后的字符串
 */
+ (NSString *)m_MD5ForLower32Bate:(NSString *)encryption;


/**
 *  md5加密：32位 大写
 *
 *  @param encryption 需要加密的字符串
 *  @return 加密后的字符串
 */
+ (NSString *)m_MD5ForUpper32Bate:(NSString *)encryption;

/**
 *  md5加密：16位 大写
 *
 *  @param encryption 需要加密的字符串
 *  @return 加密后的字符串
 */
+ (NSString *)m_MD5ForUpper16Bate:(NSString *)encryption;

/**
 *  md5加密：16位 小写
 *
 *  @param encryption 需要加密的字符串
 *  @return 加密后的字符串
 */
+ (NSString *)m_MD5ForLower16Bate:(NSString *)encryption;



//MARK: - base64【编码、解码】
/**
 *  转换为Base64编码
 *
 *  @param encodedString 需要转换为Base64编码字符串
 *  @return 转换为Base64编码后的字符串
 */
+ (NSString *)m_base64Encoded:(NSString *)encodedString;

/**
 *  将Base64编码还原
 *
 *  @param decodedString 需要将Base64编码还原的字符串
 *  @return 将Base64编码还原后的字符串
 */
+ (NSString *)m_base64Decoded:(NSString *)decodedString;


//MARK: - base64【图片编码】
/**
 *  Base64字符串转UIImage
 *
 *  @param imageString Base64字符串
 *  @return UIImage
 */
+ (UIImage *)m_base64StringToImage:(NSString *)imageString;

/**
 *  UIImage转Base64字符串
 *
 *  @param image UIImage
 *  @return NSString
 */
+ (NSString *)m_base64ImageToString:(UIImage *)image;
@end
