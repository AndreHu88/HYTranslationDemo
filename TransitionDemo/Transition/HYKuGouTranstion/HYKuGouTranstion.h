//
//  HYKuGouTranstion.h
//  TransitionDemo
//
//  Created by leimo on 2017/8/7.
//  Copyright © 2017年 huyong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HYKuGouTranstion : NSObject <UINavigationControllerDelegate>

/** pan */
@property (nonatomic,strong) UIPanGestureRecognizer *panGesture;

@end
