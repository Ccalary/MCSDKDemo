//
//  LHDefaultViewController.m
//  LiveHomeDemo
//
//  Created by chh on 2017/12/21.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "LHDefaultViewController.h"
#import "GolbalDefine.h"
#import "UIView+LHExtension.h"
@interface LHDefaultViewController ()
@property (nonatomic, assign) CGRect frame;
@property (nonatomic ,strong)LHTemplateTabModel *model;
@end

@implementation LHDefaultViewController

- (instancetype)initWithFrame:(CGRect)frame model:(LHTemplateTabModel *)model{
    if (self = [super init]){
        self.frame = frame;
        self.model = model;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)initView{
    CGFloat viewWidth = self.frame.size.width;
    CGFloat viewHeight = self.frame.size.height;
    self.view.backgroundColor = [UIColor bgColorMain];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((viewWidth - 80)/2.0, (viewHeight - 80)/2.0 - 50, 80, 80)];
    imageView.image = [LHToolsHelper getImageWithName:@"lh_car_80"];
    [self.view addSubview:imageView];
    
    UIButton *enterBtn = [[UIButton alloc] initWithFrame:CGRectMake((viewWidth - 100)/2.0, viewHeight/2.0, 100, 30)];
    [enterBtn setTitle:@"点击进入" forState:UIControlStateNormal];
    [enterBtn setTitleColor:[UIColor themeColor] forState:UIControlStateNormal];
    enterBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    enterBtn.layer.cornerRadius = 15;
    enterBtn.layer.borderColor = [UIColor themeColor].CGColor;
    enterBtn.layer.borderWidth = 1;
    [enterBtn addTarget:self action:@selector(enterBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:enterBtn];
    
}

- (void)enterBtnAction{
    if ([self.delegate respondsToSelector:@selector(enterToWebViewWithTitle:url:)]){
        [self.delegate enterToWebViewWithTitle:self.model.title url:self.model.url];
    }
}
@end
