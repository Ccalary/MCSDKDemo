//
//  LHChatRoomVC.m
//  LiveHomeDemo
//
//  Created by chh on 2017/12/21.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "LHChatRoomVC.h"
#import "LHChatRoomView.h"
@interface LHChatRoomVC ()
@property (nonatomic, strong) LHChatRoomView *chatView;
@property (nonatomic, assign) CGRect frame;
@property (nonatomic, strong) LHLiveInfoModel *liveInfoModel;
@property (nonatomic, strong) LHTemplateTabModel *tabModel;
@end

@implementation LHChatRoomVC

- (instancetype)initWithFrame:(CGRect)frame infoModel:(LHLiveInfoModel *)infoModel tabModel:(LHTemplateTabModel *)tabModel{
    if (self = [super init]){
        self.frame = frame;
        self.liveInfoModel = infoModel;
        self.tabModel = tabModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _chatView = [[LHChatRoomView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) andLHLiveInfoModel:self.liveInfoModel andTabModel:self.tabModel];
    [self.view addSubview:_chatView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
