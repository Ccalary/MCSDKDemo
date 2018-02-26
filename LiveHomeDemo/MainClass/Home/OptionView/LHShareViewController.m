//
//  LHShareViewController.m
//  LiveHomeDemo
//
//  Created by chh on 2017/12/21.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "LHShareViewController.h"
#import "UIColor+LHExtension.h"
#import "LHShareTableViewCell.h"
#import "LHNetRequest.h"
#import "LHRankModel.h"

@interface LHShareViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, assign) CGRect frame;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) LHTemplateTabModel *tabModel;
@property (nonatomic, strong) NSString *pid;
@property (nonatomic, assign) BOOL isLive;//是否是直播
@end

@implementation LHShareViewController

- (instancetype)initWithFrame:(CGRect)frame tabModel:(LHTemplateTabModel *)model pid:(NSString *)pid isLive:(BOOL)isLive{
    if (self = [super init]){
        self.tabModel = model;
        self.pid = pid;
        self.isLive = isLive;
        self.frame = frame;
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

- (void)initView{
    self.view.backgroundColor = [UIColor bgColorMain];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 1, self.frame.size.width, self.frame.size.height - 1) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * const cellIdentifier = @"CellIdentifier";
    LHShareTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[LHShareTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}

- (void)requestData{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:self.pid forKey:@"id"];//主id
    //直播
    if (self.isLive) {
        [params setValue:self.tabModel.bd1 forKey:@"size"];
        [LHNetRequest postLiveShareBangdanWithParams:params success:^(id response) {
            if (response[@"data"]){
                NSArray *array = [response objectForKey:@"data"];
                for (NSDictionary *dic in array){
                    LHRankModel *model = [[LHRankModel alloc] initWithDictionary:dic];
                    [self.dataArray addObject:model];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                });
            }
        } failure:^(NSError *error) {
        }];
    }else {
        [params setValue:self.tabModel.bd2 forKey:@"size"];
        [LHNetRequest postVideoShareBangdanWithParams:params success:^(id response) {
            if (response[@"data"]){
                NSArray *array = [response objectForKey:@"data"];
                for (NSDictionary *dic in array){
                    LHRankModel *model = [[LHRankModel alloc] initWithDictionary:dic];
                    [self.dataArray addObject:model];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                });
            }
        } failure:^(NSError *error) {
        }];
    }
}
@end
