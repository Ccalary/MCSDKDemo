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

#define MinHeight_InputView 50.0f

@interface LHChatRoomView()<RCTKInputBarControlDelegate>
@property (nonatomic, strong) UIView *contentView; //承载listView和InputBar
@property (nonatomic, strong) RCDLiveChatListView *chatListView;
//输入工具栏
@property (nonatomic, strong) RCDLiveInputBar *inputBar;
@property (nonatomic, strong) NSString *targetId; //聊天室id
@end
@implementation LHChatRoomView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        [self initView];
    }
    return self;
}

- (void)initView{
    self.backgroundColor = [UIColor redColor];
    
    UITapGestureRecognizer *aTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(aTapAction:)];
    [self addGestureRecognizer:aTap];
    
    CGRect contentViewFrame = CGRectMake(0, self.bounds.size.height-237, self.bounds.size.width,237);
    self.contentView.backgroundColor = [UIColor clearColor];
    self.contentView = [[UIView alloc]initWithFrame:contentViewFrame];
    [self addSubview:self.contentView];
    
    self.chatListView = [[RCDLiveChatListView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.contentView.bounds.size.height - 50) andTargetId:self.targetId];
    [self.contentView addSubview:self.chatListView];
    //输入工具栏
    self.inputBar = [[RCDLiveInputBar alloc]initWithFrame:CGRectMake(0, self.chatListView.bounds.size.height, self.contentView.frame.size.width,MinHeight_InputView)];
    self.inputBar.delegate = self;
    self.inputBar.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.inputBar];
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
    
    collectionViewRect.origin.y = self.bounds.size.height - frame.size.height - 237 + 50;
    collectionViewRect.size.height = 237;
    [UIView animateWithDuration:duration animations:^{
        [UIView setAnimationCurve:curve];
        [self.contentView setFrame:collectionViewRect];
        [UIView commitAnimations];
    }];
    
    CGRect inputbarRect = self.inputBar.frame;
    inputbarRect.origin.y = self.contentView.frame.size.height - 50;
    
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
@end
