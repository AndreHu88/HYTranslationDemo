//
//  ViewController.m
//  TransitionDemo
//
//  Created by leimo on 2017/8/7.
//  Copyright © 2017年 huyong. All rights reserved.
//

#import "ViewController.h"

#import "BasicViewController.h"
#import "HYKuGouViewController.h"
#import "HYWeiXinViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

/** tableView */
@property (nonatomic,strong) UITableView *tableView;
/** 数据源 */
@property (nonatomic,strong) NSMutableArray *datalist;
/** VC数组 */
@property (nonatomic,strong) NSArray *vcArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view addSubview:self.tableView];
}


#pragma mark - lazyLoad
- (UITableView *)tableView{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _tableView;
}

- (NSMutableArray *)datalist{

    if (!_datalist) {
        
        _datalist = [NSMutableArray array];
        NSArray *array = @[@"基础转场",@"仿酷狗转场",@"仿微信，图片浏览转场"];
        [_datalist addObjectsFromArray:array];
        
        _vcArray = @[@"BasicViewController",@"HYKuGouViewController",@"HYWeiXinViewController"];
    }
    return _datalist;
}

#pragma mark - TableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.datalist.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.datalist[indexPath.row];
    return cell;
}

#pragma mark - tableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    Class vc = NSClassFromString(_vcArray[indexPath.row]);
    UIViewController *baseVC = [[vc alloc] init];
    [self.navigationController pushViewController:baseVC animated:YES];
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


@end
