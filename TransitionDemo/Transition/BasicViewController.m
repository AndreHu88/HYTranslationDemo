//
//  BasicViewController.m
//  TransitionDemo
//
//  Created by leimo on 2017/8/7.
//  Copyright © 2017年 huyong. All rights reserved.
//

#import "BasicViewController.h"
#import "BasicPushViewController.h"
#import "HYTransition.h"

@interface BasicViewController ()

@property (nonatomic,strong) HYTransition *animatedTransition;

@end

@implementation BasicViewController

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.navigationController.delegate = nil;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"基本转场动画";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 290, 150, 150);
    [button setTitle:@"点击我开始转场" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button];
}

- (void)buttonAction{
    
    _animatedTransition = [[HYTransition alloc] init];
    self.navigationController.delegate = _animatedTransition;

    BasicPushViewController *pushVC = [[BasicPushViewController alloc] init];
    [self.navigationController pushViewController:pushVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
