//
//  RYVideoService.m
//  MVP_Demo
//
//  Created by Rainer on 2017/3/22.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import "RYVideoService.h"
#import "RYNetworkUtil.h"

@implementation RYVideoService

- (void)queryVideoListCallBack:(CallBack)callBack {
    
    [[RYNetworkUtil sharedNetworkUtil] get:@"http://120.25.226.186:32812/video" param:nil success:^(NSData * _Nonnull data, NSURLResponse * _Nonnull response) {
        if (data.length > 0) {
            NSString *dataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            if (callBack) callBack(dataString);
        }
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"failure：----%@", error);
    }];
}

@end
