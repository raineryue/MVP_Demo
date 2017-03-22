//
//  ViewController.m
//  MVP_Demo
//
//  Created by Rainer on 2017/3/22.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import "ViewController.h"
#import "NetworkUtil.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NetworkUtil sharedNetworkUtil] get:@"http://120.25.226.186:32812/video" param:nil success:^(NSData * _Nonnull data, NSURLResponse * _Nonnull response) {
        NSLog(@"%@----%@", response, data);
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"----%@", error);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
