//
//  UIView+Frame.h
//  Source
//
//  Created by MD101 on 16/1/25.
//  Copyright © 2016年 yaocheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
/** view底部的距离 */
@property (nonatomic, assign) CGFloat bottom;
/** view右侧的距离 */
@property (nonatomic, assign) CGFloat right;

@end
