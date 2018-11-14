//
//  LGLoadingMoreView.m
//  LGPromptViewModule
//
//  Created by LG on 2018/11/12.
//  Copyright © 2018年 LG. All rights reserved.
//

#import "LGLoadingMoreView.h"
#import "UIImage+LGHUDModule.h"

@interface LGLoadingMoreView ()
@property (nonatomic, strong) UIView        *backView;
@property (nonatomic, strong) UIImageView   *imageView;
@property (nonatomic, strong) UILabel       *titleLabel;
@property (nonatomic, strong) NSTimer       *time;
@property (nonatomic, assign) NSInteger      index;
@property (nonatomic, strong) NSArray       *tipArray;
@end

@implementation LGLoadingMoreView

- (instancetype)initWithView:(UIView *)view {
    return [self initWithFrame:view.bounds];
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.backView];
        [self addSubview:self.imageView];
        [self addSubview:self.titleLabel];
    }
    return self;
}

+ (instancetype)showAddedTo:(UIView *)view title:(NSString *)title {
    [LGLoadingMoreView removeAllPromptFromSuperView:view];
    LGLoadingMoreView *promptView = [[LGLoadingMoreView alloc]initWithView:view];
    promptView.titleLabel.text = title;
    [promptView setupdateLayout];
    [promptView.imageView startAnimating];
    [view addSubview:promptView];
    return promptView;
}
+ (instancetype)showAddedTo:(UIView *)view tips:(NSArray *)tips {
    [LGLoadingMoreView removeAllPromptFromSuperView:view];
    LGLoadingMoreView *promptView = [[LGLoadingMoreView alloc]initWithView:view];
    promptView.tipArray = tips;
    if (tips && [tips count] > 0) {
        promptView.titleLabel.text = [tips firstObject];
    }
    [promptView setupdateLayout];
    [promptView.imageView startAnimating];
    [promptView time];
    [view addSubview:promptView];
    return promptView;
}
- (void)oneSecondTouch {
    self.index ++;
    if (self.index > 1000) {
        self.index = 0;
    }
    if (self.index % 5 == 0) {
        self.titleLabel.text = self.tipArray[self.index % [self.tipArray count]];
    }
}
+ (void)removeAllPromptFromSuperView:(UIView *)superView {
    for (UIView *subView in superView.subviews) {
        if ([subView isKindOfClass:self]) {
            [subView removeFromSuperview];
        }
    }
}
+ (void)cancelForView:(UIView *)view {
    LGLoadingMoreView *promptView = [self promptForView:view];
    [promptView.imageView stopAnimating];
    if (promptView != nil) {
        [promptView.time invalidate];
        promptView.time = nil;
        [promptView removeFromSuperview];
    }
}
+ (instancetype)promptForView:(UIView *)view {
    for (UIView *subView in view.subviews) {
        if ([subView isKindOfClass:self]) {
            return (LGLoadingMoreView *)subView;
        }
    }
    return nil;
}
- (void)didMoveToSuperview {
    [super didMoveToSuperview];
}
- (void)setupdateLayout {
    CGSize size = [self.titleLabel.text boundingRectWithSize:CGSizeMake(130, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    if (size.width > 90) {
        self.titleLabel.frame = CGRectMake(0, 0, 130, size.height);
        self.titleLabel.center = CGPointMake(self.center.x, self.center.y + 20);
        self.backView.frame = CGRectMake(0, 0, 150, 100 + size.height);
        self.backView.center = self.center;
    }
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 48.0, 32.0)];
        _imageView.center = CGPointMake(self.center.x, self.center.y - 20);
        NSMutableArray *images = [[NSMutableArray alloc] init];
        for (int i = 1; i <= 40; i++) {
            NSString *name = [NSString stringWithFormat:@"hud_loading%d",i];
            UIImage *place = [UIImage lg_HUDModuleImageNamed:name];
            [images addObject:place];
        }
        _imageView.animationImages = [NSArray arrayWithArray:images];
    }
    return _imageView;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 90, 20)];
        _titleLabel.center = CGPointMake(self.center.x, self.center.y + 15);
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}
- (NSTimer *)time {
    if (!_time) {
        _time = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(oneSecondTouch) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_time forMode:NSRunLoopCommonModes];
    }
    return _time;
}

@end
