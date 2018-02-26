//
//  LHShareTableViewCell.m
//  LiveHomeDemo
//
//  Created by chh on 2017/12/21.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "LHShareTableViewCell.h"
#import "UIColor+LHExtension.h"
#import "GolbalDefine.h"
@interface LHShareTableViewCell()
@property (nonatomic, strong) UILabel *titleLabel, *contentLabel;
@property (nonatomic, strong) UIImageView *iconImageView, *rankImageView;
@property (nonatomic, strong) UIView *dividerLine;
@end
@implementation LHShareTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
//处理宽高不跟随设置的问题
- (void)setFrame:(CGRect)frame
{
    frame.size = CGSizeMake(LH_ScreenWidth, 75);
    [super setFrame:frame];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.rankImageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.dividerLine];
}

- (UIImageView *)iconImageView{
    if (!_iconImageView){
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 12.5, 50, 50)];
        _iconImageView.layer.cornerRadius = 25;
        _iconImageView.clipsToBounds = YES;
        _iconImageView.image = [LHToolsHelper getImageWithName:@"lh_header_50"];
    }
    return _iconImageView;
}

- (UIImageView *)rankImageView{
    if (!_rankImageView){
        _rankImageView = [[UIImageView alloc] initWithFrame:CGRectMake(16.5, 47, 47, 15)];
    }
    return _rankImageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel){
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_iconImageView.frame) + 10, 0, 160, self.frame.size.height)];
        _titleLabel.text = @"游客用户";
        _titleLabel.font = LH_Font_System(15);
        _titleLabel.textColor = [UIColor fontColorGrayBlck];
    }
    return _titleLabel;
}

- (UILabel *)contentLabel{
    if (!_contentLabel){
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - 115, 0, 100, self.frame.size.height)];
        _contentLabel.textColor = [UIColor fontColorGrayBlck];
        _contentLabel.font = LH_Font_System(14);
        _contentLabel.text = @"分享200次";
        _contentLabel.textAlignment = NSTextAlignmentRight;
    }
    return _contentLabel;
}
- (UIView *)dividerLine{
    if (!_dividerLine){
        _dividerLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 1, self.frame.size.width, 1)];
        _dividerLine.backgroundColor = [UIColor bgColorLine];
    }
    return _dividerLine;
}

- (void)setModel:(LHRankModel *)model{
    [self layoutIfNeeded];
    _model = model;
    
    self.titleLabel.text = model.name ?: @"";
    self.contentLabel.text = [NSString stringWithFormat:@"分享%d次",model.count];
    if (model.index > 0 && model.index < 4){
        //根据图片名字添加123名
        self.rankImageView.image = [LHToolsHelper getImageWithName:[NSString stringWithFormat:@"lh_NO%d_47x15",model.index]];
    }else {
        self.rankImageView.image = [UIImage imageNamed:@""];
    }
    
    //将加载好的图片存入model中
    if (model.imageData){
        self.iconImageView.image = [UIImage imageWithData:model.imageData];
    }else{
        if (model.image.length == 0){
            self.iconImageView.image = [LHToolsHelper getImageWithName:@"lh_header_50"];
            return;
        }
        // 通过GCD的方式创建一个新的线程来异步加载图片
        dispatch_queue_t queue = dispatch_queue_create("cacheimage", DISPATCH_QUEUE_CONCURRENT);
        dispatch_async(queue, ^{
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:model.image]];
            // 通知主线程更新UI
            dispatch_async(dispatch_get_main_queue(), ^{
                if (imageData) {
                    self.iconImageView.image = [UIImage imageWithData:imageData];
                    model.imageData = imageData;
                }
            });
        });
    }
    
}
@end
