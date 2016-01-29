//
//  FreeViewController.m
//  爱限免
//
//  Created by Qianfeng on 16/1/23.
//  Copyright © 2016年 王鹏宇. All rights reserved.
//

#import "FreeViewController.h"
#import "CustomAppTableViewCell.h"
#import "AppModel.h"
@interface FreeViewController ()

@end

@implementation FreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadDataSource];
    [self.tableView registerClass:[CustomAppTableViewCell class] forCellReuseIdentifier:@"fcellID"];
}
- (void)loadDataSource {
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    //NSDictionary *params = @{@"currency": @"rmb", @"page": @"1"};
    [manager GET:FreeUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        NSArray *apps = responseObject[@"applications"];
        //把一个数组 (存的字典) 转换成一个数组 (存的model)
        self.dataSource = [AppModel arrayOfModelsFromDictionaries:apps];
        NSLog(@"%ld",self.dataSource.count);
        //刷新界面
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

#pragma mark 实现代理
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellID = @"fcellID";
    CustomAppTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    AppModel *app = self.dataSource[indexPath.row];
    cell.starLabel.text = [NSString stringWithFormat:@" 评分:%.1f 分",app.starOverall];
    [cell configData:app];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
