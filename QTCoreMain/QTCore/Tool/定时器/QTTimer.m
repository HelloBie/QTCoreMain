//
//  QTTimer.m
//  runtimeHelper
//
//  Created by MasterBie on 2019/5/11.
//  Copyright © 2019 MasterBie. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "QTTimer.h"


@interface QTTimerProxy : NSProxy
@property(nonatomic,weak)id target;
@end
@implementation QTTimerProxy
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    [invocation invokeWithTarget:self.target];
}
@end

@interface QTTimer()
@property(nonatomic,strong)NSTimer *timer;
@end

@implementation QTTimer
+ (QTTimer *)timerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo
{
    QTTimer *qttime = [QTTimer new];
    QTTimerProxy *pro = [QTTimerProxy alloc];
    pro.target = aTarget;
    qttime.timer = [NSTimer timerWithTimeInterval:ti target:pro selector:aSelector userInfo:userInfo repeats:yesOrNo];
    [qttime.timer setFireDate:[NSDate distantFuture]];
    [[NSRunLoop currentRunLoop] addTimer:qttime.timer forMode:NSRunLoopCommonModes];
    
    return qttime;
}

//开始
- (void)start
{
    [self.timer setFireDate:[NSDate distantPast]];
}

//暂停
-(void)suspend;
{
    [self.timer setFireDate:[NSDate distantFuture]];
}

//停止
- (void)stop
{
    [self.timer invalidate];
}

-(void)dealloc
{
    [self.timer invalidate];
  
}

@end
