//
//  QTSegmentBar.h
//  QTCoreMain
//
//  Created by MasterBie on 2019/8/27.
//  Copyright © 2019 MasterBie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QTSegmentConfig.h"

NS_ASSUME_NONNULL_BEGIN



@class QTSegmentBar;
@protocol QTSegmentBarDelegate <NSObject>
@optional

- (void)segmentBar:(QTSegmentBar *)setmentBar didSelectIndex:(NSInteger)selectIndex fromIndex: (NSInteger)fromIndex isclick:(BOOL)isclick;

@end


@interface QTSegmentBar : UIView

@property (nonatomic, strong) NSMutableArray <UIButton *>*itemBtns;

/**
 快速创建segmentBar
 
 @return segmentBar
 */
+ (instancetype)segmentBarWithFrame: (CGRect)frame;


/**
 根据数据源进行初始化
 
 @param items 数据源内容
 */
- (void)setUpWithDataSources:(NSArray <NSString *>*)items;


/**
 设置代理, 用于内部的点击事件外传
 */
@property (nonatomic, weak) id<QTSegmentBarDelegate> delegate;
/**
 未选中颜色
 */
@property (nonatomic, strong)UIColor *itemNormalColor;
/**
 选中颜色
 */
@property (nonatomic, strong)UIColor *itemSelectedColor;
/**
 按钮字体
 */
@property (nonatomic, strong)UIFont *titleLabelFont;

/**
 用于外界设置选中索引, 内部需要展示响应动效
 */
@property (nonatomic, assign) NSInteger selectIndex;

/**
 下边分割线
 */
@property (nonatomic, strong) UIView *lineBottom;

@property (nonatomic, assign) BOOL isCenterShow;

/**
 用于外界scorllview滚动, 内部indicator需要展示响应动效
 */
@property (nonatomic, assign) CGFloat indicatorProcess;

- (void)updateWithSegmentConfig: (void(^)(QTSegmentConfig *config))configBlock;


- (void)indicatorViewChangeFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex progress:(CGFloat)progress;

@end


NS_ASSUME_NONNULL_END
