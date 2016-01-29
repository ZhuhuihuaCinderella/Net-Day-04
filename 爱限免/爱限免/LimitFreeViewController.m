//
//  LimitFreeViewController.m
//  爱限免
//
//  Created by Qianfeng on 16/1/21.
//  Copyright © 2016年 王鹏宇. All rights reserved.
//

#import "LimitFreeViewController.h"
#import "AppTableViewCell.h"
#import "CustomAppTableViewCell.h"
#import "AppModel.h"
@interface LimitFreeViewController ()

@end

@implementation LimitFreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.tableView registerNib:[UINib nibWithNibName:@"AppTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellID"];
    [self.tableView registerClass:[CustomAppTableViewCell class] forCellReuseIdentifier:@"cellID"];
    
    [self loadDataSource];
}
- (void)loadDataSource {

    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *params = @{@"currency": @"rmb", @"page": @"1"};
    [manager GET:LimitFreeUrl parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
      //  NSLog(@"%@",responseObject);
        NSArray *apps = responseObject[@"applications"];
        //把一个数组 (存的字典) 转换成一个数组 (存的model)
        self.dataSource = [AppModel arrayOfModelsFromDictionaries:apps];
        //NSLog(@"%ld",self.dataSource.count);
        //刷新界面
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120.0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    //如果用xib 写得 用nib注册  不能创建（创建的不是xib拉的那个）
    CustomAppTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    AppModel * app = self.dataSource[indexPath.row];
    cell.limitTimeLabel.text = @"剩余:";
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
