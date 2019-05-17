//
//  QTGCDTimer.h
//  runtimeHelper
//
//  Created by MasterBie on 2019/5/14.
//  Copyright © 2019 MasterBie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QTGCDTimer : NSObject
+ (QTGCDTimer *)timerWithTimeAfter:(NSTimeInterval)timeAfter intrval:(NSTimeInterval)intrval repeats:(BOOL)repeats async:(BOOL)async block:(void (^)(void))block;
- (void)stop;
@end

NS_ASSUME_NONNULL_END
