//
//  UINavigationBar+Extention.m
//  MVP_Demo
//
//  Created by Rainer on 2017/3/24.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import "UINavigationBar+Extention.h"
#import <objc/runtime.h>

@implementation UINavigationBar (Extention)

static char overlayerKey;

#pragma mark - 公有方法

/**
 设置当前NavigationBar的背景颜色
 
 @param backgroundColor 颜色值
 */
- (void)extention_setBackgroundColor:(UIColor * _Nonnull)backgroundColor {
    if (!self.overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + 20)];
        
        self.overlay.userInteractionEnabled = NO;
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
        [[self.subviews firstObject] insertSubview:self.overlay atIndex:0];
    }
    
    self.overlay.backgroundColor = backgroundColor;
}

/**
 设置当前NavigationBar的背景透明度
 
 @param alpha 透明度值
 */
- (void)extention_setBackgroundColorAlpha:(CGFloat)alpha {
    [[self valueForKey:@"_leftViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    [[self valueForKey:@"_rightViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    UIView *titleView = [self valueForKey:@"_titleView"];
    
    titleView.alpha = alpha;
    
    [[self subviews] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:NSClassFromString(@"UINavigationItemView")]) {
            obj.alpha = alpha;
            *stop = YES;
        }
    }];
}

/**
 设置当前NavigationBar的Y值
 
 @param y y值
 */
- (void)extention_setTranslationAtY:(CGFloat)y {
    self.transform = CGAffineTransformMakeTranslation(0, y);
}

/**
 回复当前NavigationBar的设置
 */
- (void)extention_resetForBackgroundColor {
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    
    [self.overlay removeFromSuperview];
    
    self.overlay = nil;
}

#pragma mark - 属性Getter和Setter

/**
 遮照层(UIView)

 @return 图层
 */
- (UIView *)overlay {
    return objc_getAssociatedObject(self, &overlayerKey);
}

/**
 设置遮照层(UIView)

 @param overlayer 遮照层
 */
- (void)setOverlay:(UIView *)overlayer {
    objc_setAssociatedObject(self, &overlayerKey, overlayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
