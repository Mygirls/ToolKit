//
//  NSString+encryption.m
//  AppCode
//
//  Created by Majq on 2018/8/29.
//  Copyright © 2018年 Majq. All rights reserved.
//

#import "NSString+encryption.h"

#import<CommonCrypto/CommonDigest.h>
#import <UIKit/UIKit.h>

@implementation NSString (encryption)
//MARK: - md5加密【16位与32位】
//MD5 加密后的位数一般为两种，16 位与 32 位。16 位实际上是从 32 位字符串中，取中间的第 9 位到第 24 位的部分
//md5加密：32位 小写
+ (NSString *)m_MD5ForLower32Bate:(NSString *)encryption
{
    //要进行UTF8的转码
    const char* input = [encryption UTF8String];
    
    //#define CC_MD5_DIGEST_LENGTH    16
    unsigned char result[CC_MD5_DIGEST_LENGTH]; //16
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    
    return digest;
}

//md5加密：32位 大写
+ (NSString *)m_MD5ForUpper32Bate:(NSString *)encryption
{
    //要进行UTF8的转码
    const char* input = [encryption UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02X", result[i]];
    }
    
    return digest;
}


//md5加密：16位 大写
+ (NSString *)m_MD5ForUpper16Bate:(NSString *)encryption
{
    NSString *md5Str = [self m_MD5ForUpper32Bate:encryption];
    
    NSString  *string;
    for (int i=0; i<24; i++) {
        string=[md5Str substringWithRange:NSMakeRange(8, 16)];
    }
    return string;
}

//md5加密：16位 小写
+ (NSString *)m_MD5ForLower16Bate:(NSString *)encryption
{
    NSString *md5Str = [self m_MD5ForLower32Bate:encryption];
    
    NSString  *string;
    for (int i=0; i<24; i++) {
        string=[md5Str substringWithRange:NSMakeRange(8, 16)];
    }
    return string;
}

//MARK: - base64【编码、解码】
//转换为Base64编码
+ (NSString *)m_base64Encoded:(NSString *)encodedString
{
    NSData *data = [encodedString dataUsingEncoding:NSUTF8StringEncoding];
    NSData *base64Data = [data base64EncodedDataWithOptions:0];
    NSString *baseString = [[NSString alloc]initWithData:base64Data encoding:NSUTF8StringEncoding];
    return baseString;
}

//将Base64编码还原
+ (NSString *)m_base64Decoded:(NSString *)decodedString
{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:decodedString options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    return string;
}

//MARK: - base64【图片编码】
//Base64字符串转UIImage
+ (UIImage *)m_base64StringToImage:(NSString *)imageString
{
    if (imageString == nil || imageString.length == 0) {
        return nil;
    }
    NSURL *url = [NSURL URLWithString: imageString];
    NSData *data = [NSData dataWithContentsOfURL: url];
    UIImage *image = [UIImage imageWithData: data];
    return image;
}

//UIImage转Base64字符串
+ (NSString *)m_base64ImageToString:(UIImage *)image
{
    NSData *imageData = nil;
    NSString *mimeType = nil;
    
    if ([NSString m_imageHasAlpha: image]) {
        imageData = UIImagePNGRepresentation(image);
        mimeType = @"image/png";
    } else {
        imageData = UIImageJPEGRepresentation(image, 1.0f);
        mimeType = @"image/jpeg";
    }
    
    return [NSString stringWithFormat:@"data:%@;base64,%@", mimeType,
            [imageData base64EncodedStringWithOptions: 0]];
}

+ (BOOL)m_imageHasAlpha:(UIImage *) image
{
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(image.CGImage);
    return (alpha == kCGImageAlphaFirst ||
            alpha == kCGImageAlphaLast ||
            alpha == kCGImageAlphaPremultipliedFirst ||
            alpha == kCGImageAlphaPremultipliedLast);
}

@end
