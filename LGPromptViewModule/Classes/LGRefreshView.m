
//
//  LGRefreshView.m
//  LGPromptViewModules
//
//  Created by LG on 2018/11/13.
//  Copyright © 2018年 LG. All rights reserved.
//

#import "LGRefreshView.h"
#import "UIImage+LGHUDModule.h"

@interface LGRefreshView ()
@property (nonatomic, strong) UIView        *backView;
@property (nonatomic, strong) UIImageView   *imageView;
@end

@implementation LGRefreshView
- (instancetype)initWithView:(UIView *)view {
    return [self initWithFrame:view.bounds];
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backView];
        [self addSubview:self.imageView];
    }
    return self;
}
+ (instancetype)showAddToView:(UIView *)view {
    [LGRefreshView removeAllPromptViewFromView:view];
    LGRefreshView *refreshView = [[LGRefreshView alloc]initWithView:view];
    [view addSubview:refreshView];
    [refreshView.imageView startAnimating];
    return refreshView;
}
+ (void)cancelForView:(UIView *)view {
    LGRefreshView *refreshView = [self promptForView:view];
    if (refreshView != nil) {
        [refreshView.imageView stopAnimating];
        [refreshView removeFromSuperview];
    }
}
+ (instancetype)promptForView:(UIView *)view {
    for (UIView *subView in view.subviews) {
        if ([subView isKindOfClass:self]) {
            return (LGRefreshView *)subView;
        }
    }
    return nil;
}
//移除页面
+ (void)removeAllPromptViewFromView:(UIView *)view {
    for (UIView *subView in view.subviews) {
        if ([subView isKindOfClass:self]) {
            [subView removeFromSuperview];
        }
    }
}
- (void)didMoveToSuperview {
    [super didMoveToSuperview];
}
- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:self.bounds];
        _backView.backgroundColor = [UIColor clearColor];
    }
    return _backView;
}
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        _imageView.center = self.center;
        NSMutableArray *images = [[NSMutableArray alloc] init];
        for (int i = 0; i <= 35; i++) {
            NSString *name = [NSString stringWithFormat:@"loading%d",i];
            UIImage *place = [UIImage lg_HUDModuleImageNamed:name];
            [images addObject:place];
        }
        _imageView.animationImages = [NSArray arrayWithArray:images];
    }
    return _imageView;
}
@end
