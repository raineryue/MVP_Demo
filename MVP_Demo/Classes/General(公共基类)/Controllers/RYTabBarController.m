//
//  RYTabBarController.m
//  MVP_Demo
//
//  Created by Rainer on 2017/3/24.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import "RYTabBarController.h"
#import "RYTabBar.h"
#import "RYHomeViewController.h"
#import "RYDiscoverViewController.h"
#import "RYMyselfViewController.h"
#import "RYNavigationController.h"

@interface RYTabBarController () <RYTabBarDelegate>

@property (nonatomic, weak) RYTabBar *customTabBar;
@property (nonatomic, strong) NSMutableArray *itemArray;

@end

@implementation RYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.设置所有的子控制器
    [self setUpAllChildViewControllers];
    
    // 2.设置tabBar
    self.customTabBar.items = self.itemArray;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    for (UIView *childView in self.tabBar.subviews) {
        if (![childView isKindOfClass:[RYTabBar class]]) {
            [childView removeFromSuperview];
        }
    }
}

/**
 *  自己定义的tabbar在iOS8 中重叠的情况.就是原本已经移除的UITabBarButton再次出现
 *  在iOS8 是允许动态添加tabbaritem的,这里重新布局时在此做移除操作
 */
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    for (UIView *childView in self.tabBar.subviews) {
        if ([childView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [childView removeFromSuperview];
        }
    }
}

/**
 *  设置所有的子控制器
 */
- (void)setUpAllChildViewControllers {
    // 1.首页
    RYHomeViewController *homeViewController = [[RYHomeViewController alloc] init];
    [self setUpChildViewController:homeViewController itemTitle:@"首页" imageName:@"" selectImageName:@""];
    
    // 2.发现
    RYDiscoverViewController *discoverViewController = [[RYDiscoverViewController alloc] init];
    [self setUpChildViewController:discoverViewController itemTitle:@"发现" imageName:@"TabBar_zb_nomal" selectImageName:@"TabBar_zb_selected"];
    
    // 3.我
    RYMyselfViewController *myselfViewController = [[RYMyselfViewController alloc] init];
    [self setUpChildViewController:myselfViewController itemTitle:@"我" imageName:@"TabBar_wd_nomal" selectImageName:@"TabBar_wd_selected"];
}

/**
 *  给控制器添加子控制器
 */
- (void)setUpChildViewController:(UIViewController *)viewController itemTitle:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName {
    // 1.设置控制器tabBar的按钮属性
    viewController.tabBarItem.image = [UIImage imageNamed:imageName];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:selectImageName];
    
    // 2.给自定义的tabBar属性复制
    [self.itemArray addObject:viewController.tabBarItem];
    
    // 3.创建一个导航控制器对象，把控制器设置根控制器
    RYNavigationController *navigationController = [[RYNavigationController alloc] initWithRootViewController:viewController];
    
    // 4.将控制器作为当前的子控制器
    [self addChildViewController:navigationController];
}

/**
 *  懒加载自定义TabBar控件
 */
- (RYTabBar *)customTabBar {
    if (nil == _customTabBar) {
        // 1.创建一个自定义的TabBar对象
        RYTabBar *tabBar = [[RYTabBar alloc] init];
        
        tabBar.delegate = self;
        
        // 2.设置自定义TabBar对象的位置大小
        tabBar.frame = self.tabBar.bounds;
        tabBar.backgroundColor = [UIColor whiteColor];
        
        // 3.强引用对象
        _customTabBar = tabBar;
        
        // 4.将自定义TabBar对象添加到当前控制器的视图上
        [self.tabBar addSubview:_customTabBar];
    }
    
    return _customTabBar;
}

/**
 *  懒加载item数组
 */
- (NSMutableArray *)itemArray {
    if (nil == _itemArray) {
        _itemArray = [NSMutableArray array];
    }
    
    return _itemArray;
}

#pragma mark - 代理事件实现
/**
 *  TabBar代理事件
 */
- (void)tabBar:(RYTabBar *)tabBar didClickTabBarButton:(NSInteger)index {
    self.selectedIndex = index;
}

@end
