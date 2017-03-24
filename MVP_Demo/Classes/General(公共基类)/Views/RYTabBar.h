//
//  RYTabBar.h
//  MVP_Demo
//
//  Created by Rainer on 2017/3/24.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RYTabBar;

@protocol RYTabBarDelegate <NSObject>

@optional

/**
 TabBar上的按钮被点击事件处理

 @param tabBar tabBar
 @param index 当前索引
 */
- (void)tabBar:(RYTabBar *)tabBar didClickTabBarButton:(NSInteger)index;

@end

@interface RYTabBar : UIView

/** TabBar属性对象 */
@property (nonatomic, strong) NSArray<UITabBarItem *> *items;
/** 代理对象属性 */
@property (nonatomic, weak) id<RYTabBarDelegate> delegate;

@end
