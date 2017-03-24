//
//  UINavigationBar+Extention.h
//  MVP_Demo
//
//  Created by Rainer on 2017/3/24.
//  Copyright © 2017年 Rainer. All rights reserved.
//  注：这里参考了在网上看到的一位大神的代码，非常感谢这位大神的贡献。

#import <UIKit/UIKit.h>

@interface UINavigationBar (Extention)

/**
 设置当前NavigationBar的背景颜色

 @param backgroundColor 颜色值
 */
- (void)extention_setBackgroundColor:(UIColor  * _Nonnull)backgroundColor;

/**
 设置当前NavigationBar的背景透明度

 @param alpha 透明度值
 */
- (void)extention_setBackgroundColorAlpha:(CGFloat)alpha;

/**
 设置当前NavigationBar的Y值

 @param y y值
 */
- (void)extention_setTranslationAtY:(CGFloat)y;

/**
 回复当前NavigationBar的设置
 */
- (void)extention_resetForBackgroundColor;

@end
