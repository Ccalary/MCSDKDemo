//
//  LHVoteViewController.m
//  LiveHomeDemo
//
//  Created by chh on 2017/12/22.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "LHVoteViewController.h"
#import "GolbalDefine.h"
#import "LHVoteCollectionViewCell.h"
#import "LHNetRequest.h"
#import "LHUserHelper.h"
#import "LHVoteModel.h"

@interface LHVoteViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate, UICollectionViewDataSource, LHVoteCollectionViewCellDelegate>
@property (nonatomic, strong) UICollectionView *mCollectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) CGRect frame;
@property (nonatomic, assign) LHVoteViewCellType type;
@property (nonatomic, strong) NSString *voteId; //投票id
@property (nonatomic, strong) UILabel *nameLabel;
@end

@implementation LHVoteViewController

- (instancetype)initWithFrame:(CGRect)frame type:(LHVoteViewCellType)type voteId:(NSString *)voteId{
    if (self = [super init]){
        self.frame = frame;
        self.voteId = voteId;
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = [[NSMutableArray alloc] init];
    [self initView];
    [self requestData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initHeaderView{
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 52)];
    bgImageView.image = [LHToolsHelper getImageWithName:@"lh_vote_bg_375x52"];
    [self.view addSubview:bgImageView];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, bgImageView.frame.size.width, 52)];
    _nameLabel.textColor = [UIColor whiteColor];
    _nameLabel.font = LH_Font_System(15);
    _nameLabel.text = @"活动名称";
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    [bgImageView addSubview:_nameLabel];
}

- (void)initView{
    self.view.backgroundColor = [UIColor bgColorMain];
    [self initHeaderView];
    
    CGRect collectionFrame;
    UICollectionViewFlowLayout * aLayOut = [[UICollectionViewFlowLayout alloc]init];
    aLayOut.scrollDirection = UICollectionViewScrollDirectionVertical;
    switch (self.type) {
        case LHVoteViewCellTypeSingle:
        {
            CGFloat itemWidth = LH_ScreenWidth;
            CGFloat itemHeight = 130;
            aLayOut.itemSize = CGSizeMake(itemWidth, itemHeight);
            aLayOut.minimumLineSpacing = 0;
            collectionFrame = CGRectMake(0, 52, LH_ScreenWidth, self.frame.size.height - 52);
        }
            break;
        case LHVoteViewCellTypeDouble:
        {
            CGFloat itemWidth = (LH_ScreenWidth - 15)/2.0;
            CGFloat itemHeight = 210;
            aLayOut.itemSize = CGSizeMake(itemWidth, itemHeight);
            aLayOut.minimumLineSpacing = 0;
            aLayOut.minimumInteritemSpacing = 4;
            collectionFrame = CGRectMake(5, 52, LH_ScreenWidth - 10, self.frame.size.height - 52);
        }
            break;
        default:
            break;
    }
    
    _mCollectionView = [[UICollectionView alloc]initWithFrame:collectionFrame collectionViewLayout:aLayOut];
    [_mCollectionView registerClass:[LHVoteCollectionViewCell class] forCellWithReuseIdentifier:@"CellIdentifier"];
    _mCollectionView.delegate = self;
    _mCollectionView.dataSource = self;
    _mCollectionView.backgroundColor = [UIColor bgColorMain];
    [self.view addSubview:_mCollectionView];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

//cell的记载
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LHVoteCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    cell.cellType = self.type;
    cell.indexPath = indexPath;
    cell.model = self.dataArray[indexPath.row];
    cell.delegate = self;
    return cell;
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark - CellDelegate
- (void)voteCellVoteBtnAction:(LHVoteCollectionViewCell *)cell{
    if (cell.indexPath.row < self.dataArray.count){
        LHVoteModel *model = self.dataArray[cell.indexPath.row];
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params setValue:model.pid forKey:@"id"];
        [LHNetRequest postVoteVoteWithParams:params success:^(id response) {
            dispatch_async(dispatch_get_main_queue(), ^{
                model.vote = YES;
                [self.mCollectionView reloadItemsAtIndexPaths:@[cell.indexPath]];
            });
        } failure:^(NSError *error) {
            
        }];
    }
}

//加载数据
- (void)requestData{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:self.voteId forKey:@"id"];
    [LHNetRequest postVoteInfoWithParams:params success:^(id response) {
        if (response[@"data"]){
            NSDictionary *dictionary = [response objectForKey:@"data"];
            NSArray *array = [dictionary objectForKey:@"results"];
            [self.dataArray removeAllObjects];
            for (NSDictionary *dic in array){
                LHVoteModel *model = [[LHVoteModel alloc] initWithDictionary:dic];
                [self.dataArray addObject:model];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                self.nameLabel.text = dictionary[@"title"];
                [self.mCollectionView reloadData];
            });
        }
    } failure:^(NSError *error) {
       
    }];
}

@end
