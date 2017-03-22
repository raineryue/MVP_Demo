//
//  NetworkUtil.m
//  MVP_Demo
//
//  Created by Rainer on 2017/3/22.
//  Copyright © 2017年 Rainer. All rights reserved.
//

#import "NetworkUtil.h"

static id _networkUtil;

@implementation NetworkUtil

+ (instancetype)sharedNetworkUtil {
    return [[self alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t oneceTaken;
    
    dispatch_once(&oneceTaken, ^{
        _networkUtil = [super allocWithZone:zone];
    });
    
    return _networkUtil;
}

+ (id)copyWithZone:(struct _NSZone *)zone {
    return _networkUtil;
}

- (void)get:(NSString *)urlString param:(NSDictionary *)param success:(Success)success failure:(Failure)failure {
    // 创建请求
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[self requestUrlString:urlString params:param]]];
    
    urlRequest.HTTPMethod = @"GET";
    
    // 1.创建网络请求对象
    NSURLSession *urlSession = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [urlSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        !error ? success(data, response) : failure(error);
    }];
    
    // 开始请求
    [dataTask resume];
}

- (void)post:(NSString *)urlString param:(NSDictionary *)param success:(Success)success failure:(Failure)failure {
    // 创建请求
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    urlRequest.HTTPMethod = @"POST";
    urlRequest.HTTPBody = [[self paramStringWithDictionary:param] dataUsingEncoding:NSUTF8StringEncoding];
    
    // 1.创建网络请求对象
    NSURLSession *urlSession = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [urlSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        !error ? success(data, response) : failure(error);
    }];
    
    // 开始请求
    [dataTask resume];
}

- (NSString *)requestUrlString:(NSString *)urlString params:(NSDictionary *)paramDictionary {
    NSMutableString *requestUrlString = [NSMutableString stringWithString:urlString];
    
    NSMutableString *paramString = [NSMutableString string];
    
    if (nil != paramDictionary) {
        NSArray *allKeys = [paramDictionary allKeys];
        
        [allKeys enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *value = [paramDictionary objectForKey:obj];
            
            [paramString appendFormat:@"%@=%@", obj, value];
            
            if (idx != allKeys.count - 1) {
                [paramString appendString:@"&"];
            }
        }];
        
        [requestUrlString appendFormat:@"?%@", paramString];
    }
    
    return requestUrlString;
}


- (NSString *)paramStringWithDictionary:(NSDictionary *)paramDictionary {
    NSMutableString *bodyString = [NSMutableString string];
    
    if (nil != paramDictionary) {
        NSArray *allKeys = [paramDictionary allKeys];
        
        [allKeys enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *value = [paramDictionary objectForKey:obj];
            
            [bodyString appendFormat:@"%@=%@", obj, value];
            
            if (idx != allKeys.count - 1) {
                [bodyString appendString:@"&"];
            }
        }];
    }
    
    return bodyString;
}

@end
