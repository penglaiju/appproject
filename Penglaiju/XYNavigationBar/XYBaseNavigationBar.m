//
//  XYBaseNavigationBar.m
//  Penglaiju
//
//  Created by jeff zhou on 2018/2/8.
//  Copyright © 2018年 jeff zhou. All rights reserved.
//


#import "XYBaseNavigationBar.h"

static NSInteger const kNavigationBarButtonFontSize   = 15.0f;
static NSInteger const kNavigationBarTitleFontSize    = 20.0f;
static NSInteger const kNavigationBarButtonSideLength = 44.0f;


@interface XYBaseNavigationBar()
@property (nonatomic, strong) UIVisualEffectView *effectView;
@end


@implementation XYBaseNavigationBar

#pragma mark - Initialization Method.
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configSubview];
    }
    return self;
}

- (void)safeAreaInsetsDidChange {
    [super safeAreaInsetsDidChange];
    if (@available(iOS 11.0, *)) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(self.safeAreaInsets.top + kNavigationBarHeight));
        }];
    }
}


#pragma mark - Public Methods.
- (void)setNavigationBarTitle:(NSString *)title {
    if ([XYTools stringIsAvailable:title]) {
        self.titleLabel.text = title;
    }
}

- (void)setNavBarTitleAlpha:(CGFloat)alpha {
    if (alpha >= 0.0f && alpha <= 1.0f) {
        self.titleLabel.alpha = alpha;
    }
}

#pragma mark   Navogation Bar Button Style.
- (void)setLeftButtonStyle:(XYButtonStyle)style {
    [self setUIButtonStyle:style withUIButton:self.leftButton];
}

- (void)setRightButtonStyle:(XYButtonStyle)style {
    [self setUIButtonStyle:style withUIButton:self.rightButton];
}

#pragma mark   Navogation Bar Translucent.
- (void)translucentNavigationBar:(BOOL)translucent {
    if (translucent) {
        UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        self.effectView = [[UIVisualEffectView alloc] initWithEffect:blur];
        self.effectView.frame = CGRectMake(0, 0, kScreenWidth, 64.0f);
        self.effectView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.effectView];
        [self sendSubviewToBack:self.effectView];
    }
}

- (void)setNavigationBarEffectViewAlpha:(float)alpha {
    if (alpha >= 0.0 && alpha <= 1.0 && self.effectView != nil && self.effectView.alpha != alpha) {
        self.effectView.alpha = alpha;
        self.titleLabel.alpha = alpha;
    }
}


#pragma mark - TSNavigationBarViewDelegate Methods.
- (void)leftButtonClick:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(leftButtonClick)]) {
        [self.delegate leftButtonClick];
    }
}

- (void)rightButtonClick:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(rightButtonClick)]) {
        [self.delegate rightButtonClick];
    }
}


#pragma mark - Private Methods.
- (void)setUIButtonStyle:(XYButtonStyle)style withUIButton:(UIButton *)button {
    button.hidden = NO;
    
    switch (style) {
            
        case XYButtonStyleBack: {
            [button setImage:[UIImage imageNamed:@"back_icon"] forState:UIControlStateNormal];
        }
            break;
            
        case XYButtonStyleSetting: {
            [button setImage:[UIImage imageNamed:@"setting_icon"] forState:UIControlStateNormal];
        }
            break;

        case XYButtonStyleNone:
            button.hidden = YES;
            break;
            
        case XYButtonStyleRightButtonSave: {
            [button setTitle:@"保存"forState:UIControlStateNormal];
            [button setTitleColor: XY_RGB(231.0f, 56.0f, 56.0f) forState:UIControlStateNormal];
            button.contentEdgeInsets = UIEdgeInsetsZero;
        }
            break;
            
        case XYButtonStyleRightButtonDone: {
            [button setTitle:@"完成" forState:UIControlStateNormal];
            [button.titleLabel setFont:[UIFont systemFontOfSize:kNavigationBarButtonFontSize]];
            button.contentEdgeInsets = UIEdgeInsetsZero;
        }
            break;
            
        case XYButtonStyleRightButtonConfirm: {
            [button setTitle:@"确定" forState:UIControlStateNormal];
            [button setTitleColor:XY_RGB(231.0f, 56.0f, 56.0f) forState:UIControlStateNormal];
            button.contentEdgeInsets = UIEdgeInsetsZero;
        }
            break;
            
        case XYButtonStyleOnlyCancelWord: {
            [button setTitle:@"取消"forState:UIControlStateNormal];
            button.contentEdgeInsets = UIEdgeInsetsMake(10, 9, 10, 11);
        }
            break;
            
        case XYButtonStyleNextStep: {
            _rightButton.titleLabel.font   = [UIFont systemFontOfSize:kNavigationBarButtonFontSize];
            _rightButton.contentEdgeInsets = UIEdgeInsetsZero;
            [_rightButton setTitle:@"下一步"forState:UIControlStateNormal];
        }
            break;
            
        case XYButtonStyleClose: {
            UIImage *buttonImage = [UIImage imageNamed:@"close_icon"];
            [button setImage:buttonImage forState:UIControlStateNormal];
        }
            break;
            
        default:
            break;
    }
}

- (void)configSubview {
    
    self.backgroundColor = [UIColor whiteColor];
    // Left Button.
    [self addSubview:self.leftButton];
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.bottom.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(kNavigationBarButtonSideLength, kNavigationBarButtonSideLength));
    }];
    
    // Right Button.
    [self addSubview:self.rightButton];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.bottom.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(kNavigationBarButtonSideLength + 20.0f, kNavigationBarButtonSideLength));
    }];
    
    // Title.
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.left.equalTo(@50);
        make.centerY.equalTo(self.leftButton);
    }];
}

#pragma mark - Setter & Getter.
- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.font = [UIFont boldSystemFontOfSize:kNavigationBarTitleFontSize];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UIButton *)leftButton {
    if (_leftButton == nil) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.titleLabel.font = [UIFont systemFontOfSize:kNavigationBarButtonFontSize];
        [_leftButton setImage:[UIImage imageNamed:@"back_icon"] forState:UIControlStateNormal];
        [_leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_leftButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [_leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftButton;
}

- (UIButton *)rightButton {
    if (_rightButton == nil) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:kNavigationBarButtonFontSize];
        [_rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_rightButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [_rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}

@end
