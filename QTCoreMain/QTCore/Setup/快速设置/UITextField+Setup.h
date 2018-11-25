//
//  UITextField+Setup.h
//  QTCore
//
//  Created by bqt on 2017/7/19.
//  Copyright © 2017年 bambootech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Setup)
- (UITextField *(^)(UIColor *placeColor))set_placeholdColor;
- (UITextField *(^)(NSString * borderColor))set_text;
- (UITextField *(^)(NSString * placehold))set_placehold;
- (UITextField *(^)(UIColor *textColor))set_textColor;
- (UITextField *(^)(UIFont *font))set_font;
- (UITextField *(^)(UITextAlignment alignment))set_alignment;

- (UITextField *(^)(UIColor *backgroundColor))   set_backgroundColor;
- (UITextField *(^)(UIColor *borderColor))       set_borderColor;
- (UITextField *(^)(CGRect frame))               set_frame;
- (UITextField *(^)(UIView *superView))          set_superView;
- (UITextField *(^)(CGFloat borderwidth))        set_borderWidth;
- (UITextField *(^)(CGFloat radius))             set_radius;
- (UITextField *(^)(BOOL clipsToBounds))         set_clipsToBounds;
- (UITextField *(^)(CGPoint center))             set_center;
- (UITextField *(^)(CGAffineTransform transForm))set_transForm;
- (UITextField *(^)(BOOL hidden))                set_hidden;
- (UITextField *(^)(BOOL userInteractionEnabled))set_userInteractionEnabled;
@end
