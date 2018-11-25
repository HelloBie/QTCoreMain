//
//  UIImageView+Setup.h
//  QTCore
//
//  Created by bqt on 2017/7/19.
//  Copyright © 2017年 bambootech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImageView+WebCache.h>
@interface UIImageView (Setup)
- (UIImageView *(^)(UIImage *image))set_image;
- (UIImageView *(^)(NSArray *animationImages))set_animationImages;
- (UIImageView *(^)(NSString *url, NSString *placehold))sd_setimag;

- (UIImageView *(^)(UIColor *backgroundColor))   set_backgroundColor;
- (UIImageView *(^)(UIColor *borderColor))       set_borderColor;
- (UIImageView *(^)(CGRect frame))               set_frame;
- (UIImageView *(^)(UIView *superView))          set_superView;
- (UIImageView *(^)(CGFloat borderwidth))        set_borderWidth;
- (UIImageView *(^)(CGFloat radius))             set_radius;
- (UIImageView *(^)(BOOL clipsToBounds))         set_clipsToBounds;
- (UIImageView *(^)(CGPoint center))             set_center;
- (UIImageView *(^)(CGAffineTransform transForm))set_transForm;
- (UIImageView *(^)(BOOL hidden))                set_hidden;
- (UIImageView *(^)(BOOL userInteractionEnabled))set_userInteractionEnabled;

@end

