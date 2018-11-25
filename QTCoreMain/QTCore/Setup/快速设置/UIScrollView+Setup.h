//
//  UIScrollView+Setup.h
//  QTCore
//
//  Created by bqt on 2017/7/20.
//  Copyright © 2017年 bambootech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Setup)
- (UIScrollView *(^)(id delegate))set_delegate;
- (UIScrollView *(^)(CGSize size))set_contentSize;
- (UIScrollView *(^)(CGPoint contentOffset, BOOL animated))set_contentOffset;
- (UIScrollView *(^)(UIEdgeInsets contentInset))set_contentInset;
- (UIScrollView *(^)(BOOL bounces))set_bounces;
- (UIScrollView *(^)(BOOL alwaysBounceVertical))set_alwaysBounceVertical;
- (UIScrollView *(^)(BOOL alwaysBounceHorizontal))set_alwaysBounceHorizontal;
- (UIScrollView *(^)(CGFloat minimumZoomScale))set_minimumZoomScale;
- (UIScrollView *(^)(CGFloat maximumZoomScale))set_maximumZoomScale;

- (UIScrollView *(^)(UIColor *backgroundColor))   set_backgroundColor;
- (UIScrollView *(^)(UIColor *borderColor))       set_borderColor;
- (UIScrollView *(^)(CGRect frame))               set_frame;
- (UIScrollView *(^)(UIView *superView))          set_superView;
- (UIScrollView *(^)(CGFloat borderwidth))        set_borderWidth;
- (UIScrollView *(^)(CGFloat radius))             set_radius;
- (UIScrollView *(^)(BOOL clipsToBounds))         set_clipsToBounds;
- (UIScrollView *(^)(CGPoint center))             set_center;
- (UIScrollView *(^)(CGAffineTransform transForm))set_transForm;
- (UIScrollView *(^)(BOOL hidden))                set_hidden;
- (UIScrollView *(^)(BOOL userInteractionEnabled))set_userInteractionEnabled;
@end
