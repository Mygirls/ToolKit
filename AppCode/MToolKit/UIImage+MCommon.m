//
//  UIImage+MCommon.m
//  AppCode
//
//  Created by Majq on 2018/8/30.
//  Copyright © 2018年 Majq. All rights reserved.
//

#import "UIImage+MCommon.h"

@implementation UIImage (MCommon)
//MARK: - 透明通道
// 如果含有透明通道就返回TRUE
- (BOOL)m_hasAlpha
{
    // 获取图片的Alpha信息
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(self.CGImage);
    // 只要满足一下一种就含有透明通道
    return (alpha == kCGImageAlphaFirst ||
            alpha == kCGImageAlphaLast ||
            alpha == kCGImageAlphaPremultipliedFirst ||
            alpha == kCGImageAlphaPremultipliedLast);
}

// 如果不存在透明通道就添加透明通道并返回结果
- (UIImage *)m_setImageAlpha
{
    if ([self m_hasAlpha]) {
        return self; // 已有，直接返回
    }
    
    CGFloat scale = MAX(self.scale, 1.0f);
    CGImageRef imageRef = self.CGImage;
    size_t width = CGImageGetWidth(imageRef)*scale;
    size_t height = CGImageGetHeight(imageRef)*scale;
    
    // 创建位图上下文
    CGContextRef offscreenContext =
    CGBitmapContextCreate(NULL, // 渲染内存，为NULL表示由Quartz自动分配
                          width,//
                          height,
                          8,// bitsPerComponent 每个像素组件的位数
                          0,// 位图每行的字节数，0表示自动
                          CGImageGetColorSpace(imageRef),// 颜色空间
                          kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedFirst);// 位图信息，这里添加透明通道
    
    // 绘制图片
    CGContextDrawImage(offscreenContext, CGRectMake(0, 0, width, height), imageRef);
    CGImageRef imageRefWithAlpha = CGBitmapContextCreateImage(offscreenContext);
    UIImage *imageWithAlpha = [UIImage imageWithCGImage:imageRefWithAlpha scale:self.scale orientation:UIImageOrientationUp];
    
    // Clean up
    CGContextRelease(offscreenContext);
    CGImageRelease(imageRefWithAlpha);
    
    return imageWithAlpha;
}

//MARK: - 缩略图
+ (UIImage *)m_imageWithOriginImage:(UIImage *)image size:(CGSize)size
{
    CGSize imageSize = image.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat scaleFactor = 0.0;
    CGPoint thumbPoint = CGPointMake(0.0,0.0);
    CGFloat widthFactor = size.width / width;
    
    CGFloat heightFactor = size.height / height;
    if (widthFactor > heightFactor)  {
        scaleFactor = widthFactor;
    } else {
        scaleFactor = heightFactor;
    }
    
    CGFloat scaledWidth  = width * scaleFactor;
    CGFloat scaledHeight = height * scaleFactor;
    
    if (widthFactor > heightFactor){
        thumbPoint.y = (size.height - scaledHeight) * 0.5;
    }
    
    else if (widthFactor < heightFactor){
        thumbPoint.x = (size.width - scaledWidth) * 0.5;
    }
    
    UIGraphicsBeginImageContext(size);
    
    CGRect thumbRect = CGRectZero;
    thumbRect.origin = thumbPoint;
    thumbRect.size.width  = scaledWidth;
    thumbRect.size.height = scaledHeight;
    [image drawInRect:thumbRect];
    
    UIImage *thumbImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return thumbImage;
}

//MARK: - 截图
+ (UIImage *)m_imageOfCaptureFromView:(UIView *)view rect:(CGRect)rect
{
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);

    //[[UIColor clearColor] setFill];

    UIRectClip(rect);   //这两行代码顺序不能倒
    [view.layer renderInContext:context];

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)m_imageOfCaptureFromView:(UIView *)view
{
    return [self m_imageOfCaptureFromView:view rect:view.frame];
}

+ (UIImage *)m_imageOfCaptureScreen
{
    UIWindow *window = nil;
    UIApplication *app = [UIApplication sharedApplication];
    if ([app.delegate respondsToSelector:@selector(window)]) {
        window = [app.delegate window];
    } else {
        window = [app keyWindow];
    }
    return [self m_imageOfCaptureFromView:window rect:window.frame];
}

- (UIImage *)m_imageOfcaptureWithFrame:(CGRect)frame
{
    //创建CGImage
    CGImageRef cgimage = CGImageCreateWithImageInRect(self.CGImage, frame);
    
    //创建image
    UIImage *newImage=[UIImage imageWithCGImage:cgimage];
    
    //释放CGImage
    CGImageRelease(cgimage);
    
    return newImage;
}
@end
