

//
//  LGToastView.m
//  LGPromptViewModules
//
//  Created by LG on 2018/11/12.
//  Copyright © 2018年 LG. All rights reserved.
//

#import "LGToastView.h"
#import "UIImage+LGHUDModule.h"
@interface LGToastView ()
@property(nonatomic, strong) CALayer *iconLayer;
@property(nonatomic, copy)   NSString *tip;
@property(nonatomic, assign) BOOL withoutFlag;
@end

@implementation LGToastView

+ (void)showWithTip:(NSString *)tip {
    [[[LGToastView alloc]initWithTip:tip] showInView:[self getMainWindow]];
}
+ (void)showInView:(UIView *)view tip:(NSString *)tip {
    if (tip && tip.length > 0) {
        LGToastView *toastView = [[LGToastView alloc] initWithFrame:CGRectZero tip:tip withoutIcon:NO];
        [toastView showInView:view];
    }
}
- (instancetype)initWithFrame:(CGRect)frame tip:(NSString *)tip withoutIcon:(BOOL)isWithout {
    frame = [LGToastView toastSize:tip width:CGRectGetWidth([UIScreen mainScreen].bounds)];
    self = [super initWithFrame:frame];
    if (self) {
        self.withoutFlag = isWithout;
        self.backgroundColor = [UIColor clearColor];
        self.tip = tip;
        if (!isWithout) {
            self.iconLayer = [CALayer layer];
            self.iconLayer.contents = (__bridge id _Nullable) ([UIImage lg_HUDModuleImageNamed:@"toast"].CGImage);
            self.iconLayer.frame = CGRectMake(15.0, 11.0, 15.0, 15.0);
            [self.layer addSublayer:self.iconLayer];
        }
    }
    return self;
}
- (instancetype)initWithTip:(NSString *)tip {
    CGRect frame = [LGToastView toastSize:tip width:CGRectGetWidth([UIScreen mainScreen].bounds)];
    frame.origin.y = CGRectGetHeight([UIScreen mainScreen].bounds) - 68 - CGRectGetHeight(frame);
    self = [super initWithFrame:frame];
    if (self) {
        self.withoutFlag = YES;
        self.backgroundColor = [UIColor clearColor];
        self.tip = tip;
    }
    return self;
}
- (void)showInView:(UIView *)view {
    [view addSubview:self];
    [view bringSubviewToFront:self];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self removeFromSuperview];
    });
}

//获取当前window
+ (UIWindow *)getMainWindow {
    UIApplication *app = [UIApplication sharedApplication];
    if ([app.delegate respondsToSelector:@selector(window)]) {
        return [app.delegate window];
    } else {
        return [app keyWindow];
    }
}
- (void)drawRect:(CGRect)rect {
    CGFloat black = 69.0 / 255.0;
    UIColor *bgColor;
    if (@available(iOS 10.0, *)) {
        bgColor = [UIColor colorWithDisplayP3Red:black green:black blue:black alpha:1.0];
    } else {
        bgColor = [UIColor colorWithRed:black green:black blue:black alpha:1.0];
    }
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:50.0];
    [bgColor setFill];
    [path fill];
    
    UIFont *font = [LGToastView textFont];
    CGSize size = [self.tip sizeWithAttributes:@{NSFontAttributeName: font}];
    CGFloat x = 40;
    if (self.withoutFlag) {
        x = (CGRectGetWidth(rect) - size.width) / 2;
    }
    rect = CGRectMake(x, (CGRectGetHeight(rect) - size.height) / 2, size.width, size.height);
    [self.tip drawInRect:rect withAttributes:@{NSFontAttributeName: font, NSForegroundColorAttributeName: [UIColor whiteColor]}];
}

+ (CGRect)toastSize:(NSString *)tips width:(CGFloat)width {
    CGFloat toastWidth = [tips sizeWithAttributes:@{NSFontAttributeName: [self textFont]}].width;
    toastWidth += 55.0;
    if (toastWidth > width) {
        toastWidth = width;
    }
    CGRect frame = CGRectMake((width - toastWidth) / 2, 0, toastWidth, 38.0);
    return frame;
}
+ (UIFont *)textFont {
    return [UIFont systemFontOfSize:14.0];
}
@end
