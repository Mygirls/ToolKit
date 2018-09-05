//
//  UIView+MViewController.m
//  AppCode
//
//  Created by Majq on 2018/8/30.
//  Copyright © 2018年 Majq. All rights reserved.
//

#import "UIView+MViewController.h"

@implementation UIView (MViewController)

- (UIViewController *)m_viewController
{
    //通过响应者链关系，取得此视图的下一个响应者
    UIResponder *next = self.nextResponder;
    do {
        //判断响应者对象是否是视图控制器类型
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        
        next = next.nextResponder;
        
    }while(next != nil);
    
    return nil;
}
@end
