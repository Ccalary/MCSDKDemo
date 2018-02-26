//
//  LHEnterViewController.m
//  LiveHomeDemo
//
//  Created by chh on 2017/12/8.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "LHEnterViewController.h"
#import "LHMainViewController.h"
#import "LHNetRequest.h"
#import "LHUserHelper.h"
#import "LHApi.h"
#import "LHSecretViewController.h"

@interface LHEnterViewController ()

@end

@implementation LHEnterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"首页";
    [[LHApi sharedInstance] loginWithUserId:@"0000" name:@"chh" portrait:@"" success:^{

    } failure:^{

    }];
}

- (void)viewWillAppear:(BOOL)animated{
     [[LHApi sharedInstance] upLoadShareSuccessInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    LHSecretViewController *vc = [[LHSecretViewController alloc] init];
//    [self.navigationController presentViewController:vc animated:YES completion:nil];
    
    LHMainViewController *vc = [[LHMainViewController alloc] initWithPlayVideoType:LHPlayVideoTypeLive playId:@"3f2b2aa05683473db94bed303e112d59"];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
