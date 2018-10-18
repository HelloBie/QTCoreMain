//
//  UILabel+Setup.m
//  QTCore
//
//  Created by bqt on 2017/7/20.
//  Copyright © 2017年 bambootech. All rights reserved.
//

#import "UILabel+Setup.h"

@implementation UILabel (Setup)
- (UILabel *(^)(NSString *text))set_text
{

    return ^(NSString *text){
        self.text = text;
        return self;
    };
}

- (UILabel *(^)(UIColor *textColor))set_textColor
{
    return ^(UIColor *textColor)
    {
        self.textColor = textColor;
        return self;
    };
}

- (UILabel *(^)(UIFont *font))set_font
{
    return ^(UIFont *font){
        self.font = font;
        return self;
    };
}

- (UILabel *(^)(NSTextAlignment textAlignment))set_textAlignment
{
    return ^(NSTextAlignment textAlignment){
        self.textAlignment = textAlignment;
        return self;
    };
}

- (UILabel *(^)(NSInteger numberOfline))set_numberOfLine
{
    return ^(NSInteger numberOfLine){
        self.numberOfLines = numberOfLine;
        return self;
    };
}
@end
