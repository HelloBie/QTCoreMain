//
//  UIView+Setup.h
//  QTCore
//
//  Created by bqt on 2017/7/19.
//  Copyright © 2017年 bambootech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Setup)
/**
 *  location
 */
@property(nonatomic, assign) CGPoint origin;
@property(nonatomic, assign) CGFloat top;
@property(nonatomic, assign) CGFloat left;
@property(nonatomic, assign) CGFloat bottom;
@property(nonatomic, assign) CGFloat right;

/**
 *  center
 */
@property(nonatomic, assign) CGFloat centerY;
@property(nonatomic, assign) CGFloat centerX;

/**
 *  size
 */
@property(nonatomic, assign) CGFloat x;
@property(nonatomic, assign) CGFloat y;
@property(nonatomic, assign) CGSize size;
@property(nonatomic, assign) CGFloat height;
@property(nonatomic, assign) CGFloat width;

/**
 *  Other Origin
 */
@property(nonatomic, assign, readonly) CGPoint bottomLeft;
@property(nonatomic, assign, readonly) CGPoint bottomRight;
@property(nonatomic, assign, readonly) CGPoint topRight;

- (UIImage *)saveImageWithScale:(float)scale;
- (UIView *(^)(UIColor *backgroundColor))   set_backgroundColor;
- (UIView *(^)(UIColor *borderColor))       set_borderColor;
- (UIView *(^)(CGRect frame))               set_frame;
- (UIView *(^)(UIView *superView))          set_superView;
- (UIView *(^)(CGFloat borderwidth))        set_borderWidth;
- (UIView *(^)(CGFloat radius))             set_radius;
- (UIView *(^)(BOOL clipsToBounds))         set_clipsToBounds;
- (UIView *(^)(CGPoint center))             set_center;
- (UIView *(^)(CGAffineTransform transForm))set_transForm;
- (UIView *(^)(BOOL hidden))                set_hidden;
- (UIView *(^)(BOOL userInteractionEnabled))set_userInteractionEnabled;
- (UIColor *)colorOfPoint:(CGPoint)point;
- (NSArray *)getRGBWithColor:(UIColor *)color;

@end
