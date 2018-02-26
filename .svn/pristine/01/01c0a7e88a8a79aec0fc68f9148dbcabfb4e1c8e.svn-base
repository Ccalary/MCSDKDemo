//
//  LHOptionView.m
//  LiveHomeDemo
//
//  Created by 谢炳 on 2017/12/1.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "LHOptionView.h"
#import "LHOptionCollectionViewCell.h"
#import "LHListScrollView.h"
#import "GolbalDefine.h"
#import "UIView+LHExtension.h"
#define MAX_NUM  4            //最多展示选项卡个数
#define OPTION_HEIGHT  40.0f //选项卡高度

@interface LHOptionView ()
<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>
{
    CGFloat itemWidth; //宽度
}
/** 选项卡CollectionView */
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) LHListScrollView *scrollView;
@property (nonatomic, strong) UIView *indicatorView; //指示器
@property (nonatomic, strong) NSArray *titlesArray;  //顶部title
@property (nonatomic, strong) NSMutableArray *viewArray; //底部View
@property (nonatomic, assign) NSInteger selectIndex; //选中的index
@property (nonatomic, assign) BOOL isCollectionClick; //是否是点击选择
@property (nonatomic, assign) BOOL isShowLogo; //是否展示logo
@property (nonatomic, assign) CGFloat logoWidth; //logo说占用的宽度，没有是0，有的话是75
@property (nonatomic, weak) UIViewController *parentVC;//父类VC
@property (nonatomic, strong) NSMutableDictionary *mPageDic; //保存添加过的界面
@property (nonatomic,assign) CGRect originalFrame;
@end

@implementation LHOptionView

- (instancetype)initWithFrame:(CGRect)frame parentVC:(UIViewController *)vc titleArray:(NSArray <NSString *>*)titleArray viewArray:(NSArray <UIViewController *>*)viewArray showLogoView:(BOOL) isShowLogo
{
    self =  [super initWithFrame:frame];
    if (self) {
        self.parentVC = vc;
        self.isShowLogo = isShowLogo;
        self.logoWidth = (self.isShowLogo) ? 75 : 0;
        self.titlesArray = titleArray;
        self.mPageDic = [NSMutableDictionary dictionary];
        self.viewArray = [NSMutableArray arrayWithArray:viewArray];
        //为空的话则不加载view
        if (self.titlesArray.count == 0 || self.viewArray.count == 0) return self;
        [self initView];
    }
    return self;
}

- (void)initView
{
    int optionCount = (int)self.titlesArray.count;
    //如果标题标签少于4个则按比例铺满，如果大于4个则滑动展示,大小为4个时的大小
    if (optionCount <= MAX_NUM){
       itemWidth = ((float)self.frame.size.width - self.logoWidth)/optionCount;
    }else{
       itemWidth = (self.frame.size.width - self.logoWidth)/MAX_NUM;
    }
    CGFloat itemHeight = OPTION_HEIGHT;
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(itemWidth, itemHeight);
    flowLayout.minimumLineSpacing = 0;
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    //设置CollectionView的属性
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(self.logoWidth, 0, self.frame.size.width - self.logoWidth, OPTION_HEIGHT) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.scrollEnabled = (optionCount > MAX_NUM) ? YES : NO; //多于4个可滑动
    //注册Cell
    [self.collectionView registerClass:[LHOptionCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self addSubview:self.collectionView];
   
    //指示器
    _indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, itemHeight - 2, itemWidth, 2)];
    _indicatorView.backgroundColor = [UIColor themeColor];
    [self.collectionView addSubview:_indicatorView];
    
    //scrollView
    _scrollView = [[LHListScrollView alloc] initWithFrame:CGRectMake(0, OPTION_HEIGHT, self.frame.size.width, self.frame.size.height - OPTION_HEIGHT)];
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    
    /*
     * 对View和Title的个数进行处理，以title的个数为准，如果view的个数少的话则补充空View，多的话按顺序加载
     */
    int viewCount = (int)self.viewArray.count;
    if (viewCount < optionCount){
        int count = optionCount - viewCount;
        for (int i = 0; i < count; i++){
            UIViewController *vc = [[UIViewController alloc] init];
            vc.view.backgroundColor = [UIColor whiteColor];
            [_viewArray addObject:vc];
        }
    }
    _scrollView.contentSize = CGSizeMake(self.frame.size.width*(int)self.viewArray.count, self.frame.size.height - OPTION_HEIGHT);
    [self addSubview:_scrollView];
    UIViewController *firstVC = self.viewArray.firstObject;
    if (firstVC){
        firstVC.view.frame = CGRectMake(0, 0,self.frame.size.width , self.frame.size.height - OPTION_HEIGHT);
        [self.parentVC addChildViewController:firstVC];
        [self.scrollView addSubview:firstVC.view];
    }
    [self.mPageDic setObject:firstVC.view forKey:@(0)];
    
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
    return self.titlesArray.count;
}

#pragma mark  设置CollectionCell的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    LHOptionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.titleLabel.text = self.titlesArray[indexPath.row];
    //选中的变色
    cell.titleLabel.textColor = (self.selectIndex == indexPath.row) ? [UIColor themeColor] : [UIColor fontColorDarkGray];
    return cell;
}

#pragma mark  定义整个CollectionViewCell与整个View的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark  点击CollectionView触发事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.isCollectionClick = YES;
    
    //左、右边盖住的item的index
    int leftIndex = (int)collectionView.contentOffset.x/itemWidth;
    int rightIndex = (int)((collectionView.contentOffset.x + self.frame.size.width)/itemWidth);
    //将盖住的item全部显示出来
    if (indexPath.row == leftIndex){
        [collectionView setContentOffset:CGPointMake(itemWidth*leftIndex, 0) animated:YES];
    }else if (indexPath.row == rightIndex){
        [collectionView setContentOffset:CGPointMake(itemWidth*(rightIndex-MAX_NUM+1), 0) animated:YES];
    }
    //计算时间（一个长度0.1s）
    CGFloat duration = (labs(indexPath.row - self.selectIndex))*0.1;
    self.selectIndex = indexPath.row;
    [UIView animateWithDuration:duration animations:^{
        self.indicatorView.x = self.selectIndex*itemWidth;
    }];
    //scrollView跟随选项卡滚动
    [self.scrollView setContentOffset:CGPointMake((self.selectIndex)*self.frame.size.width, 0) animated:YES];
    [collectionView reloadData];
    if ([_mPageDic.allKeys containsObject:@(self.selectIndex)]) return;
    [self addVCWithIndex:(int)self.selectIndex];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    self.isCollectionClick = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //如果是collectionView滑动和点击则不处理
    if ([scrollView isKindOfClass:[UICollectionView class]] || self.isCollectionClick) return;
    //如果多于4个按4个的大小展示，否则按本身个数展示
    int optionCount = ((int)self.titlesArray.count >= MAX_NUM) ? MAX_NUM : ((int)self.titlesArray.count);
    
    double rate = (self.frame.size.width - self.logoWidth)/(optionCount*self.frame.size.width);
    _indicatorView.x = scrollView.contentOffset.x*rate;
    double offsetRate = scrollView.contentOffset.x/self.frame.size.width;
    int index = (int)offsetRate;
    if (index == offsetRate){
        self.selectIndex = index;
        //滚动collection让它一直能显示出来
        NSIndexPath *position = [NSIndexPath indexPathForRow:index inSection:0];
        [self.collectionView scrollToItemAtIndexPath:position atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
        [self.collectionView reloadData];
        
        if ([_mPageDic.allKeys containsObject:@(self.selectIndex)]) return;
        [self addVCWithIndex:(int)self.selectIndex];
    }
}

//添加VC
- (void)addVCWithIndex:(int)index{
    UIViewController *vc = self.viewArray[index];
    [self.parentVC addChildViewController:vc];
    vc.view.frame = CGRectMake(index*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height - OPTION_HEIGHT);
    [self.scrollView addSubview:vc.view];
    if (vc){
        [_mPageDic setObject:vc forKey:@(index)];
    }
}

@end
