//
//  QTDateCalculationHelper.m
//  QTCoreMain
//
//  Created by MasterBie on 2019/8/29.
//  Copyright © 2019 MasterBie. All rights reserved.
//

#import "QTDateCalculationHelper.h"

@implementation QTDateCalculationHelper
+ (NSString *)getNowdate
{
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyyMMdd 000000"];//根据自己的需求定义格式
    formater .timeZone = [NSTimeZone systemTimeZone];
    NSDate* now = [NSDate date];
    
    return [formater stringFromDate:now];
}


+ (NSString *)getNowTime
{
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyyMMdd HHmmss"];//根据自己的需求定义格式
    formater .timeZone = [NSTimeZone systemTimeZone];
    NSDate* now = [NSDate date];
    
    return [formater stringFromDate:now];
}

// 计算两个日期相差几天
+ (NSInteger)getDaysAfterTime:(NSString *)firstTime  beforeTime:(NSString *)lastTime
{
    //    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    //    formater .timeZone = [NSTimeZone systemTimeZone];
    //    [formater setDateFormat:@"yyyyMMdd HHmmss"];//根据自己的需求定义格式
    //    NSDate* startDate = [formater dateFromString:firstTime];
    //    NSDate* endDate = [formater dateFromString:lastTime];
    //    NSTimeInterval time = [endDate timeIntervalSinceDate:startDate];
    //    CGFloat f = time / 86400.0;
    //
    //    return [f inter];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMdd HHmmss"];
    NSDate *startDate = [dateFormatter dateFromString:firstTime];
    NSDate *endDate = [dateFormatter dateFromString:lastTime];
    //利用NSCalendar比较日期的差异
    NSCalendar *calendar = [NSCalendar currentCalendar];
    /**
     * 要比较的时间单位,常用如下,可以同时传:
     * NSCalendarUnitDay : 天
     * NSCalendarUnitYear : 年
     * NSCalendarUnitMonth : 月
     * NSCalendarUnitHour : 时
     * NSCalendarUnitMinute : 分
     * NSCalendarUnitSecond : 秒
     */
    NSCalendarUnit unit = NSCalendarUnitDay;//只比较天数差异
    //比较的结果是NSDateComponents类对象
    NSDateComponents *delta = [calendar components:unit fromDate:startDate toDate:endDate options:0];
    
    return delta.day;
}

//获取当前日期星期几
+ (NSInteger)getWeekNumberWithTime:(NSString *)time
{
    
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    formater .timeZone = [NSTimeZone systemTimeZone];
    [formater setDateFormat:@"yyyyMMdd HHmmss"];//根据自己的需求定义格式
    // formater.timeZone = [NSTimeZone systemTimeZone];
    NSDate *inputDate = [formater dateFromString:time];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return theComponents.weekday;
}

//日期计算
+ (NSString *)getTimeAfter1WeekWithBeginTime:(NSString *)beginTime //返回1周后的日期
{
    if ([QTDateCalculationHelper getWeekNumberWithTime:beginTime] == 2) {
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        format.dateFormat = @"yyyyMMdd HHmmss";
        format.timeZone = [NSTimeZone systemTimeZone];
        NSDate *beginDate = [format dateFromString:beginTime];
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *comps = nil;
        comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:beginDate];
        NSDateComponents *adcomps = [[NSDateComponents alloc] init];
        
        [adcomps setWeekdayOrdinal:1];
        NSDate *start = [calendar dateByAddingComponents:adcomps toDate:beginDate options:0];
        
        return [format stringFromDate:start];
    }else
    {
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        format.dateFormat = @"yyyyMMdd HHmmss";
        format.timeZone = [NSTimeZone systemTimeZone];
        NSDate *beginDate = [format dateFromString:beginTime];
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *comps = nil;
        comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:beginDate];
        NSDateComponents *adcomps = [[NSDateComponents alloc] init];
        
        [adcomps setDay:9 - [QTDateCalculationHelper getWeekNumberWithTime:beginTime]];
        NSDate *start = [calendar dateByAddingComponents:adcomps toDate:beginDate options:0];
        
        return [format stringFromDate:start];
    }
    
    
}

+ (NSString *)getTimeAfter1MonthWithBeginTime:(NSString *)beginTime
{
    NSString *time = [NSString stringWithFormat:@"%@01 000000",[beginTime substringToIndex:6]];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyyMMdd HHmmss";
    format.timeZone = [NSTimeZone systemTimeZone];
    NSDate *beginDate = [format dateFromString:time];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = nil;
    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:beginDate];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    
    [adcomps setMonth:1];
    NSDate *start = [calendar dateByAddingComponents:adcomps toDate:beginDate options:0];
    
    return [format stringFromDate:start];
    
}

+ (NSString *)getTimeWithBeginTime:(NSString *)beginTime withYears:(NSInteger) Years //返回n年后的日期
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyyMMdd HHmmss";
    format.timeZone = [NSTimeZone systemTimeZone];
    NSDate *beginDate = [format dateFromString:beginTime];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = nil;
    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:beginDate];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    
    [adcomps setYear:Years];
    NSDate *start = [calendar dateByAddingComponents:adcomps toDate:beginDate options:0];
    
    return [format stringFromDate:start];
}
+ (NSString *)getTimeWithBeginTime:(NSString *)beginTime withMonths:(NSInteger) months //返回n月后的日期
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyyMMdd HHmmss";
    format.timeZone = [NSTimeZone systemTimeZone];
    NSDate *beginDate = [format dateFromString:beginTime];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = nil;
    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:beginDate];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    
    [adcomps setMonth:months];
    NSDate *start = [calendar dateByAddingComponents:adcomps toDate:beginDate options:0];
    
    return [format stringFromDate:start];
}
+ (NSString *)getTimeWithBeginTime:(NSString *)beginTime withDays:(NSInteger) days    // 返回n天后的日期
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyyMMdd HHmmss";
    format.timeZone = [NSTimeZone systemTimeZone];
    NSDate *beginDate = [format dateFromString:beginTime];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = nil;
    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:beginDate];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    
    [adcomps setDay:days];
    NSDate *start = [calendar dateByAddingComponents:adcomps toDate:beginDate options:0];
    return [format stringFromDate:start];
}



// 计算与今天相隔几天,正数今天之后,负数今天之前
+ (NSInteger)daysWithTime:(NSString *)time
{
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyyMMdd HHmmss"];//根据自己的需求定义格式
    NSDate* startDate = [NSDate date];
    NSDate* endDate = [formater dateFromString:time];
    NSTimeInterval times = [endDate timeIntervalSinceDate:startDate];
    
    
    return times / 86400;
    
}


- (NSString *)formatDateBeforeWithStr:(NSString *)str{
    
    NSString *_createDate = @"";
    NSDate *toDate = [self dateWithString:str format:@"yyyyMMdd HHmmss"];
    NSCalendar *calender =  [NSCalendar currentCalendar];
    NSDateComponents *dateComponents =  [calender components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute fromDate:toDate toDate:[NSDate date] options:NSCalendarWrapComponents];
    if (dateComponents.year > 0) {
        _createDate = [NSString stringWithFormat:@"%ld年前",dateComponents.year];
    }else if (dateComponents.month > 0){
        _createDate = [NSString stringWithFormat:@"%ld月前",dateComponents.month];
    }else if (dateComponents.day > 0){
        _createDate = [NSString stringWithFormat:@"%ld天前",dateComponents.day];
    }else if (dateComponents.hour > 0){
        _createDate = [NSString stringWithFormat:@"%ld小时前",dateComponents.hour];
    }else if (dateComponents.minute > 0){
        _createDate = [NSString stringWithFormat:@"%ld分钟前",dateComponents.minute];
    }else{
        _createDate = [NSString stringWithFormat:@"1分钟前"];
    }
    return _createDate;
}

- (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter dateFromString:dateString];
}
@end
