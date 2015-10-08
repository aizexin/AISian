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
#import "AFHTTPRequestOperationManager.h"
#import "AIAccountTool.h"
#import "AIAccountModel.h"
#import "MJExtension.h"
#import "AIStatusesModel.h"
#import "UIImageView+AFNetworking.h"
#import "AIUserModel.h"
@interface AiHomeViewController ()<AIPopMenuDelegate>
@property(nonatomic,strong)AIHomeTitleButton *titleBtn;
@property(nonatomic,strong)AIPopMenu *popMenu;
@property(nonatomic,strong)NSMutableArray *statuses;
@end

@implementation AiHomeViewController


-(NSMutableArray *)statuses{
    if (!_statuses) {
        _statuses = [NSMutableArray array];
    }
    return _statuses;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AILog(@"%@",NSHomeDirectory());
    [self setupNavBar];
//    //加载数据
//    [self loadNewData];
    //集成刷新控件
    [self setupRefresh];
}

/**
 *  集成刷新控件
 */
- (void)setupRefresh{
    UIRefreshControl *refresh = [[UIRefreshControl alloc]init];
    [self.tableView addSubview:refresh];
    //2.监听refresh
    [refresh addTarget:self action:@selector(refreshControlStateChange:) forControlEvents:(UIControlEventValueChanged)];
}
/**
 *  刷新方法
 */
-(void)refreshControlStateChange:(UIRefreshControl*)refresh{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //从沙盒中获得accessToken
    //封装参数
    AIAccountModel *account = [AIAccountTool account];
    params[@"access_token"] = account.access_token;
    AIStatusesModel *statuse = [self.statuses firstObject];
    if (statuse) {
        params[@"since_id"] = statuse.idstr;
    }
    //get请求
    [manager GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        AILog(@"请求成功");
        NSArray *statuses = responseObject[@"statuses"];
        AILog(@"%ld",statuses.count);
        statuses = [AIStatusesModel objectArrayWithKeyValuesArray:statuses];
        //讲数据查到最前面
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, statuses.count)];
        [self.statuses insertObjects:statuses atIndexes:indexSet];
        [self.tableView reloadData];
        //提示用户刷新数量
        [self showNewStatuesCount:statuses.count];
        //停止刷新
        [refresh endRefreshing];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        AILog(@"请求失败%@",error.description);
        //停止刷新
        [refresh endRefreshing];
    }];
}
/**
 *  提示用户刷新数量
 *
 *  @param count 最新微博的数量
 */
-(void)showNewStatuesCount:(NSInteger)count{
    UILabel *label = [[UILabel alloc]init];
    if (count) {
        label.text = [NSString stringWithFormat:@"共有%ld条新数据",count];
    }else{
        label.text = @"没有新数据";
    }
    //3.设置背景
    label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"timeline_new_status_background"]];
    [label setTextAlignment:(NSTextAlignmentCenter)];
    label.textColor = [UIColor whiteColor];
    //设置frame
    label.width = self.view.width;
    label.height = 35;
    label.x = 0;
    label.y = 64 - label.height;
    
    //添加到当行控制器的view中
    [self.navigationController.view insertSubview:label belowSubview:self.navigationController.navigationBar];
    //动画
    CGFloat duration = 0.75;
    label.alpha = 0.;
    //往下移动
    [UIView animateWithDuration:duration animations:^{
        [label setTransform:(CGAffineTransformMakeTranslation(0, label.height))];
        label.alpha = 1.;
    }];
    //往上移动
    [UIView animateWithDuration:duration delay:1. options:(UIViewAnimationOptionCurveEaseOut) animations:^{
        label.transform = CGAffineTransformIdentity;
        label.alpha = 0.;
    } completion:^(BOOL finished) {
        [label removeFromSuperview];
    }];
    
}
///**
// *  加载数据
// */
//- (void)loadNewData{
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    //从沙盒中获得accessToken
//    AIAccountModel *account = [AIAccountTool account];
//    params[@"access_token"] = account.access_token;
//    //get请求
//
//    [manager GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        AILog(@"请求成功");
//        NSArray *statuses = responseObject[@"statuses"];
//        self.statuses = [AIStatusesModel objectArrayWithKeyValuesArray:statuses];
//        [self.tableView reloadData];
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        AILog(@"请求失败%@",error.description);
//    }];
//}
/**
 *  设置navBar
 */
-(void)setupNavBar{
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
    return self.statuses.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier ];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:identifier];
    }
    AIStatusesModel *statuse = self.statuses[indexPath.row];
    cell.textLabel.text = statuse.text;
    [cell.imageView setImageWithURL:[NSURL URLWithString:statuse.user.profile_image_url]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AITemp1ViewController *temp1VC = [[AITemp1ViewController alloc]init];
    [self.navigationController pushViewController:temp1VC animated:YES];
}

@end
