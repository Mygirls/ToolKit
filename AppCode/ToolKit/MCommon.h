//
//  MCommon.h
//  AppCode
//
//  Created by Majq on 2018/8/30.
//  Copyright © 2018年 Majq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MCommon : NSObject


/// 获取window
+ (UIWindow *)m_mainWindow;

/// 获取随机数
+ (NSInteger )m_randomInteget:(NSInteger)randomMax;

@end
