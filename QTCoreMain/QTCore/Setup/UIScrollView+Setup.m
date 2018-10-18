//
//  UIScrollView+Setup.m
//  QTCore
//
//  Created by bqt on 2017/7/20.
//  Copyright © 2017年 bambootech. All rights reserved.
//

#import "UIScrollView+Setup.h"

@implementation UIScrollView (Setup)

- (UIScrollView *(^)(id delegate))set_delegate
{
    return ^(id delegate){
        self.delegate = delegate;
        return self;
    };
}

- (UIScrollView *(^)(CGSize size))set_contentSize
{
    return ^(CGSize size)
    {
        self.contentSize = size;
     
        return self;
    };
}

- (UIScrollView *(^)(CGPoint contentOffset, BOOL animated))set_contentOffset
{
    return ^(CGPoint contentOffset,BOOL animated){
        [self setContentOffset:contentOffset animated:animated];
        return self;
    };
}

- (UIScrollView *(^)(UIEdgeInsets contentInset))set_contentInset
{
    return ^(UIEdgeInsets contentInset){
        self.contentInset = contentInset;
        return self;
    };
}

- (UIScrollView *(^)(BOOL bounces))set_bounces
{
    return ^(BOOL bounces){
        self.bounces = bounces;
        return self;
        
    };
}

- (UIScrollView *(^)(BOOL alwaysBounceVertical))set_alwaysBounceVertical
{
    return ^(BOOL alwaysBounceVertical){
        self.alwaysBounceVertical = alwaysBounceVertical;
        return self;
    };
}

- (UIScrollView *(^)(BOOL alwaysBounceHorizontal))set_alwaysBounceHorizontal
{
    return ^(BOOL alwaysBounceHorizontal)
    {
        self.alwaysBounceHorizontal = alwaysBounceHorizontal;
        return self;
    };
}

- (UIScrollView *(^)(CGFloat minimumZoomScale))set_minimumZoomScale
{
    return ^(CGFloat minimumZoomScale){
        self.minimumZoomScale = minimumZoomScale;
        return self;
    };
}

- (UIScrollView *(^)(CGFloat maximumZoomScale))set_maximumZoomScale
{
    return ^(CGFloat maximumZoomScale){
        self.maximumZoomScale = maximumZoomScale;
        return self;
    };
}
@end
