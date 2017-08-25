//
//  HYTransition.m
//  TransitionDemo
//
//  Created by leimo on 2017/8/7.
//  Copyright © 2017年 huyong. All rights reserved.
//

#import "HYTransition.h"
#import "HYPushAnimator.h"
#import "HYPopAnimator.h"

@interface HYTransition()

/** pushAnimator */
@property (nonatomic,strong) HYPushAnimator *pushAnimator;
/** popAnimator */
@property (nonatomic,strong) HYPopAnimator *popAnimator;

@end

@implementation HYTransition

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{

    if (operation == UINavigationControllerOperationPush) {
        
        return self.pushAnimator;
    }
    else if (operation == UINavigationControllerOperationPop){
        
        return self.popAnimator;
    }
    
    return nil;
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

@end
