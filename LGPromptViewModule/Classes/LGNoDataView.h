//
//  LGNoDataView.h
//  LGPromptViewModules
//
//  Created by LG on 2018/11/13.
//  Copyright © 2018年 LG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGNoDataView : UIView

/**
 @添加到指定View

 @param view 将要加载的View
 @param text 提示语
 @param image 提示图片
 @return 提示View
 */
+ (instancetype)showAddTo:(UIView *)view
                 withText:(NSString *)text
             withImage:(UIImage *)image;

+ (void)cancelForView:(UIView *)view;
@end
