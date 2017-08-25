//
//  HYKuGouPercentDervenTranstion.m
//  TransitionDemo
//
//  Created by leimo on 2017/8/7.
//  Copyright © 2017年 huyong. All rights reserved.
//

#import "HYKuGouPercentDervenTranstion.h"

@interface HYKuGouPercentDervenTranstion()

/** pan */
@property (nonatomic,strong) UIPanGestureRecognizer *panGesture;

@end

@implementation HYKuGouPercentDervenTranstion

- (instancetype)initWithGetstureRecognizer:(UIPanGestureRecognizer *)gestureRecognizer{
    
    if (self = [super init]) {
        
        _panGesture = gestureRecognizer;
        [_panGesture addTarget:self action:@selector(gestureUpdate:)];
    }
    return self;
}

- (void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    //一定要调用父类的方法
    [super startInteractiveTransition:transitionContext];
}


- (void)gestureUpdate:(UIPanGestureRecognizer *)panGesture{

    CGFloat scale = [self percentForGesture:panGesture];
    
    switch (panGesture.state) {
        case UIGestureRecognizerStateBegan:
            
            break;
        case UIGestureRecognizerStateChanged:
            
            [self updateInteractiveTransition:scale];
            break;
        case UIGestureRecognizerStateEnded:
            if (scale > 0.4) {
                [self finishInteractiveTransition];
            }
            else{
                [self cancelInteractiveTransition];
            }
            break;
        default:
            [self cancelInteractiveTransition];
            break;
    }
}

//滑动距离所占屏幕的比例
- (CGFloat)percentForGesture:(UIPanGestureRecognizer *)panGesture{

    CGPoint point = [panGesture translationInView:panGesture.view];
    
    CGFloat scale = point.x / [UIScreen mainScreen].bounds.size.width;
    
    scale = scale < 0 ? 0 : scale;
    
    return scale;
}

@end
