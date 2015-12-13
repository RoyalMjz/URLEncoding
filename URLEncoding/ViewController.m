//
//  ViewController.m
//  URLEncoding
//
//  Created by Royal丶MJZ on 15/12/13.
//  Copyright (c) 2015年 mjz. All rights reserved.
//

#import "ViewController.h"
#import "NSString+URLEncoding.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.路径：通过GET方式获取接口
    NSString *path = [@"http://www.webxml.com.cn/WebServices/WeatherWebService.asmx/getWeatherbyCityName?theCityName=沈阳" URLEncodedString];
    //2.转成URL
    NSURL *url = [NSURL URLWithString:path];
    //3.建立请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //4.通过block请求数据
    //创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError) {
            NSLog(@"下载失败");
        }
        //回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"data:%@", data);
        });
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end





