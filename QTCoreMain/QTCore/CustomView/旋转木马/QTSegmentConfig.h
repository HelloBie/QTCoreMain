//
//  QTSegmentConfig.h
//  QTCoreMain
//
//  Created by MasterBie on 2019/8/27.
//  Copyright © 2019 MasterBie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface QTSegmentConfig : NSObject

+ (instancetype)defaultSegmentConfig;

// 选项卡选中颜色
@property (nonatomic, strong) UIColor *itemSelectedColor;

// 选项卡一般颜色
@property (nonatomic, strong) UIColor *itemNormalColor;

// 选项卡字体
@property (nonatomic, strong) UIFont *itemFont;

// 指示器颜色
@property (nonatomic, strong) UIColor *indicatorColor;

// 指示器高度
@property (nonatomic, assign) CGFloat indicatorHeight;
// 是否显示下边线
@property (nonatomic, assign) BOOL isShowLineBottom;
// 下边线的高度
@property (nonatomic, assign) CGFloat lineBottomHeight;

@property (nonatomic, assign) BOOL isScroll;
@end


