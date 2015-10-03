//
//  AiHomeViewController.m
//  AISian
//
//  Created by qianfeng on 15/9/26.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AiHomeViewController.h"
#import "AITemp1ViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "AITemp1ViewController.h"
#import "AIHomeTitleButton.h"
#import "UIImage+Extension.h"
#import "AIDefine.h"
#import "UIView+Extension.h"
#import "AIPopMenu.h"
@interface AiHomeViewController ()<AIPopMenuDelegate>
@property(nonatomic,strong)AIHomeTitleButton *titleBtn;
@property(nonatomic,strong)AIPopMenu *popMenu;
@end

@implementation AiHomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    AILog(@"%@",NSHomeDirectory());
    //设置导航栏左右按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTagert:self action:@selector(onClickLeftItem:) NorImageName:@"navigationbar_friendsearch" andHeiImageName:@"navigationbar_friendsearch_highlighted"];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTagert:self action:nil NorImageName:@"navigationbar_pop" andHeiImageName:@"navigationbar_pop_highlighted"];
    
    //
    AIHomeTitleButton *titleBtn = [[AIHomeTitleButton alloc]init];
    _titleBtn = titleBtn;
    titleBtn.size = CGSizeMake(100, 35);
    [titleBtn setTitle:@"首页" forState:(UIControlStateNormal)];
    UIImage *higImage = [UIImage resizedImage:@"navigationbar_filter_background_highlighted"];
    [titleBtn setBackgroundImage:higImage forState:(UIControlStateHighlighted)];
    [titleBtn addTarget:self action:@selector(onClickTitleItem:) forControlEvents:(UIControlEventTouchUpInside)];
    [titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:(UIControlStateNormal)];
    self.navigationItem.titleView = titleBtn;
    
}
#pragma mark -按钮点击事件
/**
 *  点击做按钮
 */
-(void)onClickLeftItem:(UIBarButtonItem*)item{
    AITemp1ViewController *temp1VC = [[AITemp1ViewController alloc]init];
    [self.navigationController pushViewController:temp1VC animated:YES];
}
/**
 *  点击标题
 */
-(void)onClickTitleItem:(AIHomeTitleButton*)btn{
    UIImage *image = [UIImage imageNamed:@"navigationbar_arrow_down"];
    if ([image isEqual: [btn imageForState:(UIControlStateNormal)]]) {
        [btn setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:(UIControlStateNormal)];
        self.popMenu = [AIPopMenu popMenuWithContentView:[[UISwitch alloc]init]];
        self.popMenu.delegate = self;
        [self.popMenu showInRect:CGRectMake(100, 0, 100, 100)];
        [self.view addSubview:self.popMenu];
    }else{
        [_popMenu dismiss];
    }
}
#pragma  mark -AIPopMenuDelegate
-(void)popMenuDisMiss:(AIPopMenu *)popMenu{
    [_titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:(UIControlStateNormal)];
    [popMenu removeFromSuperview];
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier ];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"首页测试数据%ld",indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AITemp1ViewController *temp1VC = [[AITemp1ViewController alloc]init];
    [self.navigationController pushViewController:temp1VC animated:YES];
}




@end
