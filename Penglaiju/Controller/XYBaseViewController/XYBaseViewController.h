//
//  XYBaseViewController.h
//  Penglaiju
//
//  Created by jeff zhou on 2018/2/8.
//  Copyright © 2018年 jeff zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYBaseNavigationBar.h"

@interface XYBaseViewController : UIViewController <XYNavigationBarViewDelegate>

@property (nonatomic, strong) XYBaseNavigationBar *navigationBar;

- (void)showNavigationBar:(BOOL)show title:(NSString *)title leftButtonStyle:(XYButtonStyle)leftStyle rightButtonStyle:(XYButtonStyle)rightStyle;
- (void)setNavigationBarAlpha:(CGFloat)alpha;
- (void)setNavigationBarTitleAlpha:(CGFloat)alpha;

@end
