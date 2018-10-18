//
//  UserModel.m
//  Decoration
//
//  Created by bqt on 16/10/20.
//  Copyright © 2016年 bambootech. All rights reserved.
//

#import "UserModel.h"
#import "NetWorkingTool.h"
#import <AFNetworking.h>
#import "AppDelegate.h"
#import "NSString+MD5.h"
@interface UserModel ()

@end

static UserModel *user;// 用户单例


@implementation UserModel

// 类方法获取用户对象

+ (UserModel *)getUser
{
    
    
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults] valueForKey:@"user"];
    if (dic) {
        if (!user) {
            user = [UserModel new];
            
        }
        [user setValuesForKeysWithDictionary:dic];
    }
      return user;
}
// 登录方法
+ (void)loginWithAccount:(NSString *)account password:(NSString *)password success:(void(^)(id res))success error:(void(^)(NSError *errorBlock))errorblock
{

     

 
}

- (void)setNilValueForKey:(NSString *)key
{
    [self setValue:@"" forKey:key];
}

// 登出

+ (void)logout
{
    user = nil;

    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"user"];
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"figureurl"] && value) {
        
    }
    // 处理空值
    if ([value isKindOfClass:[NSString class]]) {
        if ([value isEqualToString:@"<null>"]) {
            value = @"";
        }
        
    }
    [super setValue:value forKey:key];
}

@end
