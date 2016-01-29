//
//  ViewController.m
//  5 AFNetWorkingWithNSURLSession
//
//  Created by Qianfeng on 16/1/21.
//  Copyright © 2016年 王鹏宇. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    //解析器 默认的是AFJSONResponseSerializer 返回json数据 字典 解析器 AFHTTPResponseSerializer 返回二进制数据 如果是二进制数据需要在success 中继续解析responseObject （按你要的格式）
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:@"http://10.0.8.8/sns/my/user_list.php" parameters:@{@"page":@2,@"number":@10} success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
       
        NSLog(@"%@",error);
    }];
    
    [manager POST:@"" parameters:@"" success:^(NSURLSessionDataTask *task, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
    [manager POST:@"" parameters:@"" constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        //在这里上传多张图片
        //需要服务器 给多个参数 --name
//        formData appendPartWithFileURL:<#(NSURL *)#> name:<#(NSString *)#> error:<#(NSError *__autoreleasing *)#>
        
//        formData appendPartWithFileData:<#(NSData *)#> name:<#(NSString *)#> fileName:<#(NSString *)#> mimeType:<#(NSString *)#>
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
