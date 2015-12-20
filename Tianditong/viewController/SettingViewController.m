//
//  SettingViewController.m
//  Tianditong
//
//  Created by antonio on 15/12/20.
//  Copyright © 2015年 VickyCao. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()<UITableViewDataSource, UITableViewDelegate> {
    IBOutlet UITableView *settingTableView;
    NSArray *dataArray;
    
}

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    
    NSDictionary *dic1 = @{@"identifer":@"switchCity",@"title":@"切换城市", @"cellIdenti":@"settingIdentifer"};
    NSDictionary *dic2 = @{@"identifer":@"downloadMaps",@"title":@"下载地图", @"cellIdenti":@"settingIdentifer"};
    NSDictionary *dic3 = @{@"identifer":@"aboutTianDiTu",@"title":@"关于天地图", @"cellIdenti":@"settingIdentifer"};
    
    
    NSDictionary *dic4 = @{@"identifer":@"",@"title":@"保持屏幕常亮", @"cellIdenti":@"settingIdentifer2"};
    NSDictionary *dic5 = @{@"identifer":@"",@"title":@"一键清除地图缓存", @"cellIdenti":@"settingIdentifer1"};
    
    
    dataArray = @[@[dic1, dic2], @[dic4], @[dic5], @[dic3]];
    [settingTableView reloadData];
    
}

- (void) viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}

- (void) viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *data = [dataArray objectAtIndex:section];
    return data.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic = [dataArray objectAtIndex:indexPath.section][indexPath.row];
    NSString *Identifier = dic[@"cellIdenti"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
//    cell.textLabel.text = [dic objectForKey:@"title"];
    UILabel *titleLabel = [cell.contentView viewWithTag:1];
    titleLabel.text = [dic objectForKey:@"title"];
    if (indexPath.section == 2) {
        UILabel *detailLabel = [cell.contentView viewWithTag:2];
        detailLabel.text = @"清空所有的缓存，已使用0.0MB";
    }else if (indexPath.section == 1){
        UILabel *detailLabel = [cell.contentView viewWithTag:2];
        detailLabel.text = @"使用本软件时屏幕常亮，耗电量大";
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 0 || indexPath.section == 3){
        return 44.0f;
    }
    return 85.0f;
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic = [dataArray objectAtIndex:indexPath.section][indexPath.row];
    NSString * Identifer = [dic objectForKey:@"identifer"];
    if(Identifer == nil || [Identifer isEqualToString:@""]){
        return;
    }
    [self performSegueWithIdentifier:Identifer sender:self];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
