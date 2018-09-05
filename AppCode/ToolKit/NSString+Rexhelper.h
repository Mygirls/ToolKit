//
//  NSString+Rexhelper.h
//  AppCode
//
//  Created by Majq on 2018/8/29.
//  Copyright © 2018年 Majq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Rexhelper)


/**
 *  通过正则验证手机号码是否正确
 *
 *  @param mobile 手机电话好吗
 *  @return BOOL
 */
- (BOOL)m_isValidMobile:(NSString *)mobile;

@end
