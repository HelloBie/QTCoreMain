//
//  UIImage+Tool.m
//  QTCore
//
//  Created by bqt on 2017/7/25.
//  Copyright © 2017年 bambootech. All rights reserved.
//

#import "UIImage+Tool.h"

@implementation UIImage (Tool)

//压缩图片
- (UIImage *)scaledToWidth:(CGFloat)newWidth
{
    CGFloat newHeight = newWidth * self.size.height/self.size.width;
    CGSize newSize = CGSizeMake(newWidth, newHeight);
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    // Tell the old image to draw in this new context, with the desired
    // new size
    
    [self drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    // End the context
    UIGraphicsEndImageContext();
    // Return the new image.
    return newImage;
}

#pragma mark 保存图片到document
- (NSString *)saveImageWithName:(NSString *)imageName
{
    NSData* imageData = UIImagePNGRepresentation(self);
    return [self saveData:imageData WithName:imageName];
}

- (NSString *)saveData:(NSData *)data WithName:(NSString *)imageName
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsDirectory = [paths objectAtIndex:0];
    // Now we get the full path to the file
    NSString* fullPathToFile = [documentsDirectory stringByAppendingPathComponent:imageName];
    // and then we write it out
    [data writeToFile:fullPathToFile atomically:NO];
    return [NSString stringWithFormat:@"%@/%@",fullPathToFile,imageName];
}


+ (void)savePhotosAlbum:(UIImage *)image {
    UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
}
+(void)deleteFileFromPath:(NSString *)path{
    NSFileManager *defaultManager;
    defaultManager = [NSFileManager defaultManager];
    [defaultManager removeItemAtPath:path error:nil];
}
+(UIImage *)imageFromString:(NSString *)string inRect:(CGRect)rect {
    UIImage *image = [UIImage imageWithContentsOfFile:string];
    CGImageRef sourceImageRef = [image CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, rect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    return newImage;
}
@end
