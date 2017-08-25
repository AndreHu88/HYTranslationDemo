//
//  HYKuGouTranstion.m
//  TransitionDemo
//
//  Created by leimo on 2017/8/7.
//  Copyright © 2017年 huyong. All rights reserved.
//

#import "HYKuGouTranstion.h"

#import "HYPushAnimator.h"
#import "HYPopAnimator.h"
#import "HYKuGouPercentDervenTranstion.h"

@interface HYKuGouTranstion()


/** pushAnimator */
@property (nonatomic,strong) HYPushAnimator *pushAnimator;
/** popAnimator */
@property (nonatomic,strong) HYPopAnimator *popAnimator;

@property (nonatomic,strong) HYKuGouPercentDervenTranstion *percentDervenTranstion;

@end

@implementation HYKuGouTranstion

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
    if (operation == UINavigationControllerOperationPush) {
        
        return self.pushAnimator;
    }
    else if (operation == UINavigationControllerOperationPop){
        
        return self.popAnimator;
    }
    
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{

    if (self.panGesture) {
        return self.percentDervenTranstion;
    }
    
    return nil;
}

- (void)setPanGesture:(UIPanGestureRecognizer *)panGesture{

    _panGesture = panGesture;
}

#pragma mark - lazyLoad
- (HYPushAnimator *)pushAnimator{
    
    if (!_pushAnimator) {
        _pushAnimator = [[HYPushAnimator alloc] init];
    }
    return _pushAnimator;
}

- (HYPopAnimator *)popAnimator{
    
    if (!_popAnimator) {
        _popAnimator = [[HYPopAnimator alloc] init];
    }
    return _popAnimator;
}

- (HYKuGouPercentDervenTranstion *)percentDervenTranstion{
    
    if (!_percentDervenTranstion) {
        
        _percentDervenTranstion = [[HYKuGouPercentDervenTranstion alloc] initWithGetstureRecognizer:self.panGesture];
    }
    return _percentDervenTranstion;
}

@end
