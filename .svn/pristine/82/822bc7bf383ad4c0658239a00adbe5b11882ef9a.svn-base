//
//  LHSignPopView.m
//  LiveHomeDemo
//
//  Created by chh on 2017/12/29.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "LHSignPopView.h"
#import "UIColor+LHExtension.h"
#import "LHMessageHUD.h"
#import "LHNetRequest.h"

@interface LHSignPopView()
@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *phoneTextField;
@property (nonatomic, assign) BOOL needShowInfo;
@end
@implementation LHSignPopView
- (instancetype)initWithFrame:(CGRect)frame needShowInfo:(BOOL)needShow{
    if (self = [super initWithFrame:frame]){
        self.needShowInfo = needShow; //是否要展示用户名和密码输入框
        [self initView];
    }
    return self;
}

- (void)initView{
    self.backgroundColor = [UIColor whiteColor];
    
    CGFloat viewWidth = self.frame.size.width;
    CGFloat viewHeight = self.frame.size.height;
    
    if (self.needShowInfo){
        UIView *nameView = [[UIView alloc] initWithFrame:CGRectMake(25, 25, viewWidth - 50, 40)];
        nameView.backgroundColor = [UIColor bgColorLine];
        [self addSubview:nameView];
        
        _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, 0, viewWidth - 60, 40)];
        _nameTextField.placeholder = @"请填写真实姓名";
        _nameTextField.font = [UIFont systemFontOfSize:15];
        [_nameTextField addTarget:self action:@selector(nameTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        [nameView addSubview:_nameTextField];
        
        UIView *phoneView = [[UIView alloc] initWithFrame:CGRectMake(25, CGRectGetMaxY(nameView.frame) + 15, viewWidth - 50, 40)];
        phoneView.backgroundColor = [UIColor bgColorLine];
        [self addSubview:phoneView];
        
        _phoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, 0, viewWidth - 60, 40)];
        _phoneTextField.placeholder = @"请填写常用手机号";
        _phoneTextField.font = [UIFont systemFontOfSize:15];
        _phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
        [_phoneTextField addTarget:self action:@selector(phoneTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        [phoneView addSubview:_phoneTextField];
    }
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(25, viewHeight - 55, viewWidth - 50, 35)];
    [button setTitle:@"签到" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor themeColor]];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    button.layer.cornerRadius = 4.0;
    [button addTarget:self action:@selector(signAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}

- (void)nameTextFieldDidChange:(UITextField *)textField{
    
}

- (void)phoneTextFieldDidChange:(UITextField *)textField{
    //限制4位
    if (textField.text.length > 11){
        textField.text = [textField.text substringToIndex:11];
    }
}

- (void)signAction{
    if (self.needShowInfo && self.needUserInfo){
        if (self.nameTextField.text.length <= 1){
            [LHMessageHUD showMessage:@"请输入真实姓名"];
            return;
        }
        if (self.phoneTextField.text.length != 11){
            [LHMessageHUD showMessage:@"请输入11位手机号码"];
            return;
        }
    }
    if (self.block){
        self.block();
    }
    
    [self requestData];
}

//签到
- (void)requestData{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:self.roomId forKey:@"id"];
    if (self.needShowInfo && self.needUserInfo){
        [params setValue:self.nameTextField.text forKey:@"name"];
        [params setValue:self.phoneTextField.text forKey:@"mobile"];
    }
   
    [LHNetRequest postLiveSignWithParams:params success:^(id response) {
        
    } failure:^(NSError *error) {
        
    }];
    
}
@end
