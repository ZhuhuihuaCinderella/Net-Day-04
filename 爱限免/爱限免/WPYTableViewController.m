//
//  WPYTableViewController.m
//  爱限免
//
//  Created by Qianfeng on 16/1/21.
//  Copyright © 2016年 王鹏宇. All rights reserved.
//

#import "WPYTableViewController.h"

@interface WPYTableViewController ()
@end

@implementation WPYTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     _dataSource = [NSMutableArray new];
    [self createTableView];
    [self loadDataSource];
}
- (void)loadDataSource {
   
}
- (void)createTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

#pragma mark - 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellID = @"cellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
