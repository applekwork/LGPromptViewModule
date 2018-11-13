//
//  LGNetFailedView.m
//  LGPromptViewModules
//
//  Created by LG on 2018/11/12.
//  Copyright © 2018年 LG. All rights reserved.
//

#import "LGNetFailedView.h"
#import "UIImage+LGHUDModule.h"

@interface LGNetFailedView ()
@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIButton    *requestBtn;
@property (nonatomic, strong) UILabel     *descripLabel;

@end

@implementation LGNetFailedView
- (instancetype)initWithView:(UIView *)view {
    return [self initWithFrame:view.bounds];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.imageView];
        [self addSubview:self.requestBtn];
        [self addSubview:self.descripLabel];
        
    }
    return self;
}

+ (instancetype)showAddedTo:(UIView *)view
                       text:(NSString *)text
                   delegate:(id)delegate
                buttonTitle:(NSString *)buttonTitle
      buttomBackgroundImage:(UIImage *)buttonBackgroundImage
                      image:(UIImage *)image {
    [LGNetFailedView removeAllPromptForView:view];
    LGNetFailedView *failedView = [[LGNetFailedView alloc] initWithView:view];
    [view addSubview:failedView];
    failedView.delegate = delegate;
    failedView.descripLabel.text = text;
    [failedView.requestBtn setTitle:buttonTitle forState:UIControlStateNormal];
    if (buttonBackgroundImage) {
        [failedView.requestBtn setBackgroundColor:UIColor.clearColor];
        [failedView.requestBtn setBackgroundImage:buttonBackgroundImage forState:UIControlStateNormal];
    }
    if (image) {
        failedView.imageView.image = image;
        failedView.imageView.frame = CGRectMake((failedView.bounds.size.width - image.size.width) * 0.5 , failedView.bounds.size.height * 0.5 - image.size.height - 5, image.size.width, image.size.height);
    }
    return failedView;
}

/**
 * 把提示添加到View上
 * @pram view 将要添加到的View
 * @pram text 提示语
 * @pram delegate 代理
 * @pram buttonName 按钮名称
 * @pram image 提示图片
 */
+ (instancetype)showAddedTo:(UIView *)view text:(NSString *)text delegate:(id)delegate buttonName:(NSString *)buttonName image:(UIImage *)image {
    return [self showAddedTo:view
                        text:text
                    delegate:delegate
                 buttonTitle:buttonName
       buttomBackgroundImage:nil
                       image:image];
}

+ (void)cancelForView:(UIView *)view {
    LGNetFailedView *promptView = [self promptForView:view];
    if (promptView != nil) {
        [promptView removeFromSuperview];
    }
}
+ (instancetype)promptForView:(UIView *)view {
    for (UIView *subView in view.subviews) {
        if ([subView isKindOfClass:self]) {
            return (LGNetFailedView *)subView;
        }
    }
    return nil;
}
+ (void)removeAllPromptForView:(UIView *)view {
    for (UIView *subView in view.subviews) {
        if ([subView isKindOfClass:self]) {
            [subView removeFromSuperview];
        }
    }
}

#pragma mark btn selector
- (void)request {
    if (self.delegate  && [self.delegate respondsToSelector:@selector(request)]) {
        [self.delegate netFailedViewClickRequest];
    }
}

#pragma mark get selector
- (UIImageView *)imageView {
    if (!_imageView) {
        UIImage *image = [UIImage lg_HUDModuleImageNamed:@"networking_failed"];
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.bounds.size.width - image.size.width) * 0.5 , self.bounds.size.height * 0.5 - image.size.height - 5, image.size.width, image.size.height)];
        _imageView.image = image;
    }
    return _imageView;
}
- (UIButton *)requestBtn {
    if (!_requestBtn) {
        _requestBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.bounds.size.width * 0.5 - 65 , self.bounds.size.height * 0.5 + 35, 130, 30)];
        _requestBtn.backgroundColor = [UIColor colorWithRed:67.0 / 255.0 green:138.0 / 255.0 blue:1.0 alpha:1.0];
        [_requestBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_requestBtn addTarget:self action:@selector(request) forControlEvents:UIControlEventTouchUpInside];
        _requestBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _requestBtn.layer.cornerRadius = 2.0;
        _requestBtn.layer.masksToBounds = YES;
    }
    return _requestBtn;
}

- (UILabel *)descripLabel {
    if (!_descripLabel) {
        _descripLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, self.bounds.size.height * 0.5, self.bounds.size.width - 30, 15)];
        _descripLabel.backgroundColor = [UIColor clearColor];
        _descripLabel.textColor = [[UIColor alloc] initWithRed:183.0/255 green:183.0/255 blue:183.0/255 alpha:1.0];
        _descripLabel.textAlignment = NSTextAlignmentCenter;
        _descripLabel.font = [UIFont systemFontOfSize:15];
    }
    return _descripLabel;
}
@end
