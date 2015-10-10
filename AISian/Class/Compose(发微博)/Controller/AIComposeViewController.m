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
#import "AIComposeToolbar.h"

@interface AIComposeViewController ()<AIComposeToolbarDelegate,UIScrollViewDelegate>
@property(nonatomic,strong)AITextView *textView;
@end

@implementation AIComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏
    [self setupNavBar];
    //设置textView
    [self setupTextView];
    
}
-(void)setupTextView{
    AITextView *textView = [[AITextView alloc]initWithFrame:self.view.bounds];
    textView.delegate = self;
    self.textView = textView;
    textView.placeholder = @"分享新鲜事";
    textView.font = [UIFont systemFontOfSize:20];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:textView];
    //添加自定义toolbar
    AIComposeToolbar *toolBar = [[AIComposeToolbar alloc]init];
    toolBar.delegate = self;
    toolBar.width = self.view.width;
    toolBar.height = 44;
    textView.inputAccessoryView = toolBar;
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
#pragma mark AIComposeToolbarDelegate
-(void)composeToolbar:(AIComposeToolbar *)toolbar didClick:(AIComposeToolBarTagType)type{
    switch (type) {
        case AIComposeToolBarTagTypeCamera:{
            AILog(@"点击相机");
        }
            
            break;
        case AIComposeToolBarTagTypePicture:{
            AILog(@"点击相册");
        }
            
            break;
        case AIComposeToolBarTagTypeEmotion:{
            AILog(@"点击表情");
        }
            
            break;
            
        default:
            break;
    }
}
#pragma mark -UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}

@end
