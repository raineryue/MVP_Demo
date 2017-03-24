//
//  RYNetworkUtil.h
//  MVP_Demo
//
//  Created by Rainer on 2017/3/22.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Success)(NSData *data, NSURLResponse *response);
typedef void(^Failure)(NSError *error);

@interface RYNetworkUtil : NSObject

+ (instancetype)sharedNetworkUtil;

- (void)get:(NSString *)urlString param:(NSDictionary *)param success:(Success)success failure:(Failure)failure;

- (void)post:(NSString *)urlString param:(NSDictionary *)param success:(Success)success failure:(Failure)failure;

@end
