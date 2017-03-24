//
//  RYVideoViewController.m
//  MVP_Demo
//
//  Created by Rainer on 2017/3/22.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import "RYVideoViewController.h"
#import "RYVideoPresenter.h"
#import "RYVideoViewModel.h"

@interface RYVideoViewController ()<RYVideoViewModel>

@property (nonatomic, strong) RYVideoPresenter *videoPresenter;

@end

@implementation RYVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    // 创建Presenterd对象
    self.videoPresenter = [[RYVideoPresenter alloc] init];
    
    // 绑定数据
    [self.videoPresenter attachViewModel:self];
    
    // 获取数据
    [self.videoPresenter queryVideoList];
}

/**
 实现协议获取数据列表

 @param videoList 数据列表
 */
- (void)queryVideoList:(NSArray<RYVideoResponseModel *> *)videoList {
    NSLog(@"========================>videoList:[%@]", videoList);
}

- (void)dealloc {
    // 解绑数据
    [self.videoPresenter detachViewModel];
}

@end
