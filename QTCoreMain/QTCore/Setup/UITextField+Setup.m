//
//  UITextField+Setup.m
//  QTCore
//
//  Created by bqt on 2017/7/19.
//  Copyright © 2017年 bambootech. All rights reserved.
//

#import "UITextField+Setup.h"

@implementation UITextField (Setup)
- (UITextField *(^)(UIColor *placeColor))set_placeholdColor
{
    return ^(UIColor *placeColor){
            self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName: placeColor}];
        return self;
    };
}

- (UITextField *(^)(NSString * borderColor))set_text
{
    return ^(NSString *text)
    {
        self.text = text;
        return self;
    };
}

- (UITextField *(^)(NSString * placehold))set_placehold
{
    return ^(NSString *placehold)
    {
        self.placeholder = placehold;
        return self;
    };
}

- (UITextField *(^)(UIColor *textColor))set_textColor
{
    return ^(UIColor *textColor)
    {
        self.textColor = textColor;
        return self;
    };
}

- (UITextField *(^)(UIFont *font))set_font
{
    return ^(UIFont *font){
        self.font = font;
        return self;
    };
}

- (UITextField *(^)(UITextAlignment alignment))set_alignment
{
    return ^(UITextAlignment alignment){
        self.textAlignment = alignment;
        return self;
    };
}
@end
