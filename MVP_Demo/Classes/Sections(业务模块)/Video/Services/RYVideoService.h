//
//  RYVideoService.h
//  MVP_Demo
//
//  Created by Rainer on 2017/3/22.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RYVideoResponseModel.h"

typedef void(^CallBack)(id resultData);

@interface RYVideoService : NSObject

- (void)queryVideoListCallBack:(CallBack)callBack;

@end
