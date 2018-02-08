//
//  TSNavigationBar.h
//  Penglaiju
//
//  Created by jeff zhou on 2018/2/8.
//  Copyright © 2018年 jeff zhou. All rights reserved.
//

#ifndef XYNavigationBar_h
#define XYNavigationBar_h

typedef enum {
    XYButtonStyleBack = 0,                  // 返回
    XYButtonStyleSetting,                   // 设置

    
    XYButtonStyleBackWord,                  // 带返回文字
    XYButtonStyleNone,                      // 没有返回
    XYButtonStyleRightButtonSave,           // 保存按钮
    XYButtonStyleRightButtonDone,           // 完成按钮
    XYButtonStyleRightButtonConfirm,        // 确定按钮
    XYButtonStyleClose,                     // 关闭
    XYButtonStyleNextStep,                  // 下一步按钮
    XYButtonStyleOnlyCancelWord,            // 只有取消文字的leftButton
    
} XYButtonStyle;


#endif /* TSNavigationBar_h */
