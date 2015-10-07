//
//  AIOAuthViewController.m
//  AISian
//
//  Created by 艾泽鑫 on 15/10/7.
//  Copyright © 2015年 aizexin. All rights reserved.
//

#import "AIOAuthViewController.h"
#import "AIDefine.h"
@interface AIOAuthViewController ()<UIWebViewDelegate>

@end

@implementation AIOAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.创建UIWebView
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.bounds;
    [self.view addSubview:webView];
    // 2.加载登录页面
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=568335106&redirect_uri=http://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    webView.delegate = self;
}



@end
