//
//  AIComposeViewController.m
//  AISian
//
//  Created by 艾泽鑫 on 15/10/3.
//  Copyright © 2015年 aizexin. All rights reserved.
//

#import "AIComposeViewController.h"
#import "AIDefine.h"
#import "AITextView.h"
@interface AIComposeViewController ()
@property(nonatomic,strong)AITextView *textView;
@end

@implementation AIComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
    AITextView *textView = [[AITextView alloc]initWithFrame:self.view.bounds];
    self.textView = textView;
    textView.placeholder = @"分享新鲜事";
    textView.font = [UIFont systemFontOfSize:20];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:textView];
    
}
/**
 *  设置导航栏
 */
-(void)setupNavBar
{
    //设置取消
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:(UIBarButtonItemStylePlain) target:self action:@selector(onClickCancel:)];
    //设置发送
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"发送" style:(UIBarButtonItemStylePlain) target:self action:@selector(onClickSend:)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
}
#pragma mark -按钮点击事件
-(void)onClickCancel:(UIBarButtonItem*)cancel{

    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)onClickSend:(UIBarButtonItem*)send{
   
}


@end
