//
//  RYVideoViewModel.h
//  MVP_Demo
//
//  Created by Rainer on 2017/3/22.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RYVideoResponseModel.h"

@protocol RYVideoViewModel <NSObject>

- (void)queryVideoList:(NSArray<RYVideoResponseModel *> *)videoList;

@end

@interface RYVideoViewModel : NSObject

@end
