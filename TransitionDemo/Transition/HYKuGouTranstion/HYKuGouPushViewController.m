//
//  HYKuGouPushViewController.m
//  TransitionDemo
//
//  Created by leimo on 2017/8/7.
//  Copyright © 2017年 huyong. All rights reserved.
//

#import "HYKuGouPushViewController.h"
#import "HYKuGouTranstion.h"

@interface HYKuGouPushViewController ()

@property (nonatomic,strong) HYKuGouTranstion *transtion;

@end

@implementation HYKuGouPushViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] init];
    [panGesture addTarget:self action:@selector(panGesture:)];
    [self.view addGestureRecognizer:panGesture];
    
}

- (void)panGesture:(UIPanGestureRecognizer *)panGesture{
    
    
    switch (panGesture.state) {
        case UIGestureRecognizerStateBegan:
            
            self.navigationController.delegate = self.transtion;
            self.transtion.panGesture = panGesture;
            break;
        case UIGestureRecognizerStateChanged:
            
            break;
        case UIGestureRecognizerStateEnded:
            break;
        default:
            break;
    }
}

- (HYKuGouTranstion *)transtion{
    
    if (!_transtion) {
        
        _transtion = [[HYKuGouTranstion alloc] init];
    }
    return _transtion;
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}



@end
