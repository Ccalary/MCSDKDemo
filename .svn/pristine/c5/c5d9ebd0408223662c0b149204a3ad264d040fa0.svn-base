//
//  LHHtmlViewController.m
//  LiveHomeDemo
//
//  Created by chh on 2017/12/21.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "LHHtmlViewController.h"
#import "UIColor+LHExtension.h"
@interface LHHtmlViewController ()<UIWebViewDelegate>
@property (nonatomic, strong) NSString *htmlStr;
@property (nonatomic, strong) UIWebView *mWebView;
@property (nonatomic, assign) CGRect frame;
@end

@implementation LHHtmlViewController
- (instancetype)initWithFrame:(CGRect)frame htmlStr:(NSString *)htmlStr{
    if (self = [super init]){
        self.frame = frame;
        self.htmlStr = htmlStr;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor bgColorMain];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (void)initView{
    _mWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _mWebView.delegate = self;
    _mWebView.scalesPageToFit = YES;
    _mWebView.backgroundColor = [UIColor bgColorMain];
    _mWebView.opaque = NO;
    [_mWebView loadHTMLString:self.htmlStr baseURL:nil];
    [self.view addSubview:_mWebView];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}
@end
