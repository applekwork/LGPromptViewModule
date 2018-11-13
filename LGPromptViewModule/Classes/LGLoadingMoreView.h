//
//  LGLoadingMoreView.h
//  LGPromptViewModule
//
//  Created by LG on 2018/11/12.
//  Copyright © 2018年 LG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGLoadingMoreView : UIView

/**
 @添加页面
 
 @param view  要添加的视图
 @param title 标题
 @return 加载更多视图
 */
+ (instancetype)showAddedTo:(UIView *)view title:(NSString *)title;

/**
 @移除页面

 @param view 从父视图移除视图
 */
+ (void)cancelForView:(UIView *)view;
@end
