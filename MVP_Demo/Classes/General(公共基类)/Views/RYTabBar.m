//
//  RYTabBar.m
//  MVP_Demo
//
//  Created by Rainer on 2017/3/24.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import "RYTabBar.h"
#import "RYBarButtonItem.h"

@interface RYTabBar ()

@property (nonatomic, strong) RYBarButtonItem *selectTabBarButtonItem;

@end

@implementation RYTabBar

/**
 *  复写items的setter添加子控件
 */
- (void)setItems:(NSArray *)items {
    _items = items;
    
    [items enumerateObjectsUsingBlock:^(UITabBarItem *tabBarItem, NSUInteger idx, BOOL *stop) {
        RYBarButtonItem *tabBarButtonItem  = [RYBarButtonItem buttonWithType:UIButtonTypeCustom];
        
        tabBarButtonItem.tag = idx;
        
        [tabBarButtonItem setTitle:tabBarItem.title forState:UIControlStateNormal];
        
        [tabBarButtonItem setImage:tabBarItem.image forState:UIControlStateNormal];
        [tabBarButtonItem setImage:tabBarItem.selectedImage forState:UIControlStateSelected];
        
        [tabBarButtonItem addTarget:self action:@selector(tabBarButtonItemClickAction:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:tabBarButtonItem];
        
        if (0 == idx) {
            [self tabBarButtonItemClickAction:tabBarButtonItem];
        }
    }];
}

- (void)tabBarButtonItemClickAction:(RYBarButtonItem *)tabBarButtonItem {
    if ([tabBarButtonItem isEqual:self.selectTabBarButtonItem])
        return;
    
    tabBarButtonItem.selected = YES;
    
    self.selectTabBarButtonItem.selected = NO;
    
    self.selectTabBarButtonItem = tabBarButtonItem;
    
    if (self.delegate) {
        [self.delegate tabBar:self didClickTabBarButton:tabBarButtonItem.tag];
    }
}

- (RYBarButtonItem *)selectTabBarButtonItem {
    if (nil == _selectTabBarButtonItem) {
        _selectTabBarButtonItem = [RYBarButtonItem buttonWithType:UIButtonTypeCustom];
    }
    
    return _selectTabBarButtonItem;
}

/**
 *  重新布局子控件
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSArray *subviewArray = self.subviews;
    
    __block CGFloat tabBarButtonItemX = 0;
    CGFloat tabBarButtonItemY = 0;
    CGFloat tabBarButtonItemW = self.bounds.size.width / subviewArray.count;
    CGFloat tabBarButtonItemH = self.bounds.size.height;
    
    [subviewArray enumerateObjectsUsingBlock:^(UIButton *tabBarButtonItem, NSUInteger idx, BOOL *stop) {
        tabBarButtonItemX = tabBarButtonItemW * idx;
        
        tabBarButtonItem.frame = CGRectMake(tabBarButtonItemX, tabBarButtonItemY, tabBarButtonItemW, tabBarButtonItemH);
        
    }];
}

@end
