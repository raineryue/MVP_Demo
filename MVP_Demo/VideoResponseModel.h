//
//  VideoResponseModel.h
//  MVP_Demo
//
//  Created by Rainer on 2017/3/22.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoResponseModel : NSObject

/** 编号 */
@property (nonatomic, assign) NSInteger id;
/** 名称 */
@property (nonatomic, assign) NSString *name;
/** 大小 */
@property (nonatomic, assign) NSInteger length;
/** 图片 */
@property (nonatomic, assign) NSString *image;
/** 地址 */
@property (nonatomic, assign) NSString *url;

@end
