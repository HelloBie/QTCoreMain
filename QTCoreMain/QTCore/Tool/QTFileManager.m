//
//  QTFileManager.m
//  QTCoreMain
//
//  Created by MasterBie on 2019/8/4.
//  Copyright © 2019 MasterBie. All rights reserved.
//

#import "QTFileManager.h"

@implementation QTFileManager

// 生成Document下的文件路径
+ (NSString *)pathInDocumentsWithFileName:(NSString *)filename
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    return [NSString stringWithFormat:@"%@/%@",path,filename];
}

// 生成Library下的文件路径
+ (NSString *)pathInLibraryWithFileName:(NSString *)filename
{
    NSString *path =  [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];

    return [NSString stringWithFormat:@"%@/%@",path,filename];
}

// 生成Caches下的文件路径
+ (NSString *)pathInCachesWithFileName:(NSString *)filename
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    return [NSString stringWithFormat:@"%@/%@",path,filename];
}

// 生成Temp下的文件路径
+ (NSString *)pathInTempWithFileName:(NSString *)filename
{
    NSString *tmpDir = NSTemporaryDirectory();
      return [NSString stringWithFormat:@"%@/%@",tmpDir,filename];
}



@end
