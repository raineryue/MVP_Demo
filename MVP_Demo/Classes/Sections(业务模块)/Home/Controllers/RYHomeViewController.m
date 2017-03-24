//
//  RYHomeViewController.m
//  MVP_Demo
//
//  Created by Rainer on 2017/3/24.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import "RYHomeViewController.h"
#import "RYVideoViewController.h"

@interface RYHomeViewController ()

@end

@implementation RYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"首页";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *videoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    videoButton.backgroundColor = [UIColor grayColor];
    [videoButton setTitle:@"视频列表" forState:UIControlStateNormal];
    [videoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [videoButton setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    [videoButton addTarget:self action:@selector(videoButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat videoButtonW = 100;
    CGFloat videoButtonH = 100;
    CGFloat videoButtonX = (self.view.bounds.size.width - videoButtonW) * 0.5;
    CGFloat videoButtonY = (self.view.bounds.size.height - videoButtonH) * 0.5;
    
    videoButton.frame = CGRectMake(videoButtonX, videoButtonY, videoButtonW, videoButtonH);
    
    [self.view addSubview:videoButton];
}

- (void)videoButtonClickedAction:(UIButton *)videoButton {
    [self.navigationController pushViewController:[[RYVideoViewController alloc] init] animated:YES];
}

@end
