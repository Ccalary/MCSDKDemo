//
//  LHChatRoomView.m
//  LiveHomeDemo
//
//  Created by chh on 2017/12/4.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "LHChatRoomView.h"
#import "RCDLiveChatListView.h"
#import "RCDLiveInputBar.h"
#import "GolbalDefine.h"
#import "LHFunctionalView.h"

#define MinHeight_InputView 50.0f

@interface LHChatRoomView()<RCTKInputBarControlDelegate>
@property (nonatomic, strong) UIView *contentView; //承载listView和InputBar
@property (nonatomic, strong) RCDLiveChatListView *chatListView;
//输入工具栏
@property (nonatomic, strong) RCDLiveInputBar *inputBar;

@property (nonatomic, strong) LHFunctionalView *functionalView;
@property (nonatomic, strong) LHLiveInfoModel *liveInfoModel;
@property (nonatomic, strong) LHTemplateTabModel *tabModel;
@end
@implementation LHChatRoomView

- (instancetype)initWithFrame:(CGRect)frame andLHLiveInfoModel:(LHLiveInfoModel *)liveInfoModel andTabModel:(LHTemplateTabModel *)tabModel{
    if (self = [super initWithFrame:frame]){
        self.liveInfoModel = liveInfoModel;
        self.tabModel = tabModel;
        [self initView];
    }
    return self;
}

- (void)initView{
    self.backgroundColor = [UIColor bgColorMain];

    CGRect contentViewFrame = CGRectMake(0, 0, self.bounds.size.width,self.bounds.size.height);
    self.contentView.backgroundColor = [UIColor bgColorMain];
    self.contentView = [[UIView alloc]initWithFrame:contentViewFrame];
    [self addSubview:self.contentView];
    
    self.chatListView = [[RCDLiveChatListView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.contentView.bounds.size.height - MinHeight_InputView) andTargetId:self.liveInfoModel.roomid];
    self.chatListView.backgroundColor = [UIColor bgColorMain];
    [self.contentView addSubview:self.chatListView];
    //输入工具栏
    self.inputBar = [[RCDLiveInputBar alloc]initWithFrame:CGRectMake(0, self.chatListView.bounds.size.height, self.contentView.frame.size.width,MinHeight_InputView) andIsEmojiShow:self.tabModel.emoji];
    self.inputBar.delegate = self;
    self.inputBar.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.inputBar];
    
    UITapGestureRecognizer *aTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(aTapAction:)];
    [self.chatListView addGestureRecognizer:aTap];
    
    //控制二维码的显示和隐藏
    NSMutableArray *imageArray = [NSMutableArray array];
    if (self.tabModel.appshowpublic){//客户二维码的显隐
        [imageArray addObject:@"公众号"];//图片名字
    }
    if (self.tabModel.appshowurl){//当前页面的二维码
        [imageArray addObject:@"二维码"];
    }
    [imageArray addObject:@"分享"];
    _functionalView = [[LHFunctionalView alloc] initWithFrame:CGRectMake(self.frame.size.width - 50, 20, 40, self.frame.size.height - 80) dataArray:imageArray qrcode:self.liveInfoModel.qrcode tabModel:self.tabModel];
    [self.contentView addSubview:_functionalView];
}
#pragma mark - 输入框代理事件
- (void)onTouchSendButton:(NSString *)text{
    RCTextMessage *rcTextMessage = [RCTextMessage messageWithContent:text];
    [self.chatListView sendTextMessage:rcTextMessage pushContent:nil];
    //清空输入框
    [self.inputBar clearInputView];
    [self.inputBar setInputBarStatus:RCDLiveBottomBarDefaultStatus];
}

- (void)onInputBarControlContentSizeChanged:(CGRect)frame withAnimationDuration:(CGFloat)duration andAnimationCurve:(UIViewAnimationCurve)curve{
    
    CGRect collectionViewRect = self.contentView.frame;
    
    collectionViewRect.origin.y = - frame.size.height  + MinHeight_InputView;
    collectionViewRect.size.height = self.bounds.size.height;
    [UIView animateWithDuration:duration animations:^{
        [UIView setAnimationCurve:curve];
        [self.contentView setFrame:collectionViewRect];
        [UIView commitAnimations];
    }];
    
    CGRect inputbarRect = self.inputBar.frame;
    inputbarRect.origin.y = self.contentView.frame.size.height - MinHeight_InputView;
    
    [self.inputBar setFrame:inputbarRect];
    [self bringSubviewToFront:self.inputBar];
    [self.chatListView scrollToBottomAnimated:NO];
}

#pragma mark - Action
//点击键盘消失
- (void)aTapAction:(UIGestureRecognizer *)gestureRecognizer{
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        [self.inputBar setInputBarStatus:RCDLiveBottomBarDefaultStatus];
    }
}

//按钮超出点击区域后点击无效的处理
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil) {
        CGPoint tempoint = [self.inputBar.chatSessionInputBarControl.emojiButton convertPoint:point fromView:self];
        if (CGRectContainsPoint(self.inputBar.chatSessionInputBarControl.emojiButton.bounds, tempoint)){
            view = self.inputBar.chatSessionInputBarControl.emojiButton;
        }
    }
    return view;

}
@end
