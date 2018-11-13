//
//  LGRefreshView.h
//  LGPromptViewModules
//
//  Created by LG on 2018/11/13.
//  Copyright © 2018年 LG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGRefreshView : UIView
//添加到页面
+ (instancetype)showAddToView:(UIView *)view;
//移除页面
+ (void)cancelForView:(UIView *)view;
@end
