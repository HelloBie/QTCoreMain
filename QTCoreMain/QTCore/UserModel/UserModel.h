//
//  UserModel.h
//  Decoration
//
//  Created by bqt on 16/10/20.
//  Copyright © 2016年 bambootech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface UserModel : BaseModel


+ (UserModel *)getUser;
+ (void)loginWithAccount:(NSString *)account password:(NSString *)password success:(void(^)(id res))success error:(void(^)(NSError *errorBlock))errorblock;
+ (void)logout;
@end
