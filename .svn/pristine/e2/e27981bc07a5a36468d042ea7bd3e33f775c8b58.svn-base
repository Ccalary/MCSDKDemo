//
//  LHQRCodeView.m
//  LiveHomeDemo
//
//  Created by nie on 2017/12/5.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "LHQRCodeView.h"
@interface LHQRCodeView()
@property (nonatomic, strong) LHTemplateTabModel *tabModel;
@property (nonatomic, strong) NSString *qrcode; //二维码
@end

@implementation LHQRCodeView

- (instancetype)initWithFrame:(CGRect)frame andModel:(LHTemplateTabModel *)model
{
    if (self = [super initWithFrame:frame]) {
        self.tabModel = model;
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame andQrcode:(NSString *)qrcode
{
    if (self = [super initWithFrame:frame]) {
        self.qrcode = qrcode;
        [self setupPersonalUI];
    }
    return self;
}

- (void)setupUI
{
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    [self addGestureRecognizer:tap];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    UIButton *contentView = [[UIButton alloc]initWithFrame:CGRectMake(width*0.15, (self.frame.size.height - width*0.7)/2, width*0.7, width*0.7)];
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.layer.cornerRadius = 5;
    contentView.layer.masksToBounds = YES;
    [self addSubview:contentView];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = self.tabModel.qrcodetitle ?: @"";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.frame = CGRectMake(10, 0, contentView.frame.size.width - 20, 30);
    [contentView addSubview:titleLabel];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 30, contentView.frame.size.width, 0.5)];
    lineView.backgroundColor = [UIColor grayColor];
    [contentView addSubview:lineView];
    
    UIImageView *codeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(contentView.frame.size.width*0.2, contentView.frame.size.width*0.2, contentView.frame.size.width*0.6, contentView.frame.size.width*0.6)];
    [contentView addSubview:codeImageView];
    
    UILabel *detailLabel = [[UILabel alloc]init];
    detailLabel.text = self.tabModel.qrcodedescription ?: @"";
    detailLabel.textAlignment = NSTextAlignmentCenter;
    detailLabel.font = [UIFont systemFontOfSize:10];
    detailLabel.frame = CGRectMake(10, contentView.frame.size.height - 30, contentView.frame.size.width - 20, 10);
    [contentView addSubview:detailLabel];
    
    // 通过GCD的方式创建一个新的线程来异步加载图片
    dispatch_queue_t queue =
    dispatch_queue_create("cacheimage", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.tabModel.qrcodeimage]];
        // 通知主线程更新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            if (imageData) {
                codeImageView.image = [UIImage imageWithData:imageData];
            }
        });
    });
    
}

- (void)setupPersonalUI
{
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    [self addGestureRecognizer:tap];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    UIButton *contentView = [[UIButton alloc]initWithFrame:CGRectMake(width*0.15, (self.frame.size.height-width*0.7)/2, width*0.7, width*0.7)];
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.layer.cornerRadius = 5;
    contentView.layer.masksToBounds = YES;
    [self addSubview:contentView];
    
    UIImageView *codeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(contentView.frame.size.width*0.15, contentView.frame.size.width*0.15, contentView.frame.size.width*0.7, contentView.frame.size.width*0.7)];
    [contentView addSubview:codeImageView];
    // 通过GCD的方式创建一个新的线程来异步加载图片
    dispatch_queue_t queue =
    dispatch_queue_create("cacheimage", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.qrcode]];
        // 通知主线程更新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            if (imageData) {
                codeImageView.image = [UIImage imageWithData:imageData];
            }
        });
    });
    
}

- (void)dismiss
{
    [self removeFromSuperview];
}

@end
