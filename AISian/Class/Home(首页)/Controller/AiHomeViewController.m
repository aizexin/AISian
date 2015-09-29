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
@interface AiHomeViewController ()
@end

@implementation AiHomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    //设置导航栏左右按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTagert:self action:@selector(onClickLeftItem:) NorImageName:@"navigationbar_friendsearch" andHeiImageName:@"navigationbar_friendsearch_highlighted"];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTagert:self action:nil NorImageName:@"navigationbar_pop" andHeiImageName:@"navigationbar_pop_highlighted"];
    
    //
    AIHomeTitleButton *titleBtn = [[AIHomeTitleButton alloc]init];
    [titleBtn setTitle:@"首页首页" forState:(UIControlStateNormal)];
    UIImage *bgImage = [UIImage imageNamed:@"navigationbar_arrow_down"];
//    [titleBtn setImage:bgImage forState:(UIControlStateNormal)];
    self.navigationItem.titleView = titleBtn;
    
}

-(void)onClickLeftItem:(UIBarButtonItem*)item{
    AITemp1ViewController *temp1VC = [[AITemp1ViewController alloc]init];
    [self.navigationController pushViewController:temp1VC animated:YES];
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


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
