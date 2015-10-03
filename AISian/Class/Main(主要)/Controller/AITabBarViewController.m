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
#import "AIBaseNavController.h"
#import "AITabBar.h"
#import "AIComposeViewController.h"
@interface AITabBarViewController ()<AITabBarDelegate>

@end

@implementation AITabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加子视图控制器
    [self addAllChildVcs];
    
    //调整tabBar
    AITabBar *customTabBar = [[AITabBar alloc]init];
    customTabBar.plusDelegate = self;
    [self setValue:customTabBar forKey:@"tabBar"];
}

- (void)addAllChildVcs{
    AiHomeViewController *homeVC = [[AiHomeViewController alloc]init];
    [self addOneChildVC:homeVC title:@"首页" imageName:@"tabbar_home" selImageName:@"tabbar_home_selected"];
    
    AIMessageViewController *messageVC = [[AIMessageViewController alloc]init];
    [self addOneChildVC:messageVC title:@"消息" imageName:@"tabbar_message_center" selImageName:@"tabbar_message_center_selected"];
    
    AIDiscoverViewController *discoverVC = [[AIDiscoverViewController alloc]init];
    [self addOneChildVC:discoverVC title:@"发现" imageName:@"tabbar_discover" selImageName:@"tabbar_discover_selected"];
    AIProfileViewController *profile = [[AIProfileViewController alloc]init];
    [self addOneChildVC:profile title:@"我" imageName:@"tabbar_profile" selImageName:@"tabbar_profile_selected"];
}
/**
 *  添加自控制器
 *
 *  @param chilidVC     自控制器
 *  @param title        标题
 *  @param imageName    正常图片
 *  @param selImageName 被选中图片
 */
-(void)addOneChildVC:(UIViewController*)chilidVC title:(NSString*)title imageName:(NSString*)imageName selImageName:(NSString*)selImageName{
    //设置标题
    chilidVC.title = title;
    //设置正常文字颜色
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    dictM[NSForegroundColorAttributeName] = [UIColor blackColor];
    [chilidVC.tabBarItem setTitleTextAttributes:dictM forState:(UIControlStateNormal)];
    //设置被选中文字颜色
    NSMutableDictionary *seldictM = [NSMutableDictionary dictionary];
    seldictM[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    seldictM[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [chilidVC.tabBarItem setTitleTextAttributes:seldictM forState:(UIControlStateSelected)];
    //设置正常图片
    chilidVC.tabBarItem.image = [[UIImage imageNamed:imageName]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    //被选中的图片
    UIImage *selImage = [[UIImage imageNamed:selImageName]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    chilidVC.tabBarItem.selectedImage = selImage;
    //添加导航控制器
    AIBaseNavController *navVC = [[AIBaseNavController alloc]initWithRootViewController:chilidVC];
    [self addChildViewController:navVC];
}
#pragma mark -AITabBarDelegate
-(void)tabBarDidClickedPlusButton:(AITabBar *)tabBar{
    AIComposeViewController *composeVC = [[AIComposeViewController alloc]init];
    composeVC.title = @"发微博";
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:composeVC];
    [self presentViewController:nav animated:YES completion:nil];
}


@end
