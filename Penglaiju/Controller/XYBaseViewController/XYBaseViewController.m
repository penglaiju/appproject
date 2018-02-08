//
//  XYBaseViewController.m
//  Penglaiju
//
//  Created by jeff zhou on 2018/2/8.
//  Copyright © 2018年 jeff zhou. All rights reserved.
//

#import "XYBaseViewController.h"
@interface XYBaseViewController ()

@end

@implementation XYBaseViewController

#pragma mark - View Controller Lifecycle Methods.
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadNavigationBar];

}

- (void)viewSafeAreaInsetsDidChange {
    [super viewSafeAreaInsetsDidChange];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self.view layoutIfNeeded];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}


#pragma mark - Public Methods.
- (void)showNavigationBar:(BOOL)show title:(NSString *)title leftButtonStyle:(XYButtonStyle)leftStyle rightButtonStyle:(XYButtonStyle)rightStyle {
    self.navigationBar.hidden = !show;
    [self.navigationBar setNavigationBarTitle:title];
    [self.navigationBar setLeftButtonStyle:leftStyle];
    [self.navigationBar setRightButtonStyle:rightStyle];
}

- (void)setNavigationBarTitleAlpha:(CGFloat)alpha {
    [self.navigationBar setNavBarTitleAlpha:alpha];
}

- (void)setNavigationBarAlpha:(CGFloat)alpha {
    [self.navigationBar setNavigationBarEffectViewAlpha:alpha];
    if (alpha == 0.0f) {
        self.navigationBar.backgroundColor = [UIColor clearColor];
    }
}

#pragma mark - Private Methods.
- (void)loadNavigationBar {
    [self.view addSubview:self.navigationBar];
    [self.navigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.equalTo(self.view);
        make.height.equalTo(@(kNavigationBarHeight));
    }];
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark   TSNavigationBarViewDelegate Methods.
- (void)leftButtonClick {
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)rightButtonClick {
    
}


#pragma mark - Setter & Getter.
- (XYBaseNavigationBar *)navigationBar {
    if (_navigationBar == nil) {
        _navigationBar = [[XYBaseNavigationBar alloc] initWithFrame:CGRectZero];
        _navigationBar.delegate = self;
    }
    return _navigationBar;
}

@end
