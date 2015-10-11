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
#import "AIComposePhotosView.h"

@interface AIComposeViewController ()<AIComposeToolbarDelegate,UITextViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property(nonatomic,strong)AITextView *textView;

@property(nonatomic,strong)UIImagePickerController *pickerVC;
@property(nonatomic,strong)AIComposeToolbar *composeToolbar;

@property(nonatomic,weak)AIComposePhotosView *photosView;
@end

@implementation AIComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏
    [self setupNavBar];
    //设置textView
    [self setupTextView];
    //添加toolbar
    [self setupToolbar];
    //添加通知监听
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardHidden:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)setupToolbar{
    //添加自定义toolbar
    AIComposeToolbar *toolBar = [[AIComposeToolbar alloc]init];
    self.composeToolbar = toolBar;
    toolBar.delegate = self;
    toolBar.width = self.view.width;
    toolBar.height = 44;
    toolBar.x = 0;
    toolBar.y = self.view.height - toolBar.height;
    [self.view addSubview:toolBar];
}

-(void)setupTextView{
    AITextView *textView = [[AITextView alloc]initWithFrame:self.view.bounds];
    textView.delegate = self;
    self.textView = textView;
    textView.placeholder = @"分享新鲜事";
    textView.font = [UIFont systemFontOfSize:20];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:textView];
    
    AIComposePhotosView *photosView = [[AIComposePhotosView alloc]init];
    self.photosView = photosView;
    photosView.width = textView.width;
    photosView.height = textView.height;
    photosView.y = 80;
    [textView addSubview:photosView];

}

#pragma mark -通知响应事件
//UIKeyboardFrameBeginUserInfoKey = NSRect: {{0, 568}, {320, 253}},
//UIKeyboardCenterEndUserInfoKey = NSPoint: {160, 441.5},
//UIKeyboardBoundsUserInfoKey = NSRect: {{0, 0}, {320, 253}},
//UIKeyboardFrameEndUserInfoKey = NSRect: {{0, 315}, {320, 253}},
//UIKeyboardAnimationDurationUserInfoKey = 0.25,
//UIKeyboardCenterBeginUserInfoKey = NSPoint: {160, 694.5},
//UIKeyboardAnimationCurveUserInfoKey = 7
-(void)keyboardShow:(NSNotification*)notif{
    //高度
    CGRect keyboardRect = [notif.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGFloat keyboardH = keyboardRect.size.height;
    [self.composeToolbar setTransform:(CGAffineTransformMakeTranslation(0, -keyboardH))];
}
-(void)keyboardHidden:(NSNotification*)notif{
    //高度
    [self.composeToolbar setTransform:CGAffineTransformIdentity];
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
            if (![UIImagePickerController isSourceTypeAvailable:(UIImagePickerControllerSourceTypeCamera)]) return;
            self.pickerVC = [[UIImagePickerController alloc]init];
            _pickerVC.delegate = self;
            [self.pickerVC setSourceType:(UIImagePickerControllerSourceTypeCamera)];
            //跳转到相册
            [self presentViewController:_pickerVC animated:YES completion:nil];
        }
            
            break;
        case AIComposeToolBarTagTypePicture:{
            AILog(@"点击相册");
            if (![UIImagePickerController isSourceTypeAvailable:(UIImagePickerControllerSourceTypePhotoLibrary)]) return;
            self.pickerVC = [[UIImagePickerController alloc]init];
            _pickerVC.delegate = self;
            [self.pickerVC setSourceType:(UIImagePickerControllerSourceTypePhotoLibrary)];
            //跳转到相册
            [self presentViewController:_pickerVC animated:YES completion:nil];
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

#pragma mark -UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [self.photosView addImage:info[UIImagePickerControllerOriginalImage]];
    [self.pickerVC dismissViewControllerAnimated:YES completion:nil];
}



@end
