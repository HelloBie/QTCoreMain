//
//  UIButton+Setup.h
//  QTCore
//
//  Created by bqt on 2017/7/20.
//  Copyright © 2017年 bambootech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Setup)

- (UIButton *(^)(NSString *title))set_title;
- (UIButton *(^)(UIColor *titleColor))set_titleColor;
- (UIButton *(^)(NSString * backgroundImage))set_backgroundImage;
- (UIButton *(^)(UIImage * image))set_image;
- (UIButton *(^)(UIEdgeInsets titleEdgeInsets))set_titleEdgeInsets;
- (UIButton *(^)(UIEdgeInsets imageEdgeInsets))set_imageEdgeInsets;
- (UIButton *(^)(CGFloat spacing))set_textDown;

- (UIButton *(^)(UIColor *backgroundColor))   set_backgroundColor;
- (UIButton *(^)(UIColor *borderColor))       set_borderColor;
- (UIButton *(^)(CGRect frame))               set_frame;
- (UIButton *(^)(UIView *superView))          set_superView;
- (UIButton *(^)(CGFloat borderwidth))        set_borderWidth;
- (UIButton *(^)(CGFloat radius))             set_radius;
- (UIButton *(^)(BOOL clipsToBounds))         set_clipsToBounds;
- (UIButton *(^)(CGPoint center))             set_center;
- (UIButton *(^)(CGAffineTransform transForm))set_transForm;
- (UIButton *(^)(BOOL hidden))                set_hidden;
- (UIButton *(^)(BOOL userInteractionEnabled))set_userInteractionEnabled;
@end
