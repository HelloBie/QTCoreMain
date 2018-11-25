//
//  NSString+MD5.h
//  Decoration
//
//  Created by bqt on 16/10/20.
//  Copyright © 2016年 bambootech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
@interface NSString (MD5)
- (NSString *)md5HexDigest;
- (NSString *)md5String;
- (BOOL)isPhoneNumber;
-(BOOL)checkPassWord;// 密码正则

+ (NSString *)stringWithTxt:(NSString *)txtName;
@end
