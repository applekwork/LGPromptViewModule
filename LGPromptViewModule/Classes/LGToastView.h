//
//  LGToastView.h
//  LGPromptViewModules
//
//  Created by LG on 2018/11/12.
//  Copyright © 2018年 LG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGToastView : UIView

/**
 @ 添加Toast到window

 @param tip 标题
 */
+ (void)showWithTip:(NSString *)tip;


/**
 @ 添加Toast到指定Viewe

 @param view 指定视图
 @param tip  标题
 */
+ (void)showInView:(UIView *)view tip:(NSString *)tip;
@end
