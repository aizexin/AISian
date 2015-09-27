//
//  AITabBarViewController.m
//  AISian
//
//  Created by qianfeng on 15/9/26.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AITabBarViewController.h"
#import "AIMessageViewController.h"
#import "AIProfileViewController.h"
#import "AIDiscoverViewController.h"
#import "AiHomeViewController.h"
#import "AIDefine.h"
@interface AITabBarViewController ()

@end

@implementation AITabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加子视图控制器
    AiHomeViewController *homeVC = [[AiHomeViewController alloc]init];
    [self addOneChildVC:homeVC title:@"首页" imageName:@"tabbar_home" selImageName:@"tabbar_home_selected"];
    
    AIMessageViewController *messageVC = [[AIMessageViewController alloc]init];
    [self addOneChildVC:messageVC title:@"消息" imageName:@"tabbar_message_center" selImageName:@"tabbar_message_center_selected"];
    
    AIDiscoverViewController *discoverVC = [[AIDiscoverViewController alloc]init];
    [self addOneChildVC:discoverVC title:@"首页" imageName:@"tabbar_discover" selImageName:@"tabbar_discover_selected"];
    AIProfileViewController *profile = [[AIProfileViewController alloc]init];
    [self addOneChildVC:profile title:@"我" imageName:@"tabbar_profile" selImageName:@"tabbar_profile_selected"];
}

-(void)addOneChildVC:(UIViewController*)chilidVC title:(NSString*)title imageName:(NSString*)imageName selImageName:(NSString*)selImageName{
    [chilidVC.view setBackgroundColor:AIRandomColor];
    
    chilidVC.tabBarItem.title = title;
    chilidVC.tabBarItem.image = [[UIImage imageNamed:imageName]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    //被选中的图片
    UIImage *selImage = [[UIImage imageNamed:selImageName]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    chilidVC.tabBarItem.selectedImage = selImage;
    [self addChildViewController:chilidVC];
}



@end
