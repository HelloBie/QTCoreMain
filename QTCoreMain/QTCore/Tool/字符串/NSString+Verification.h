//
//  NSString+Verification.h
//  QTCoreMain
//
//  Created by MasterBie on 2019/8/29.
//  Copyright © 2019 MasterBie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSString (Verification)

+ (BOOL)StringIsNULL:(NSString *)string;

/// 验证字符串为空 ,为空:YES, 不为空:NO
+ (BOOL)MyStringIsNULL:(NSString *)string;

//判断是否有中文
+(BOOL)IsChinese:(NSString *)str;

//判断是否全为中文
+(BOOL)isValidateHomePhoneNum:(NSString *)string;

//判断某个字符串的长度是否在某个范围内0除外
- (BOOL)RangeMinNum:(int) minNum maxNum:(int) maxNum;

//判断是否只有数字或字母

- (BOOL)isOnlyNumAndLetter;

//判断是否是微信
+ (BOOL)isWheatNumber:(NSString *)str;
//判断是否全为数字
+ (BOOL)isPureNumandCharacters:(NSString *)string;
//判断是否身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard;
/**
 *  将阿拉伯数字转换为中文数字
 */
+(NSString *)translationArabicNum:(NSInteger)arabicNum;
/**
 *  高度
 */
+ (CGFloat)returnHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width andDic:(NSDictionary *)oldDIc withHeight:(CGFloat)height;



/**
 *  手机号码的有效性:分电信、联通、移动和小灵通
 */
- (BOOL)isMobileNumberClassification;
/**
 *  手机号有效性
 */
- (BOOL)isMobileNumber;

/**
 *  邮箱的有效性
 */
- (BOOL)isEmailAddress;

/**
 *  简单的身份证有效性
 *
 */
- (BOOL)simpleVerifyIdentityCardNum;

/**
 *  精确的身份证号码有效性检测
 *
 *  @param value 身份证号
 */
+ (BOOL)accurateVerifyIDCardNumber:(NSString *)value;

/**
 *  车牌号的有效性
 */
- (BOOL)isCarNumber;

/**
 *  银行卡的有效性
 */
- (BOOL)bankCardluhmCheck;

/**
 *  IP地址有效性
 */
- (BOOL)isIPAddress;

/**
 *  Mac地址有效性
 */
- (BOOL)isMacAddress;

/**
 *  网址有效性
 */
- (BOOL)isValidUrl;

/**
 *  纯汉字
 */
- (BOOL)isValidChinese;

/**
 *  邮政编码
 */
- (BOOL)isValidPostalcode;

/**
 *  工商税号
 */
- (BOOL)isValidTaxNo;
/**
 *  验证是钱
 */
-(BOOL)validateMoney;

/**
 @brief     是否符合最小长度、最长长度，是否包含中文,首字母是否可以为数字
 @param     minLenth 账号最小长度
 @param     maxLenth 账号最长长度
 @param     containChinese 是否包含中文
 @param     firstCannotBeDigtal 首字母不能为数字
 @return    正则验证成功返回YES, 否则返回NO
 */
- (BOOL)isValidWithMinLenth:(NSInteger)minLenth
                   maxLenth:(NSInteger)maxLenth
             containChinese:(BOOL)containChinese
        firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;

/**
 @brief     是否符合最小长度、最长长度，是否包含中文,数字，字母，其他字符，首字母是否可以为数字
 @param     minLenth 账号最小长度
 @param     maxLenth 账号最长长度
 @param     containChinese 是否包含中文
 @param     containDigtal   包含数字
 @param     containLetter   包含字母
 @param     containOtherCharacter   其他字符
 @param     firstCannotBeDigtal 首字母不能为数字
 @return    正则验证成功返回YES, 否则返回NO
 */
- (BOOL)isValidWithMinLenth:(NSInteger)minLenth
                   maxLenth:(NSInteger)maxLenth
             containChinese:(BOOL)containChinese
              containDigtal:(BOOL)containDigtal
              containLetter:(BOOL)containLetter
      containOtherCharacter:(NSString *)containOtherCharacter
        firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;
//判断emoji
+ (BOOL)validateContainsEmoji:(NSString *)string;



// 机型
+ (NSString *)iPhoneType;

//是否为iphonex
+ (BOOL)isiPhoneX;

@end

NS_ASSUME_NONNULL_END
