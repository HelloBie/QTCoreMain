//
//  QTBluetoothHelper.h
//  QTCoreMain
//
//  Created by MasterBie on 2019/7/25.
//  Copyright © 2019 MasterBie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN



@interface QTBluetoothHelper : NSObject
+ (QTBluetoothHelper *)shareHelper;

- (void)startSearchDevice:(void (^)(NSMutableDictionary *findDevicesDic))findDevices;


@end

NS_ASSUME_NONNULL_END
