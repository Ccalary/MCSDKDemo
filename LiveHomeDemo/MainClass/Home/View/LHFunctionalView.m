//
//  LHFunctionalView.m
//  LiveHomeDemo
//
//  Created by nie on 2017/12/5.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "LHFunctionalView.h"
#import "LHQRCodeView.h"
#import "LHToolsHelper.h"
#import "GolbalDefine.h"
@interface LHFunctionalView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) LHTemplateTabModel *tabModel;
/** 选项卡CollectionView */
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSString *qrcodeStr;//二维码地址
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation LHFunctionalView
- (instancetype)initWithFrame:(CGRect)frame dataArray:(NSArray *)dataArray qrcode:(NSString *)qrcode tabModel:(LHTemplateTabModel *)tabModel
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataArray = dataArray;
        self.tabModel = tabModel;
        self.qrcodeStr = qrcode;
        [self initCollectionView];
    }
    return self;
}

#pragma mark  设置CollectionView的的参数
- (void) initCollectionView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    //设置CollectionView的属性
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.scrollEnabled = NO;
    [self addSubview:self.collectionView];
    //注册Cell
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

#pragma mark -
#pragma mark  设置CollectionView的组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

#pragma mark  设置CollectionView每组所包含的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

#pragma mark  设置CollectionCell的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    [imageView setImage:[LHToolsHelper getImageWithName:self.dataArray[indexPath.row]]];
    imageView.frame = CGRectMake(0, 0, 30, 30);
    [cell addSubview:imageView];
    return cell;
}

#pragma mark  定义每个UICollectionView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return  CGSizeMake(45,45);
}
#pragma mark  定义整个CollectionViewCell与整个View的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);//（上、左、下、右）
}
#pragma mark  定义每个UICollectionView的横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
#pragma mark  点击CollectionView触发事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([@"公众号" isEqualToString:self.dataArray[indexPath.row]]) {
        LHQRCodeView *codeView = [[LHQRCodeView alloc]initWithFrame:[UIScreen mainScreen].bounds andModel:self.tabModel];
        [[UIApplication sharedApplication].keyWindow addSubview:codeView];
    }
    else if ([@"二维码" isEqualToString:self.dataArray[indexPath.row]])
    {
        LHQRCodeView *codeView = [[LHQRCodeView alloc] initWithFrame:[UIScreen mainScreen].bounds andQrcode:self.qrcodeStr];
        [[UIApplication sharedApplication].keyWindow addSubview:codeView];
    }else if ([@"分享" isEqualToString:self.dataArray[indexPath.row]]){
        NSNotificationCenter *notice = [NSNotificationCenter defaultCenter];
        [notice postNotificationName:Notification_Share object:nil];
    }
}
@end
