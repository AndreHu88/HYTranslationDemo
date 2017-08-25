//
//  HYPushAnimator.m
//  TransitionDemo
//
//  Created by leimo on 2017/8/7.
//  Copyright © 2017年 huyong. All rights reserved.
//

#import "HYPushAnimator.h"

@implementation HYPushAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{

    return 0.4;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    //转场过渡的容器View
    UIView *containerView = [transitionContext containerView];
    
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toViewController.view;
    [containerView addSubview:toView];
    
    CGFloat centerX = toView.bounds.size.width / 2;
    CGFloat centerY = toView.bounds.size.height / 2;
    CGFloat x = toView.bounds.size.width / 2;
    CGFloat y = toView.bounds.size.height * 1.8;
    
    CGAffineTransform transform = [self rotateTransformWithCenterX:centerX centerY:centerY x:x y:y angle:M_PI_4];
    toView.transform = transform;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        //终止位置：原始位置
        toView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
        //终止位置：原始位置
        toView.transform = CGAffineTransformIdentity;
        
        BOOL isCalcelled = [transitionContext transitionWasCancelled];
        //Notifies the system that the transition animation is done.
        [transitionContext completeTransition:!isCalcelled];
    }];
    
}


//仿射变换动画
/**
 仿射变换
 
 @param centerX     view的中心点X坐标
 @param centerY     view的中心点Y坐标
 @param x           旋转中心x坐标
 @param y           旋转中心y坐标
 @param angle       旋转的角度
 @return            CGAffineTransform对象
 */
- (CGAffineTransform)rotateTransformWithCenterX:(CGFloat)centerX centerY:(CGFloat)centerY x:(CGFloat)x y:(CGFloat)y angle:(CGFloat)angle{

    CGFloat temp = y - centerY;
    CGFloat x1 = temp *sin(angle);
    CGFloat y1 = temp - temp * cos(angle);
    
    CGAffineTransform  trans = CGAffineTransformMakeTranslation(x1, y1);
    //旋转动画
    trans = CGAffineTransformRotate(trans,angle);
    
    return trans;
}

@end
