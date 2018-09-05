//
//  MCommon.m
//  AppCode
//
//  Created by Majq on 2018/8/30.
//  Copyright © 2018年 Majq. All rights reserved.
//

#import "MCommon.h"

@implementation MCommon

+ (UIWindow *)m_mainWindow
{
    UIApplication *app = [UIApplication sharedApplication];
    if ([app.delegate respondsToSelector:@selector(window)]) {
        return [app.delegate window];
    }
    return [app keyWindow];
}

+ (NSInteger )m_randomInteget:(NSInteger)randomMax
{
    CGFloat r = random() % randomMax;
    return r;
}

@end
