//
//  NearByViewController.m
//  Tianditong
//
//  Created by antonio on 15/12/20.
//  Copyright © 2015年 VickyCao. All rights reserved.
//

#import "NearByViewController.h"

@interface NearByViewController (){
    IBOutlet UIView *buttonView;
    NSArray *dataArray;
}

@end

@implementation NearByViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    dataArray = @ [@"宾馆",@"餐饮",@"商场",@"超市",@"银行",@"ATM",@"医院",@"学校",@"药店",@"加油站"];
    [self addButtons];
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

- (IBAction)back:(id) sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) addButtons{
    float btnWidth = buttonView.frame.size.width/5.0;
    float btnHeight = buttonView.frame.size.height/2.0;
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 5; j++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(j*btnWidth, i*btnHeight, btnWidth, btnHeight);
            button.tag = (i * 5 + j + 1);
//            [button setTitle:[NSString stringWithFormat:@"%d", i * 5 + j + 1] forState:UIControlStateNormal];
            [button setTitle:dataArray[(i * 5 + j)] forState:UIControlStateNormal];
            [buttonView addSubview:button];
        }
    }
    
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
