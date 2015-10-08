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

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    AILog(@"%@",request.URL.absoluteString);
    //1.获得请求路径
    NSString *url = request.URL.absoluteString;
    //2.判断是不是回调地址
    NSRange range = [url rangeOfString:@"http://www.baidu.com/?code="];
    if (range.location != NSNotFound) {//是回调地址
//        获得code
        NSString *code = [[url componentsSeparatedByString:@"http://www.baidu.com/?code="]lastObject];
#warning  根据code获得accessToken
//        [self access]
    }
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    
}

@end
