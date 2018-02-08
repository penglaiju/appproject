//
//  XYBaseNavigationBar.h
//  Penglaiju
//
//  Created by jeff zhou on 2018/2/8.
//  Copyright © 2018年 jeff zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYNavigationBar.h"

@protocol XYNavigationBarViewDelegate <NSObject>

- (void)leftButtonClick;
- (void)rightButtonClick;

@end


@interface XYBaseNavigationBar : UIView

@property (nonatomic, weak)    id <XYNavigationBarViewDelegate>delegate;
@property (nonatomic, strong)  UIButton *leftButton;
@property (nonatomic, strong)  UIButton *rightButton;
@property (nonatomic, strong)  UILabel  *titleLabel;

- (void)setNavigationBarTitle:(NSString *)title;
- (void)setNavBarTitleAlpha:(CGFloat)alpha;

#pragma mark - Navogation Bar Button Style.
- (void)setLeftButtonStyle:(XYButtonStyle)style;
- (void)setRightButtonStyle:(XYButtonStyle)style;

#pragma mark - Navogation Bar Translucent.
- (void)translucentNavigationBar:(BOOL)translucent;
- (void)setNavigationBarEffectViewAlpha:(float)alpha;

@end
