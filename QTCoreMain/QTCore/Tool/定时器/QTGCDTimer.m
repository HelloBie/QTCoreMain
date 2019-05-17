//
//  QTGCDTimer.m
//  runtimeHelper
//
//  Created by MasterBie on 2019/5/14.
//  Copyright © 2019 MasterBie. All rights reserved.
//

#import "QTGCDTimer.h"

@interface QTGCDTimer ()
@property(nonatomic,strong)dispatch_source_t timer;
@end

@implementation QTGCDTimer
+ (QTGCDTimer *)timerWithTimeAfter:(NSTimeInterval)timeAfter intrval:(NSTimeInterval)intrval repeats:(BOOL)repeats async:(BOOL)async block:(void (^)(void))block
{
    if (!block) return nil;
    
    QTGCDTimer *gcdtime = [QTGCDTimer new];
    
    //队列
    dispatch_queue_t queue = async ? dispatch_get_global_queue(0, 0) : dispatch_get_main_queue();
    
   gcdtime.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(gcdtime.timer, dispatch_time(DISPATCH_TIME_NOW, timeAfter * NSEC_PER_SEC), intrval * NSEC_PER_SEC, 0);
    
    dispatch_source_set_event_handler(gcdtime.timer, ^{
        block();
        if (!repeats) { // 不重复的任务
            [gcdtime stop];
        }
    });
    dispatch_resume(gcdtime.timer);
    return gcdtime;
    
}

- (void)stop
{
    
    dispatch_source_cancel(self.timer);
    
}


@end
