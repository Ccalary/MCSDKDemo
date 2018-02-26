//
//  LHVoteCollectionViewCell.h
//  LiveHomeDemo
//
//  Created by chh on 2017/12/22.
//  Copyright © 2017年 chh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHVoteModel.h"
@class LHVoteCollectionViewCell;
@protocol LHVoteCollectionViewCellDelegate <NSObject>
- (void)voteCellVoteBtnAction:(LHVoteCollectionViewCell *)cell;
@end

@interface LHVoteCollectionViewCell : UICollectionViewCell
@property (nonatomic, weak) id<LHVoteCollectionViewCellDelegate> delegate;
@property (nonatomic, assign) int cellType; //0-单行 1-双行
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) LHVoteModel *model;
@end
