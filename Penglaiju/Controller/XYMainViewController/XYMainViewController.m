//
//  XYMainViewController.m
//  Penglaiju
//
//  Created by jeff zhou on 2018/2/8.
//  Copyright © 2018年 jeff zhou. All rights reserved.
//

#import "XYMainViewController.h"
@interface XYMainViewController ()<UIWebViewDelegate>
@property (nonatomic,strong) UIWebView     *webView;

@end

@implementation XYMainViewController
#pragma mark -- getter && setter
-(UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
        _webView.backgroundColor = [UIColor clearColor];
        _webView.scalesPageToFit = YES;
        _webView.dataDetectorTypes = UIDataDetectorTypePhoneNumber;
        _webView.delegate = self;
    }
    return _webView;
}

-(void)loadView
{
    [super loadView];
    [self.view addSubview:self.webView];
    NSURL *url = [NSURL URLWithString:@"https://www.penglaiju.com"];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showNavigationBar:NO title:nil leftButtonStyle:XYButtonStyleNone rightButtonStyle:XYButtonStyleNone];
}

#pragma mark --  UIWebViewDelegate
//开始加载
-(void)webViewDidStartLoad:(UIWebView*)webView
{
    
}

//加载完成
-(void)webViewDidFinishLoad:(UIWebView*)webView
{
    
}

//加载失败
-(void)webView:(UIWebView*)webView DidFailLoadWithError:(NSError*)error
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
