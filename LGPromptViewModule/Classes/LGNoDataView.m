//
//  LGNoDataView.m
//  LGPromptViewModules
//
//  Created by LG on 2018/11/13.
//  Copyright © 2018年 LG. All rights reserved.
//

#import "LGNoDataView.h"
#import "UIImage+LGHUDModule.h"

@interface LGNoDataView()
@property (nonatomic, strong) UILabel       *textLabel;
@property (nonatomic, strong) UIImageView   *imageView;
@end


@implementation LGNoDataView
- (instancetype)initWithView:(UIView *)view {
    return [self initWithFrame:view.bounds];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.textLabel];
    }
    return self;
}
+ (void)removeAllPromptView:(UIView *)view {
    for (UIView *subView in view.subviews) {
        if ([subView isKindOfClass:self]) {
            [subView removeFromSuperview];
        }
    }
}
+ (instancetype)showAddTo:(UIView *)view withText:(NSString *)text withImage:(UIImage *)image {
    [LGNoDataView removeAllPromptView:view];
    LGNoDataView *noView = [[LGNoDataView alloc]initWithView:view];
    [view addSubview:noView];
    noView.textLabel.text = text;
    if (image) {
        noView.imageView.image = image;
        noView.imageView.frame = CGRectMake((noView.bounds.size.width - image.size.width) * 0.5, noView.bounds.size.height * 0.5 - image.size.height, image.size.width, image.size.height);
    }
    return noView;
}
+ (void)cancelForView:(UIView *)view {
    LGNoDataView *noView = [self promptForView:view];
    if (noView != nil) {
        [noView removeFromSuperview];
    }
}
+ (instancetype)promptForView:(UIView *)view {
    for (UIView *subView in view.subviews) {
        if ([subView isKindOfClass:self]) {
            return (LGNoDataView *)subView;
        }
    }
    return nil;
}
- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, self.bounds.size.height * 0.5 + 5, self.bounds.size.width - 30, 20)];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.numberOfLines = 0;
        _textLabel.textColor = [[UIColor alloc] initWithRed:183.0/255 green:183.0/255 blue:183.0/255 alpha:1.0];
        _textLabel.font = [UIFont systemFontOfSize:15];
    }
    return _textLabel;
}
- (UIImageView *)imageView {
    if (!_imageView) {
        UIImage *image = [UIImage lg_HUDModuleImageNamed:@"nil_prompt"];
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.bounds.size.width - image.size.width) * 0.5, self.bounds.size.height * 0.5 - image.size.height, image.size.width, image.size.height)];
        _imageView.image = image;
    }
    return _imageView;
}
@end
