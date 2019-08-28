//
//  QTSegmentContentVC.h
//  QTCoreMain
//
//  Created by MasterBie on 2019/8/27.
//  Copyright © 2019 MasterBie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QTSegmentBar.h"
NS_ASSUME_NONNULL_BEGIN
@class QTSegmentContentVC;
@protocol QTSegmentContentVCDelegate<NSObject>
@optional
- (void)segmentContentVC:(QTSegmentContentVC *)segmentContentVC didSelectIndex:(NSInteger)selectIndex fromIndex: (NSInteger)fromIndex isclick:(BOOL)isclick;
@end


@interface QTSegmentContentVC : UIViewController
@property (nonatomic, strong) UIScrollView *contentScrollView;

/** 选项卡 */
@property (nonatomic, strong) QTSegmentBar *segmentBar;

@property (nonatomic, weak) id <QTSegmentContentVCDelegate> delegate;



- (void)setUpWith: (NSArray <NSString *>*)items andChildVCs: (NSArray <UIViewController *>*)childVCs;
- (void)showChildVC: (NSInteger)selectIndex isAnimated: (BOOL)isAnimated;
@end
NS_ASSUME_NONNULL_END
