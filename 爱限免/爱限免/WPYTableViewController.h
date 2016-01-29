//
//  WPYTableViewController.h
//  爱限免
//
//  Created by Qianfeng on 16/1/21.
//  Copyright © 2016年 王鹏宇. All rights reserved.
//

#import "WPYViewController.h"

@interface WPYTableViewController : WPYViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray * dataSource;
- (void)loadDataSource;
@end
