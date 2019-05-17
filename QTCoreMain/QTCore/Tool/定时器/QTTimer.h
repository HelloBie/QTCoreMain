//
//  QTTimer.h
//  runtimeHelper
//
//  Created by MasterBie on 2019/5/11.
//  Copyright © 2019 MasterBie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QTTimer : NSObject
// 初始化,开始需要调用statr方法
+ (QTTimer *)timerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

//开始
- (void)start;

//暂停
-(void)suspend;

//停止
- (void)stop;
@end

NS_ASSUME_NONNULL_END
