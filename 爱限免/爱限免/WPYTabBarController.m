//
//  WPYTabBarController.m
//  爱限免
//
//  Created by Qianfeng on 16/1/21.
//  Copyright © 2016年 王鹏宇. All rights reserved.
//

#import "WPYTabBarController.h"

@interface WPYTabBarController ()

@end

@implementation WPYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.viewControllers = [self createViewControllers];
}
- (NSArray *)createViewControllers {
    NSMutableArray * resultArray = [NSMutableArray new];
    NSArray *vcNames = @[@"LimitFreeViewController",@"DiscountViewController",@"FreeViewController"];
    NSArray * imageNames = @[@"tabbar_limitfree",@"tabbar_reduceprice",@"tabbar_appfree",@"tabbar_subject",@"tabbar_rank"];
    NSArray *titles = @[@"限 免",@"打 折",@"免费"];
    for (int i =0; i<vcNames.count; i++) {
        NSString * imagName = imageNames[i];
        NSString * hlightImageName = [NSString stringWithFormat:@"%@_press",imagName];
        Class cls = NSClassFromString(vcNames[i]);
        UIViewController *vc = [[cls alloc] init];
        UITabBarItem * item = [[UITabBarItem alloc] initWithTitle:titles[i] image:[UIImage imageNamed:imagName] selectedImage:[UIImage imageNamed:hlightImageName]];
        vc.tabBarItem = item;
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:12],NSFontAttributeName, nil];
        [item setTitleTextAttributes:dic forState:UIControlStateNormal];
        [item setTitleTextAttributes:dic forState:UIControlStateSelected];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
     UIImage * image = [[UIImage imageNamed:@"buttonbar_action"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIBarButtonItem *action = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:nil action:@selector(rightBtn:)];
        action.title=@"分类";
        
        UIImage * image2 = [[UIImage imageNamed:@"buttonbar_edit"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIButton * editBtn = [UIButton buttonWithType:UIButtonTypeSystem];
      
        UIBarButtonItem *edit = [[UIBarButtonItem alloc] initWithCustomView:editBtn];
        //action.title=@"编辑";
        vc.navigationItem.rightBarButtonItem = edit;
        vc.navigationItem.leftBarButtonItem = action;
        vc.title = titles[i];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
        label.text = titles[i];
        label.textColor = [UIColor colorWithRed:0.2 green:0.7 blue:1 alpha:1];
        label.font = [UIFont systemFontOfSize:25];
        vc.navigationItem.titleView = label;
        [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar"] forBarMetrics:UIBarMetricsDefault];
        [resultArray addObject:nav];
    }
    return resultArray;
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
