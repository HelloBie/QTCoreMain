//
//  NSString+MD5.m
//  Decoration
//
//  Created by bqt on 16/10/20.
//  Copyright © 2016年 bambootech. All rights reserved.
//

#import "NSString+MD5.h"

@implementation NSString (MD5)

-(BOOL)checkPassWord
{
    //6-20位数字和字母组成
    NSString *regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$";
    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([pred evaluateWithObject:self]) {
        return YES ;
    }else
        return NO;
}

- (NSString *)md5String
{
    if(self == nil || [self length] == 0) return nil;
    unsigned char digest[CC_MD5_DIGEST_LENGTH], i;
    CC_MD5([self UTF8String], (int)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];
    for(i=0;i<CC_MD5_DIGEST_LENGTH;i++)
    {
        [ms appendFormat: @"%02x", (int)(digest[i])];
    }
    return [ms copy];
}

+ (NSString *)md5HexDigest:(NSString*)input
{
    input  = [NSString stringWithFormat:@"%@", input];
    
    const char *cStr = [input UTF8String];
    
    
    
    unsigned char result[32];
    
    
    CC_MD5( cStr, strlen(cStr), result );
    
    
    
    return [[NSString stringWithFormat:
             
             
             
             @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             
             
             
             result[0],result[1],result[2],result[3],
             
             result[4],result[5],result[6],result[7],
             
             result[8],result[9],result[10],result[11],
             
             result[12],result[13],result[14],result[15],
             
             result[16], result[17],result[18], result[19],
             
             result[20], result[21],result[22], result[23],
             
             result[24], result[25],result[26], result[27],
             
             result[28], result[29],result[30], result[31]] lowercaseString];
    
}
- (NSString *)md5HexDigest
{
    NSString *input  = [NSString stringWithFormat:@"%@", self];
    
    const char *cStr = [input UTF8String];
    
    
    
    unsigned char result[32];
    
    
    CC_MD5( cStr, strlen(cStr), result );
    
    
    
    return [[NSString stringWithFormat:
             
             
             
             @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             
             
             
             result[0],result[1],result[2],result[3],
             
             result[4],result[5],result[6],result[7],
             
             result[8],result[9],result[10],result[11],
             
             result[12],result[13],result[14],result[15],
             
             result[16], result[17],result[18], result[19],
             
             result[20], result[21],result[22], result[23],
             
             result[24], result[25],result[26], result[27],
             
             result[28], result[29],result[30], result[31]] lowercaseString];
    
}

- (BOOL)isPhoneNumber
{
    if (self.length != 11)
    {
        return NO;
    }
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
     * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     * 联通号段: 130,131,132,155,156,185,186,145,176,1709
     * 电信号段: 133,153,180,181,189,177,1700
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0678])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     */
    NSString *CM = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
    /**
     * 中国联通：China Unicom
     * 130,131,132,155,156,185,186,145,176,1709
     */
    NSString *CU = @"(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
    /**
     * 中国电信：China Telecom
     * 133,153,180,181,189,177,1700
     */
    NSString *CT = @"(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
    
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:self] == YES)
        || ([regextestcm evaluateWithObject:self] == YES)
        || ([regextestct evaluateWithObject:self] == YES)
        || ([regextestcu evaluateWithObject:self] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }}

@end
