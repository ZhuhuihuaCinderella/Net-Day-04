//
//  ViewController.m
//  1NSURLSessionBaseDemo
//
//  Created by Qianfeng on 16/1/21.
//  Copyright © 2016年 王鹏宇. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionDataDelegate>
//存放请求返回的数据
@property (nonatomic, strong)NSMutableData *resultData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //1 NSURL
    NSURL *url = [NSURL URLWithString:@"http://10.0.8.8/sns/my/user_list.php"];
    
    
    //2 NSURLRequest
   // NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    //2(post) NSMUtableURLRequest
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"post";
    request.HTTPBody = [@"number=10&page=2" dataUsingEncoding:NSUTF8StringEncoding];
    
    
    //首先需要一个工作模式 1 普通任务（get post）2 瞬时任务 3 后台任务
    
    //3 工作模式 默认的工作模式
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    //请求的超时时间
    config.timeoutIntervalForRequest = 60;
    
    //4
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    //5 task
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request];
    //6 开始任务
    [dataTask resume];
}

#pragma mark - NSURLSessionDataDelegate 
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    NSLog(@"请求已经开始了，收到回应%@",response);
    
    //Content-Type" = "text/html" 返回的内容类型
    //"Content-Length" = 744; 内容长度，将要下载的内容有多大
    //status code: 200 状态码
    //URL: http://10.0.8.8/sns/my/user_list.php 我们请求的接口
    //所有响应头内容 （response响应）
    NSDictionary *responsHeader = [(NSHTTPURLResponse *)response allHeaderFields];
    NSLog(@"%@",responsHeader[@"Content-Length"]);
    //初始化
    _resultData = [[NSMutableData alloc] init];
    //这个block 一定要调用
    completionHandler(NSURLSessionResponseAllow);
}
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    NSLog(@"接受到数据%ld",data.length);
    //每次接受到数据就添加到resultData
    [self.resultData appendData:data];
}
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    NSLog(@"请求结束了");
    if (error) {
        NSLog(@"请求失败了%@",error);
    }else {
        NSLog(@"请求成功了");
        //json 解析
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:self.resultData options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",dict);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
