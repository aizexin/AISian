//
//  AIComposeViewController.m
//  AISian
//
//  Created by 艾泽鑫 on 15/10/3.
//  Copyright © 2015年 aizexin. All rights reserved.
//

#import "AIComposeViewController.h"

@interface AIComposeViewController ()

@end

@implementation AIComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor yellowColor]];
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
