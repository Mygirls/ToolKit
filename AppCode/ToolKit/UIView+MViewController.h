//
//  UIView+MViewController.h
//  AppCode
//
//  Created by Majq on 2018/8/30.
//  Copyright © 2018年 Majq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MViewController)

///通过响应者链来获取view 所在的控制器对象
- (UIViewController *)m_viewController;
@end
