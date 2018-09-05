//
//  MScreenshot.m
//  AppCode
//
//  Created by Majq on 2018/8/30.
//  Copyright © 2018年 Majq. All rights reserved.
//

#import "MScreenshot.h"
#import "UIImage+MCommon.h"
@interface MScreenshot ()

@property(nonatomic,strong)MScreenshotHandler handler;  //回调block
@property(nonatomic,strong)UIView *backgroundView;  //遮盖view
@property(nonatomic,weak)UIView *tempView;  //一定要用weak修饰，否则循环引用

@end

@implementation MScreenshot


- (void)m_screenshot:(UIView *)view complete:(MScreenshotHandler)completeHandler
{
    _handler = completeHandler;
    _tempView = view;
   
    //设置拖拽手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureAction:)];
    [_tempView addGestureRecognizer:pan];
}

- (void)panGestureAction:(UIPanGestureRecognizer *)pan
{
    static CGPoint firstPoint ;
    //手势开始
    if (pan.state == UIGestureRecognizerStateBegan) {
        firstPoint =  [pan locationInView:_tempView];
        //printf("firstPoint--> x:%f  y:%f\n",firstPoint.x,firstPoint.y);
    }
    
    //手势移动
    if (pan.state ==  UIGestureRecognizerStateChanged) {
        CGPoint lastPoint = [pan locationInView:_tempView];
        printf("lastPoint--> x:%f  y:%f\n",lastPoint.x,lastPoint.y);
        
        //设置截图背景视图的frame
        [_tempView addSubview:self.backgroundView];
        
        //_backgroundView.frame = CGRectMake(firstPoint.x, firstPoint.y , fabs(lastPoint.x - firstPoint.x), fabs(lastPoint.y - firstPoint.y) );
        _backgroundView.frame = CGRectMake(firstPoint.x, firstPoint.y , lastPoint.x - firstPoint.x, lastPoint.y - firstPoint.y );
    }
    
    // 手势结束
    if (pan.state == UIGestureRecognizerStateEnded ) {
        //CGPoint lastPoint = [pan locationInView:_tempView];
        
        //保留最后的frame
        CGRect rect = _backgroundView.frame;
        
        //移除backgroundView
        [self removeCover];
        
        if (self.handler) {
            self.handler(_tempView, rect);
        }
    }
}

- (UIView *)backgroundView
{
    if (_backgroundView == nil) {
        _backgroundView = [[UIView alloc] init];
        _backgroundView.backgroundColor = [UIColor blackColor];
        _backgroundView.alpha = 0.3;
    }
    return _backgroundView;
}

- (void)removeCover
{
    [self.backgroundView removeFromSuperview];
    self.backgroundView = nil;
}

- (void)dealloc
{
    NSLog(@"销毁了");
}

@end
