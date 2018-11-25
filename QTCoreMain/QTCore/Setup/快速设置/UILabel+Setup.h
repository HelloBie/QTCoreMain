//
//  UILabel+Setup.h
//  QTCore
//
//  Created by bqt on 2017/7/20.
//  Copyright © 2017年 bambootech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Setup)
- (UILabel *(^)(NSString *text))set_text;
- (UILabel *(^)(UIColor *textColor))set_textColor;
- (UILabel *(^)(UIFont *font))set_font;
- (UILabel *(^)(NSTextAlignment textAlignment))set_textAlignment;
- (UILabel *(^)(NSInteger numberOfline))set_numberOfLine;

- (UILabel *(^)(UIColor *backgroundColor))   set_backgroundColor;
- (UILabel *(^)(UIColor *borderColor))       set_borderColor;
- (UILabel *(^)(CGRect frame))               set_frame;
- (UILabel *(^)(UIView *superView))          set_superView;
- (UILabel *(^)(CGFloat borderwidth))        set_borderWidth;
- (UILabel *(^)(CGFloat radius))             set_radius;
- (UILabel *(^)(BOOL clipsToBounds))         set_clipsToBounds;
- (UILabel *(^)(CGPoint center))             set_center;
- (UILabel *(^)(CGAffineTransform transForm))set_transForm;
- (UILabel *(^)(BOOL hidden))                set_hidden;
- (UILabel *(^)(BOOL userInteractionEnabled))set_userInteractionEnabled;
@end
