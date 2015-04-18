//
//  WebViewController.m
//  IOS_DEMO(Soldoros)
//
//  Created by scihi on 14/11/19.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () {
    
    UIWebView *_webView;
}

- (void)initializeAppearance;

@end

@implementation WebViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = NSStringFromClass([self class]);
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    self.navigationController.toolbarHidden = NO;
    [self initializeAppearance];
}

- (void)initializeAppearance
{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 初始化UIWebView
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _webView.scalesPageToFit = YES;
    [self.view addSubview:_webView];
    
    // 加载网页
    NSURL *url = [NSURL URLWithString:@"https://www.apple.com/cn"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    
    // 配置导航栏titleView
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 25)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    self.navigationItem.titleView = textField;
}

@end










