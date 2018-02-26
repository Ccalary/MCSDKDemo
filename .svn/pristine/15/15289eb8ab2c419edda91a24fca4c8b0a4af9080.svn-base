//
//  LHSecretViewController.m
//  LiveHomeDemo
//
//  Created by chh on 2017/12/29.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "LHSecretViewController.h"
#import "GolbalDefine.h"
#import "LHNetRequest.h"
#import "LHMessageHUD.h"

@interface LHSecretViewController ()
@property (nonatomic, strong) UIImageView *imageView1, *imageView2, *imageView3, *imageView4;
@property (nonatomic, strong) UILabel *label1, *label2, *label3, *label4;
@property (nonatomic, strong) NSMutableString *resultStr;
@end

@implementation LHSecretViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _resultStr = [[NSMutableString alloc] init];
    [self initNavView];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)initNavView{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((LH_ScreenWidth - 150)/2.0, LH_StatusBarHeight, 150, 44)];
    titleLabel.font = [UIFont boldSystemFontOfSize:18];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = @"输入密码";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    
    UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, LH_StatusBarHeight, 60, 44)];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancelBtn setBackgroundColor:[UIColor clearColor]];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [cancelBtn addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelBtn];
}

- (void)initView{
    self.view.backgroundColor = [UIColor colorWithHex:0x283034];

    UILabel *tipsLabel = [[UILabel alloc] initWithFrame:CGRectMake( 0, LH_TopFullHeight + 20, LH_ScreenWidth, 60)];
    tipsLabel.font = [UIFont systemFontOfSize:18];
    tipsLabel.numberOfLines = 2;
    tipsLabel.textColor = [UIColor fontColorLightGray];
    [self.view addSubview:tipsLabel];
    
    NSString *textString = @"直播画面已被主播锁定\n输入密码后可解锁画面";
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:textString];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:8]; //调整行间距
    [attributeStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [attributeStr length])];
    tipsLabel.attributedText = attributeStr;
    tipsLabel.textAlignment = NSTextAlignmentCenter;
    
    CGFloat viewWidth = 30;
    CGFloat gap = 15;
    
    UIView *holdView = [[UIView alloc] initWithFrame:CGRectMake((LH_ScreenWidth - 175)/2.0, CGRectGetMaxY(tipsLabel.frame) + 30, 175, viewWidth)];
    holdView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:holdView];
    
    _imageView1 = [self createImageViewWithFrame:CGRectMake(5, 0, viewWidth, viewWidth)];
    [holdView addSubview:_imageView1];
    _imageView2 = [self createImageViewWithFrame:CGRectMake(CGRectGetMaxX(_imageView1.frame) + gap, 0, viewWidth, viewWidth)];
    [holdView addSubview:_imageView2];
    _imageView3 = [self createImageViewWithFrame:CGRectMake(CGRectGetMaxX(_imageView2.frame) + gap, 0, viewWidth, viewWidth)];
    [holdView addSubview:_imageView3];
    _imageView4 = [self createImageViewWithFrame:CGRectMake(CGRectGetMaxX(_imageView3.frame) + gap, 0, viewWidth, viewWidth)];
    [holdView addSubview:_imageView4];
    
    _label1 = [self createLabelWithFrame:_imageView1.frame];
    [holdView addSubview:_label1];
    
    _label2 = [self createLabelWithFrame:_imageView2.frame];
    [holdView addSubview:_label2];
    
    _label3 = [self createLabelWithFrame:_imageView3.frame];
    [holdView addSubview:_label3];
    
    _label4 = [self createLabelWithFrame:_imageView4.frame];
    [holdView addSubview:_label4];
    
    CGFloat btnWidth = LH_ScreenWidth/3.0;
    CGFloat btnHeight = 60;
    UIView *boardHoldView = [[UIView alloc] initWithFrame:CGRectMake(0, LH_ScreenHeight - btnHeight*4, LH_ScreenWidth,btnHeight*4)];
    [self.view addSubview:boardHoldView];

    for (int i = 0; i < 12; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((i%3)*btnWidth, (i/3)*btnHeight, btnWidth, btnHeight)];
        button.tag = 1000+i;
        [button setTitleColor:[UIColor fontColorLightGray] forState:UIControlStateNormal];
        [button setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:30];
        [button setImage:nil forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [boardHoldView addSubview:button];
        
        switch (i) {
            case 9:
                 [button setTitle:@"" forState:UIControlStateNormal];
                break;
            case 10:
                 [button setTitle:@"0" forState:UIControlStateNormal];
                break;
            case 11:
                [button setTitle:@"" forState:UIControlStateNormal];
                [button setImage:[LHToolsHelper getImageWithName:@"lh_delete_25x15"] forState:UIControlStateNormal];
                break;
            default:
                break;
        }
        
    }
}

- (UIImageView *)createImageViewWithFrame:(CGRect)frame{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = [LHToolsHelper getImageWithName:@"lh_pwd_30"];
    return imageView;
}

- (UILabel *)createLabelWithFrame:(CGRect)frame{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textColor = [UIColor greenColor];
    label.font = [UIFont boldSystemFontOfSize:30];
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

//取消
- (void)cancelAction{
    [self dismissViewControllerAnimated:YES completion:nil];
    if (self.cancelBlock){
        self.cancelBlock();
    }
}

- (void)buttonAction:(UIButton *)button{
    
    if (button.tag == 1011){//删除
        if (_resultStr.length > 0){
            NSRange deleteRange = NSMakeRange(_resultStr.length - 1, 1);
            [_resultStr deleteCharactersInRange:deleteRange];
        }
    }
    
    if (button.currentTitle.length > 0){
        [_resultStr appendString:button.currentTitle];
    }
    if (_resultStr.length > 4){
        NSRange deleteRange = NSMakeRange(_resultStr.length - 1, 1);
        [_resultStr deleteCharactersInRange:deleteRange];
    }
    switch (_resultStr.length) {
        case 0:
            _label1.text = @"";
            _label2.text = @"";
            _label3.text = @"";
            _label4.text = @"";
            _imageView1.hidden = NO;
            _imageView2.hidden = NO;
            _imageView3.hidden = NO;
            _imageView4.hidden = NO;
            break;
        case 1:
            _label1.text = [_resultStr substringWithRange:NSMakeRange(0, 1)];
            _label2.text = @"";
            _label3.text = @"";
            _label4.text = @"";
            _imageView1.hidden = YES;
            _imageView2.hidden = NO;
            _imageView3.hidden = NO;
            _imageView4.hidden = NO;
            break;
        case 2:
            _label1.text = [_resultStr substringWithRange:NSMakeRange(0, 1)];
            _label2.text = [_resultStr substringWithRange:NSMakeRange(1, 1)];
            _label3.text = @"";
            _label4.text = @"";
            _imageView1.hidden = YES;
            _imageView2.hidden = YES;
            _imageView3.hidden = NO;
            _imageView4.hidden = NO;
            break;
        case 3:
            _label1.text = [_resultStr substringWithRange:NSMakeRange(0, 1)];
            _label2.text = [_resultStr substringWithRange:NSMakeRange(1, 1)];
            _label3.text = [_resultStr substringWithRange:NSMakeRange(2, 1)];
            _label4.text = @"";
            _imageView1.hidden = YES;
            _imageView2.hidden = YES;
            _imageView3.hidden = YES;
            _imageView4.hidden = NO;
            break;
        case 4:
            _label1.text = [_resultStr substringWithRange:NSMakeRange(0, 1)];
            _label2.text = [_resultStr substringWithRange:NSMakeRange(1, 1)];
            _label3.text = [_resultStr substringWithRange:NSMakeRange(2, 1)];
            _label4.text = [_resultStr substringWithRange:NSMakeRange(3, 1)];
            _imageView1.hidden = YES;
            _imageView2.hidden = YES;
            _imageView3.hidden = YES;
            _imageView4.hidden = YES;
            break;
        default:
            break;
    }
    
    if (_resultStr.length == 4){
        [LHMessageHUD showMessage:@"请求中..."];

        [self requsetCheckPwd];
    }
}

//检查密码
- (void)requsetCheckPwd{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:self.roomId forKey:@"id"];//直播房间号
    [params setValue:[self.resultStr copy] forKey:@"pwd"];//密码
    [LHNetRequest postLiveCheckRoomPwdWithParams:params success:^(id response) {
        [self dismissViewControllerAnimated:YES completion:nil];
        dispatch_async(dispatch_get_main_queue(), ^{           
            if (self.successBlock){
                self.successBlock();
            }
        });
        
    } failure:^(NSError *error) {
        
    }];
}
@end
