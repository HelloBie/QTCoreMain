//
//  QTSegmentConfig.m
//  QTCoreMain
//
//  Created by MasterBie on 2019/8/27.
//  Copyright © 2019 MasterBie. All rights reserved.
//

#import "QTSegmentConfig.h"


@implementation QTSegmentConfig

+ (instancetype)defaultSegmentConfig {
    
    QTSegmentConfig *_defaultConfig = [[QTSegmentConfig alloc] init];
    _defaultConfig.itemNormalColor = [UIColor grayColor];
    _defaultConfig.itemSelectedColor = LightMainColor;
    _defaultConfig.itemFont = [UIFont systemFontOfSize:12];
    _defaultConfig.indicatorColor = LightMainColor;
    _defaultConfig.indicatorHeight = 2;
    _defaultConfig.lineBottomHeight = 0.75;
    _defaultConfig.isShowLineBottom = NO;
    _defaultConfig.isScroll = NO;
    return _defaultConfig;
}


@end
