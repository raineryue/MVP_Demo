//
//  RYVideoPresenter.m
//  MVP_Demo
//
//  Created by Rainer on 2017/3/24.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import "RYVideoPresenter.h"
#import "RYVideoService.h"
#import "RYVideoResponseModel.h"

@interface RYVideoPresenter ()

@property (nonatomic, strong) RYVideoService *videoService;
@property (nonatomic, strong) id<RYVideoViewModel> videoViewModel;

@end

@implementation RYVideoPresenter

- (instancetype)init {
    if (self = [super init]) {
        _videoService = [[RYVideoService alloc] init];
    }
    
    return self;
}

- (void)attachViewModel:(id<RYVideoViewModel>)videoViewModel {
    _videoViewModel = videoViewModel;
}

- (void)detachViewModel {
    _videoViewModel = nil;
}

- (void)queryVideoList {
    [self.videoService queryVideoListCallBack:^(id resultData) {
        if (resultData) {
            NSLog(@"============>resultData:[%@]", resultData);
            
            NSArray *videoAarry = [NSArray array];
            
            [self.videoViewModel queryVideoList:videoAarry];
        }
    }];
}

@end
