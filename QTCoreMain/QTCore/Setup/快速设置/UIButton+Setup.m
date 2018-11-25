//
//  UIButton+Setup.m
//  QTCore
//
//  Created by bqt on 2017/7/20.
//  Copyright © 2017年 bambootech. All rights reserved.
//

#import "UIButton+Setup.h"

@implementation UIButton (Setup)
- (UIButton *(^)(NSString *title))set_title
{
    return ^(NSString *title){
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(UIColor *titleColor))set_titleColor
{
    return ^(UIColor *titleColor){
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(NSString * backgroundImage))set_backgroundImage
{
    return ^(NSString *backgroundImage){
        if ([backgroundImage isKindOfClass:[UIImage class]]) {
                [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];
        }else
            if ([backgroundImage isKindOfClass:[NSString class]]) {
                [self setBackgroundImage:[UIImage imageNamed:backgroundImage] forState:UIControlStateNormal];
            }
    
        return self;
    };
}

- (UIButton *(^)(UIImage * image))set_image
{
    return ^(UIImage *image){
        [self setImage:image forState:UIControlStateNormal];
        return self;
    };
    
}

- (UIButton *(^)(UIEdgeInsets titleEdgeInsets))set_titleEdgeInsets
{
    return ^(UIEdgeInsets titleEdgeInsets)
    {
        
        self.titleEdgeInsets = titleEdgeInsets;
        return self;
    };
}


- (UIButton *(^)(UIEdgeInsets imageEdgeInsets))set_imageEdgeInsets
{
    return ^(UIEdgeInsets imageEdgeInsets){
        self.imageEdgeInsets = imageEdgeInsets;
        return self;
    };
}

- (UIButton *(^)(CGFloat spacing))set_textDown
{
    return ^(CGFloat spacing){

        CGSize imageSize = self.imageView.frame.size;
        CGSize titleSize = self.titleLabel.frame.size;
        CGSize textSize = [self.titleLabel.text sizeWithFont:self.titleLabel.font];
        CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
        if (titleSize.width + 0.5 < frameSize.width) {
            titleSize.width = frameSize.width;
        }
        CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
        self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
        self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height), 0);
 
        
        return self;
    };
}
@end
