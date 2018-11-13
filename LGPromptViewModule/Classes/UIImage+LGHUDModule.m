
//
//  UIImage+LGHUDModule.m
//  LGPromptViewModules
//
//  Created by LG on 2018/11/12.
//  Copyright © 2018年 LG. All rights reserved.
//

#import "UIImage+LGHUDModule.h"

@implementation UIImage (LGHUDModule)
+ (UIImage *)lg_HUDModuleImageNamed:(NSString *)name {
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:NSClassFromString(@"LGLoadingMoreView")].resourcePath stringByAppendingPathComponent:@"LGPromptViewModule.bundle"]];
    if (@available(iOS 8.0, *)) {
        return [UIImage imageNamed:name
                          inBundle:bundle
     compatibleWithTraitCollection:nil];
    } else {
        NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:name];
        return [UIImage imageWithContentsOfFile:path];
    }
}
@end
