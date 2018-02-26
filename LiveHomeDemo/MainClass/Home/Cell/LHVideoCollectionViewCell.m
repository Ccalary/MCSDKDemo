//
//  LHVideoCollectionViewCell.m
//  LiveHomeDemo
//
//  Created by chh on 2017/12/5.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "LHVideoCollectionViewCell.h"
#import "GolbalDefine.h"
#import "UIImageView+MHImageWebCache.h"
@interface LHVideoCollectionViewCell()
@property (nonatomic, strong) UIImageView *videoImageView;
@property (nonatomic, strong) UILabel *nameLabel, *timeLabel;
@property (nonatomic, strong) UIButton *countBtn;
@end
@implementation LHVideoCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        [self initView];
    }
    return self;
}

- (void)initView{
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 5)];
    topView.backgroundColor = [UIColor bgColorMain];
    [self.contentView addSubview:topView];
    
    _videoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5, self.frame.size.width, 110)];
    _videoImageView.backgroundColor = [UIColor grayColor];
    _videoImageView.image = [LHToolsHelper getImageWithName:@"lh_defautl_180x95"];
    _videoImageView.contentMode = UIViewContentModeScaleAspectFill;
    _videoImageView.clipsToBounds = YES;
    [self.contentView addSubview:_videoImageView];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(_videoImageView.frame) + 10, self.frame.size.width - 10, 40)];
    _nameLabel.font = [UIFont systemFontOfSize:15];
    _nameLabel.textColor = [UIColor fontColorBlack];
    _nameLabel.numberOfLines = 0;
    _nameLabel.text = @"企业发展";
    [self.contentView addSubview:_nameLabel];
    
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(_nameLabel.frame) + 7, self.frame.size.width - 70, 15)];
    _timeLabel.font = [UIFont systemFontOfSize:12];
    _timeLabel.textColor = [UIColor fontColorLightGray];
    _timeLabel.text = @"2017.12.01 13:00";
    [self.contentView addSubview:_timeLabel];
    
    _countBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_timeLabel.frame), CGRectGetMinY(_timeLabel.frame), 60, 15)];
    _countBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    _countBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [_countBtn setImage:[LHToolsHelper getImageWithName:@"lh_eye_12x8"] forState:UIControlStateNormal];
    [_countBtn setTitleColor:[UIColor fontColorLightGray] forState:UIControlStateNormal];
    [_countBtn setTitle:@"0" forState:UIControlStateNormal];
    [_countBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 3, 0, 0)];
    _countBtn.userInteractionEnabled = NO;
    [self.contentView addSubview:_countBtn];
}

- (void)setModel:(LHLiveInfoModel *)model{
    _model = model;
    //将加载好的图片存入model中
    if (model.imageData){
        _videoImageView.image = [UIImage imageWithData:model.imageData];
    }else{
    // 通过GCD的方式创建一个新的线程来异步加载图片
    dispatch_queue_t queue =
    dispatch_queue_create("cacheimage", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:model.image]];
        // 通知主线程更新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            if (imageData) {
                self.videoImageView.image = [UIImage imageWithData:imageData];
                model.imageData = imageData;
            }
        });
     });
    }
    _nameLabel.text = model.name;
    _timeLabel.text = model.time;
    [_countBtn setTitle:[NSString stringWithFormat:@"%d",model.count] forState:UIControlStateNormal];
}

@end
