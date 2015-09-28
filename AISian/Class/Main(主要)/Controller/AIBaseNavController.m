//
//  AIBaseNavController.m
//  AISian
//
//  Created by 艾泽鑫 on 15/9/27.
//  Copyright © 2015年 aizexin. All rights reserved.
//

#import "AIBaseNavController.h"
#import "UIBarButtonItem+Extension.h"
@interface AIBaseNavController ()

@end

@implementation AIBaseNavController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


+(void)initialize{
    //设置主题
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    item.tintColor = [UIColor orangeColor];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) { // 如果现在push的不是栈底控制器(最先push进来的那个控制器)
        viewController.hidesBottomBarWhenPushed = YES;
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd) target:nil action:nil];
//        self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTagert:self action:@selector(onClickBackBtn:) NorImageName:@"navigationbar_back" andHeiImageName:@"navigationbar_back_highlighted"];
    }
    [super pushViewController:viewController animated:animated];
}


@end
