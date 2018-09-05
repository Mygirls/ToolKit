//
//  MScreenshot.h
//  AppCode
//
//  Created by Majq on 2018/8/30.
//  Copyright © 2018年 Majq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void(^MScreenshotHandler)(UIView *v,CGRect rect);

@interface MScreenshot : NSObject

/**
 *  手势滑动截图【截图需在回调里面操作】，注意：MScreenshot对象 需保持，否则方法调用完MScreenshot对象就销毁了
 *
 *  @param view 指定的view
 *  @param completeHandler 滑动结束回调
 */
- (void)m_screenshot:(UIView *)view complete:(MScreenshotHandler)completeHandler;

@end
