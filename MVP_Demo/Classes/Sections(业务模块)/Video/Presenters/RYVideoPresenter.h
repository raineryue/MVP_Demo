//
//  RYVideoPresenter.h
//  MVP_Demo
//
//  Created by Rainer on 2017/3/24.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RYVideoViewModel.h"

@interface RYVideoPresenter : NSObject

- (void)attachViewModel:(id<RYVideoViewModel>)viewModel;

- (void)detachViewModel;

- (void)queryVideoList;

@end
