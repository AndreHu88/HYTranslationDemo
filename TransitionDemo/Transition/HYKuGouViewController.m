//
//  HYKuGouViewController.m
//  TransitionDemo
//
//  Created by leimo on 2017/8/7.
//  Copyright © 2017年 huyong. All rights reserved.
//

#import "HYKuGouViewController.h"

#import "HYKuGouPushViewController.h"
#import "HYKuGouTranstion.h"

@interface HYKuGouViewController ()

@property (nonatomic,strong) HYKuGouTranstion *transtion;

@end

@implementation HYKuGouViewController

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.navigationController.delegate = nil;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.title = @"仿酷狗转场";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 290, 150, 150);
    [button setTitle:@"点击我开始转场" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button];
}

- (void)buttonAction{
    
    _transtion = [[HYKuGouTranstion alloc] init];
    self.navigationController.delegate = _transtion;
    
    HYKuGouPushViewController *pushVC = [[HYKuGouPushViewController alloc] init];
    [self.navigationController pushViewController:pushVC animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
