//
//  VideoService.m
//  MVP_Demo
//
//  Created by Rainer on 2017/3/22.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import "VideoService.h"
#import "NetworkUtil.h"

@implementation VideoService

- (void)queryVideoListCallBack:(CallBack)callBack {
    
    [[NetworkUtil sharedNetworkUtil] get:@"http://120.25.226.186:32812/video" param:nil success:^(NSData * _Nonnull data, NSURLResponse * _Nonnull response) {
        if (data.length > 0) {
            //NSString *dataString = [NSString s];
        }
        
        NSLog(@"%@----%@", response, data);
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"----%@", error);
    }];
}

@end
