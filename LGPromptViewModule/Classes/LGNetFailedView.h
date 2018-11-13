//
//  LGNetFailedView.h
//  LGPromptViewModules
//
//  Created by LG on 2018/11/12.
//  Copyright © 2018年 LG. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LGNetFailedViewDelegate<NSObject>
@optional
- (void)netFailedViewClickRequest;
@end

@interface LGNetFailedView : UIView
@property (nonatomic, weak) id<LGNetFailedViewDelegate>  delegate;

/**
 @ 把提示添加到View上
 * @pram view 将要添加到的View
 * @pram text 提示语
 * @pram delegate 代理
 * @pram buttonName 按钮名称
 * @pram image 提示图片
 */
+ (instancetype)showAddedTo:(UIView *)view text:(NSString *)text delegate:(id)delegate buttonName:(NSString *)buttonName image:(UIImage *)image;
+ (void)cancelForView:(UIView *)view;
@end
