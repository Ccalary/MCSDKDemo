//
//  LHMessageHUD.m
//  LiveHomeDemo
//
//  Created by chh on 2017/12/26.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "LHMessageHUD.h"
@interface LHMessageHUD()
@property (nonatomic, strong) UILabel *msgLabel;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) CGRect rect;
@property (nonatomic, assign) int count;
@end
@implementation LHMessageHUD
+ (LHMessageHUD *)shareInstance{
    static LHMessageHUD *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[LHMessageHUD alloc] initWithFrame:CGRectZero content:@""];
        shareInstance.userInteractionEnabled = NO;
    });
    return shareInstance;
}
- (instancetype)initWithFrame:(CGRect)frame content:(NSString *)content{
    if (self = [super initWithFrame:frame]){
        [self initView];
    }
    return self;
}

+ (void)showMessage:(NSString *)message{
    LHMessageHUD *hud = [LHMessageHUD shareInstance];
    if (message.length > 0){
        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
        CGSize textSize = [message boundingRectWithSize:CGSizeMake(150, 100) options:NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;
        hud.frame = CGRectMake(0, 0, textSize.width + 20, textSize.height + 20);
        hud.msgLabel.frame = CGRectMake(0, 0, hud.frame.size.width, hud.frame.size.height);
        hud.msgLabel.text = message;
        hud.msgLabel.alpha = 1;
        hud.count = 2;
        [hud initTimer];
        [[UIApplication sharedApplication].keyWindow addSubview:hud];
        hud.center = [UIApplication sharedApplication].keyWindow.center;
    }
   
}

- (void)initTimer{
    [_timer invalidate];
    _timer = nil;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    [_timer fire];
}

- (void)initView{
    _msgLabel = [[UILabel alloc] init];
    _msgLabel.textAlignment = NSTextAlignmentCenter;
    _msgLabel.textColor = [UIColor whiteColor];
    _msgLabel.font = [UIFont systemFontOfSize:14];
    _msgLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    _msgLabel.layer.cornerRadius = 4.0;
    _msgLabel.clipsToBounds = YES;
    [self addSubview:_msgLabel];
}

- (void)timerAction:(NSTimer *)timer{
    self.count --;
    if (self.count == 0){
        [timer invalidate];
        timer = nil;
        [UIView animateWithDuration:0.3 animations:^{
            self.msgLabel.alpha = 0;
            self.msgLabel.frame = CGRectMake(self.msgLabel.center.x, self.msgLabel.center.y, 0, 0);
        }completion:^(BOOL finished) {
            
        }];
    }
}
@end
