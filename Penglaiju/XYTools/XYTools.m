//
//  XYTools.m
//  Penglaiju
//
//  Created by jeff zhou on 2018/2/8.
//  Copyright © 2018年 jeff zhou. All rights reserved.
//

#import "XYTools.h"

@implementation XYTools
/**
 获取当前时间。
 */
+ (NSString *)getCurrentTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMdd"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    return dateTime;
}

// 验证手机号是否正确
+ (BOOL)validateMobile:(NSString *)mobile
{
      return [[NSPredicate predicateWithFormat:@"SELF MATCHES '1\\\\d{10}'"] evaluateWithObject:mobile];
}

/**
 字符串是否有效。
 */
+ (BOOL)stringIsAvailable:(NSString *)string
{
    if(string && [string isKindOfClass:[NSString class]] && [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length > 0){
        return YES;
    }
    return NO;
}

/**
 数组是否有效。
 */
+ (BOOL)arrayIsAvailable:(NSArray *)array
{
    if(array && [array isKindOfClass:[NSArray class]] && [array count] > 0){
        return YES;
    }
    return NO;

}

/**
 字典是否有效。
 */
+ (BOOL)dictionaryIsAvailable:(NSDictionary *)dictionary
{
    if(dictionary && [dictionary isKindOfClass:[NSDictionary class]] && [dictionary count] > 0){
        return YES;
    }
    return NO;
}

/**
 获取当前控制器
 */
+ (UIViewController *)currentController
{
    //获取Window
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal){
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows){
            if (tmpWin.windowLevel == UIWindowLevelNormal){
                window = tmpWin;
                break;
            }
        }
    }
    
    //获取当前Controller
    UIViewController *result = window.rootViewController;
    while (result.presentedViewController) {
        result = result.presentedViewController;
    }
    
    if ([result isKindOfClass:[UITabBarController class]]) {
        result = [(UITabBarController *)result selectedViewController];
    }
    
    if ([result isKindOfClass:[UINavigationController class]]) {
        result = [(UINavigationController *)result topViewController];
    }
    
    return result;
}


@end
