//
//  XYTools.h
//  Penglaiju
//
//  Created by jeff zhou on 2018/2/8.
//  Copyright © 2018年 jeff zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYTools : NSObject
/**
 获取当前时间。
 */
+ (NSString *)getCurrentTime;

// 验证手机号是否正确
+ (BOOL)validateMobile:(NSString *)mobile;

/**
 字符串是否有效。
 */
+ (BOOL)stringIsAvailable:(NSString *)string;

/**
 数组是否有效。
 */
+ (BOOL)arrayIsAvailable:(NSArray *)array;

/**
 字典是否有效。
 */
+ (BOOL)dictionaryIsAvailable:(NSDictionary *)dictionary;

/**
 获取当前控制器
 */
+ (UIViewController *)currentController;

@end
