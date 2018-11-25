//
//  UIImage+Tool.h
//  QTCore
//
//  Created by bqt on 2017/7/25.
//  Copyright © 2017年 bambootech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Tool)
- (UIImage *)scaledToWidth:(CGFloat)newWidth;// 压缩
- (NSString *)saveImageWithName:(NSString *)imageName;// 保存到doc
+ (void)savePhotosAlbum:(UIImage *)image; // 保存到相册
+(void)deleteFileFromPath:(NSString *)path; // 根据路径删除文件
+(UIImage *)imageFromString:(NSString *)string inRect:(CGRect)rect;// 根据图片名生成图片并制定大小
@end
