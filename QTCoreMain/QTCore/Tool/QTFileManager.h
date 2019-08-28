//
//  QTFileManager.h
//  QTCoreMain
//
//  Created by MasterBie on 2019/8/4.
//  Copyright © 2019 MasterBie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QTFileManager : NSObject


// 生成Document下的文件路径
+ (NSString *)pathInDocumentsWithFileName:(NSString *)filename;

// 生成Library下的文件路径
+ (NSString *)pathInLibraryWithFileName:(NSString *)filename;

// 生成Caches下的文件路径
+ (NSString *)pathInCachesWithFileName:(NSString *)filename;

// 生成Temp下的文件路径
+ (NSString *)pathInTempWithFileName:(NSString *)filename;
@end

NS_ASSUME_NONNULL_END
