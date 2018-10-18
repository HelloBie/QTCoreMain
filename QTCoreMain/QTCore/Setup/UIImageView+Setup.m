//
//  UIImageView+Setup.m
//  QTCore
//
//  Created by bqt on 2017/7/19.
//  Copyright © 2017年 bambootech. All rights reserved.
//

#import "UIImageView+Setup.h"

@implementation UIImageView (Setup)
- (UIImageView *(^)(UIImage *image))set_image
{
    return ^(UIImage *image)
    {
        [self setImage:image];
        return self;
    };
}

- (UIImageView *(^)(NSArray *animationImages))set_animationImages
{
    return ^(NSArray *animationImages){
        [self setAnimationImages:animationImages];
        return self;
    };
}

- (UIImageView *(^)(NSString *url, NSString *placehold))sd_setimag
{
    return ^(NSString *url, NSString *placehold){
        if (placehold.length) {
            [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:placehold]];
        }else
        {
            [self sd_setImageWithURL:[NSURL URLWithString:url]];
        }
        return self;
    };
}

@end
