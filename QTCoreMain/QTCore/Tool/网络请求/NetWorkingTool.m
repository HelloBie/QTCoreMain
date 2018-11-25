//
//  NetWorkingTool.m
//  Decoration
//
//  Created by bqt on 16/10/21.
//  Copyright © 2016年 bambootech. All rights reserved.
//

#import "NetWorkingTool.h"
#import <AFNetworking.h>
#import "NSString+MD5.h"
@implementation NetWorkingTool
#pragma mark -- GET请求 --
+ (void)getWithURLString:(NSString *)URLString
              parameters:(id)parameters
                 success:(void (^)(id))success
                 failure:(void (^)(NSError *))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    /**
     *  可以接受的类型
     */
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    /**
     *  请求队列的最大并发数
     */
    //    manager.operationQueue.maxConcurrentOperationCount = 5;
    /**
     *  请求超时的时间
     */
    //    manager.requestSerializer.timeoutInterval = 5;
      URLString = [NSString stringWithFormat:@"%@%@", QTBaseURL,URLString];
    NSMutableDictionary *dic = ((NSDictionary *)parameters).mutableCopy;
    [dic setObject:@"2201" forKey:@"citycode"];
    for (NSString *key in dic.allKeys) {
        NSString *value = [NSString stringWithFormat:@"%@",[dic valueForKey:key]];
        [dic setObject: [value stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] forKey:key];
    }
    [manager GET:URLString parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([[responseObject class] isSubclassOfClass:[NSData class]]) {
            NSError *error = nil;
            responseObject = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        }
        if (success) {
            NSLog(@"%@", [task.currentRequest valueForKey:@"URL"]);
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

#pragma mark -- POST请求 --
+ (void)postWithURLString:(NSString *)URLString
               parameters:(id)parameters
                  success:(void (^)(id))success
                  failure:(void (^)(NSError *))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
   
    // 可接受的文本参数规格
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript",@"text/plain", nil];
    URLString = [NSString stringWithFormat:@"%@%@", QTBaseURL,URLString];
    NSMutableDictionary *dic = ((NSDictionary *)parameters).mutableCopy;
    [dic setObject:@"2201" forKey:@"citycode"];
    
//    for (NSString *key in dic.allKeys) {
//        NSString *value = [NSString stringWithFormat:@"%@",[dic valueForKey:key]];
//        [dic setObject: [value stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] forKey:key];
//    }
    NSLog(@"%@",dic);
    [manager POST:URLString parameters:dic.copy progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([[responseObject class] isSubclassOfClass:[NSData class]]) {
            NSError *error = nil;
            responseObject = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        }
        if (success) {
            NSLog(@"%@", URLString);
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

#pragma mark -- POST/GET网络请求 --
+ (void)requestWithURLString:(NSString *)URLString
                  parameters:(id)parameters
                        type:(HttpRequestType)type
                     success:(void (^)(id))success
                     failure:(void (^)(NSError *))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    switch (type) {
        case HttpRequestTypeGet:
        {
            [manager GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
            }];
        }
            break;
        case HttpRequestTypePost:
        {
            [manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
            }];
        }
            break;
    }
}

#pragma mark -- 上传图片 --
+ (void)uploadWithURLString:(NSString *)URLString
                 parameters:(id)parameters
                uploadParam:(UploadParam *)uploadParam
                    success:(void (^)())success
                    failure:(void (^)(NSError *))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    // 可接受的文本参数规格
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil];
    URLString = [NSString stringWithFormat:@"%@%@", QTBaseURL,URLString];
    NSMutableDictionary *dic = ((NSDictionary *)parameters).mutableCopy;
    [dic setObject:@"2201" forKey:@"citycode"];
    
    //    for (NSString *key in dic.allKeys) {
    //        NSString *value = [NSString stringWithFormat:@"%@",[dic valueForKey:key]];
    //        [dic setObject: [value stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] forKey:key];
    //    }
    NSLog(@"%@",dic);
    [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:uploadParam.data name:uploadParam.name fileName:uploadParam.filename mimeType:uploadParam.mimeType];
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
