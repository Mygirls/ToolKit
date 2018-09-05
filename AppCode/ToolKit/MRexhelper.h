//
//  MRexhelper.h
//  AppCode
//
//  Created by Majq on 2018/8/30.
//  Copyright © 2018年 Majq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRexhelper : NSObject

/**
 测试正则表达式   @"\\$.{2,10}\\(\\w{8}\\)\\$"
 测试内容        @"$*广发银行(SZ000001)$$建设银行(SZ000001)$我是炒股高手哦$中国银行(SZ000001)$"
 
 omipay 登录账号密码设置：登录允许邮箱/电话/账号名 需要对这些进行正则验证。
 账号名只允许字母+数字+.和_
 */


/** 方法1
 *  根据正则表达式pattern 去内容content 筛选
 *
 *  @params string 需要筛选的内容
 *  @params pattern 正则表达式
 *  @params checkingResult block回调数据
 *
 */
- (void)m_regularExpressionMatchInString:(NSString *)string patternString:(NSString *)pattern TextCheckingResult:(void(^)(NSArray <NSTextCheckingResult *> *resultArr))checkingResult;

/** 方法2
 *  根据正则表达式pattern 去内容content 筛选
 *
 *  @params string 需要筛选的内容
 *  @params pattern 正则表达式
 *  @return 筛选出的结果
 */
- (NSArray<NSTextCheckingResult *> *)m_regularExpressionMatchInString:(NSString *)string patternString:(NSString *)pattern;

/**
 *  根据正则表达式pattern 去内容content 筛选匹配返回的第一个结果，NSTextCheckingResult类型
 *
 *  @params string 需要筛选的内容
 *  @params pattern 正则表达式
 *
 *  @return 筛选出的第一数据的结果
 */
- (NSString *)m_regularExpressionfirstMatchInString:(NSString *)string patternString:(NSString *)pattern;


/**
 *  通过谓词：predicate， 根据正则表达式pattern 去内容content 判断是否符合改正则表达式
 *
 *  @params string 需要筛选的内容
 *  @params pattern 正则表达式
 *
 *  @return BOOL类型，是否符合正则表达式
 */
- (BOOL)m_isMatchOfPredicateInString:(NSString *)string patternString:(NSString *)pattern;
@end
