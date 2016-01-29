//
//  ViewController.m
//  普通的下载任务
//
//  Created by Qianfeng on 16/1/21.
//  Copyright © 2016年 王鹏宇. All rights reserved.
//

#import "ViewController.h"
//播放音乐
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()<NSURLSessionDownloadDelegate>
@property (nonatomic, strong)NSURLSession * currentSession;
@property (nonatomic, strong)NSURLSessionDownloadTask *downloadTask;
@property (nonatomic, strong)AVPlayer * player;
@property (weak, nonatomic) IBOutlet UIProgressView *MyProgress;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString * path = NSHomeDirectory();
    NSLog(@"%@",path);
}
- (IBAction)startDownload:(UIButton *)sender {
    [self dowmFile];
}

- (void)dowmFile {
    //"http://111.7.130.207/cache/dldir1.qq.com/qqfile/QQforMac/QQ_V4.0.6.dmg?ich_args=cdd49b3f25f18c0a344aeeb64422b91e_7071_0_0_6_565b6306a1c9920a65071b6b95e85d8623604bb2b110bd95102a43e66ed69650_dc405cb5256640263cf80aef8d9c85c3_1_0&ich_ip="
    //1
    NSURL *url = [NSURL URLWithString:@"http://jameswatt.local/123.mp3"];
    //2
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //3
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    //4
    _currentSession = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
    //5
    _downloadTask = [_currentSession downloadTaskWithRequest:request];
    //6 开始任务
    [_downloadTask resume];
}
//下载的代理方法
//只要下载出错，下载中断，下载完成都会调用
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    if(error){
        NSLog(@"%@",error);
    }else {
        NSLog(@"下载完成");
    }
}
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    //totalBytesWritten 已经写了多少数据
    //totalBytesExpectedToWrite 总共有多少数据
    //下载进度
    double progess = (double)totalBytesWritten / (double)totalBytesExpectedToWrite;
    self.MyProgress.progress = progess;
    NSLog(@"下载进度%f",progess);
}
//只有正真下载完成的时候 才会调用
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    NSLog(@"下载完成");
    
    //寻找沙盒路径
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)lastObject];
    
    //移动到得路径
    NSString *desPath = [path stringByAppendingPathComponent:@"xxx.mp3"];
    
    NSURL *pathUrl = [NSURL fileURLWithPath:desPath];
    
    NSFileManager *fileManagr = [NSFileManager defaultManager];
    [fileManagr copyItemAtURL:location toURL:pathUrl error:nil];
    NSLog(@"%@",path);
    _player = [AVPlayer playerWithURL:pathUrl];
    [_player play];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
