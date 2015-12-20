//
//  NearSearchResultViewController.m
//  Tianditong
//
//  Created by antonio on 15/12/20.
//  Copyright © 2015年 VickyCao. All rights reserved.
//

#import "NearSearchResultViewController.h"

@interface NearSearchResultViewController ()
@end

@implementation NearSearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id) sender{
    [self.navigationController popViewControllerAnimated:YES];
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
