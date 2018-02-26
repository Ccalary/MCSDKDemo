//
//  LHLogoView.m
//  LiveHomeDemo
//
//  Created by chh on 2017/12/9.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "LHLogoView.h"
@interface LHLogoView()
@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, strong) LHTemplateModel *model;
@end
@implementation LHLogoView
- (instancetype)initWithFrame:(CGRect)frame andModel:(LHTemplateModel *)model{
    if (self = [super initWithFrame:frame]){
        self.model = model;
        
        [self initView];
    }
    return self;
}

- (void)initView{
    _logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width - 64)/2.0, (self.frame.size.height - 64)/2.0, 64, 64)];
    _logoImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_logoImageView];
    switch (self.model.LogoShape) {
        case 0://方形
            break;
        case 1://方形圆角
            _logoImageView.layer.cornerRadius = 4.0;
            _logoImageView.clipsToBounds = YES;
            break;
        case 2://圆形
            _logoImageView.layer.cornerRadius = 32;
            _logoImageView.layer.borderWidth = 2;
            _logoImageView.layer.borderColor = [UIColor whiteColor].CGColor;
            _logoImageView.clipsToBounds = YES;
            break;
        default:
            break;
    }

    // 通过GCD的方式创建一个新的线程来异步加载图片
    dispatch_queue_t queue =
    dispatch_queue_create("cacheimage", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.model.Logo]];
        // 通知主线程更新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            if (imageData) {
                _logoImageView.image = [UIImage imageWithData:imageData];
            }
        });
    });
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}

- (void)buttonAction{
    if (!self.model.logourl.length) return;
    if ([self.delegate respondsToSelector:@selector(logoBtnClickWithUrl:)]){
        [self.delegate logoBtnClickWithUrl:self.model.logourl];
    }
}
@end
