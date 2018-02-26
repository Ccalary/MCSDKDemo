//
//  LHVoteCollectionViewCell.m
//  LiveHomeDemo
//
//  Created by chh on 2017/12/22.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "LHVoteCollectionViewCell.h"
#import "GolbalDefine.h"
#import "UIImageView+MHImageWebCache.h"
@interface LHVoteCollectionViewCell()
@property (nonatomic, strong) UIImageView *videoImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIButton *voteBtn;
@property (nonatomic, strong) UIView *dividerView;
@end
@implementation LHVoteCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        [self initView];
    }
    return self;
}

- (void)initView{
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    _dividerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 5)];
    _dividerView.backgroundColor = [UIColor bgColorMain];
    [self.contentView addSubview:_dividerView];
    
    _videoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5, self.frame.size.width, 100)];
    _videoImageView.backgroundColor = [UIColor grayColor];
    _videoImageView.contentMode = UIViewContentModeScaleAspectFill;
    _videoImageView.clipsToBounds = YES;
    _videoImageView.layer.cornerRadius = 4.0;
    [self.contentView addSubview:_videoImageView];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(_videoImageView.frame) + 10, self.frame.size.width - 10, 40)];
    _nameLabel.font = [UIFont systemFontOfSize:15];
    _nameLabel.textColor = [UIColor fontColorBlack];
    _nameLabel.numberOfLines = 0;
    _nameLabel.text = @"企业发展";
    [self.contentView addSubview:_nameLabel];
    
    _voteBtn = [[UIButton alloc] initWithFrame:CGRectMake((self.frame.size.width - 100)/2.0, CGRectGetMaxY(_nameLabel.frame) + 10, 100, 35)];
    _voteBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_voteBtn setImage:[LHToolsHelper getImageWithName:@"lh_vote_12"] forState:UIControlStateNormal];
    [_voteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_voteBtn setTitle:@"投票" forState:UIControlStateNormal];
    _voteBtn.layer.cornerRadius = 4.0;
    [_voteBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 3, 0, 0)];
    [_voteBtn setBackgroundColor:[UIColor themeColor]];
    [_voteBtn addTarget:self action:@selector(voteAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_voteBtn];
}

- (void)setCellType:(int)cellType{
    if (cellType == 0){
        _dividerView.frame = CGRectMake(0, 0, self.frame.size.width, 1);
        _videoImageView.frame = CGRectMake(10, 15, 100, 100);
        _videoImageView.image = [LHToolsHelper getImageWithName:@"lh_default_95"];
        _nameLabel.frame = CGRectMake(CGRectGetMaxX(_videoImageView.frame) + 10, CGRectGetMinY(_videoImageView.frame), self.frame.size.width - 130, 50);
        _voteBtn.frame = CGRectMake(CGRectGetMaxX(_videoImageView.frame) + 10, CGRectGetMaxY(_nameLabel.frame) + 10, 100, 35);
    }else if (cellType == 1){
        _dividerView.frame = CGRectMake(0, 0, self.frame.size.width, 5);
        _videoImageView.frame = CGRectMake(0, 5, self.frame.size.width, 100);
        _videoImageView.image = [LHToolsHelper getImageWithName:@"lh_defautl_180x95"];
        _nameLabel.frame = CGRectMake(5, CGRectGetMaxY(_videoImageView.frame) + 10, self.frame.size.width - 10, 40);
        _voteBtn.frame = CGRectMake((self.frame.size.width - 100)/2.0, CGRectGetMaxY(_nameLabel.frame) + 10, 100, 35);
    }
}

- (void)voteAction:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(voteCellVoteBtnAction:)]){
        [self.delegate voteCellVoteBtnAction:self];
    }
}

- (void)setModel:(LHVoteModel *)model{
    _model = model;
    _nameLabel.text = model.content;
    if (model.vote){//已投
        [_voteBtn setBackgroundColor:[UIColor lightGrayColor]];
        _voteBtn.userInteractionEnabled = NO;
    }else {
        [_voteBtn setBackgroundColor:[UIColor themeColor]];
        _voteBtn.userInteractionEnabled = YES;
    }
    //将加载好的图片存入model中
    if (model.imageData){
        self.videoImageView.image = [UIImage imageWithData:model.imageData];
    }else{
        // 通过GCD的方式创建一个新的线程来异步加载图片
        dispatch_queue_t queue = dispatch_queue_create("cacheimage", DISPATCH_QUEUE_CONCURRENT);
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
}
@end
