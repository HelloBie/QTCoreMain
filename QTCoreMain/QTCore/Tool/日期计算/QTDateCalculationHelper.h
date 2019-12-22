//
//  QTDateCalculationHelper.h
//  QTCoreMain
//
//  Created by MasterBie on 2019/8/29.
//  Copyright © 2019 MasterBie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QTDateCalculationHelper : NSObject
// 获取现在日期 0时0分0秒,因为计算周期按照自然日
+ (NSString *)getNowdate;

// 获取现在时间
+ (NSString *)getNowTime;

// 计算与今天相隔几天,正数今天之后,负数今天之前
+ (NSInteger)daysWithTime:(NSString *)time;

// 计算两个日期相差几天
+ (NSInteger)getDaysAfterTime:(NSString *)firstTime  beforeTime:(NSString *)lastTime;

//获取当前日期星期几
+ (NSInteger)getWeekNumberWithTime:(NSString *)time;

//日期计算
+ (NSString *)getTimeAfter1WeekWithBeginTime:(NSString *)beginTime; //返回n周后的日期
+ (NSString *)getTimeAfter1MonthWithBeginTime:(NSString *)beginTime; //返回n周后的日期
+ (NSString *)getTimeWithBeginTime:(NSString *)beginTime withMonths:(NSInteger) months; //返回n月后的日期
+ (NSString *)getTimeWithBeginTime:(NSString *)beginTime withYears:(NSInteger) Years; //返回n年后的日期
+ (NSString *)getTimeWithBeginTime:(NSString *)beginTime withDays:(NSInteger) days;    // 返回n天后的日期

//将时间文字转换成多久之前文字
- (NSString *)formatDateBeforeWithStr:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
