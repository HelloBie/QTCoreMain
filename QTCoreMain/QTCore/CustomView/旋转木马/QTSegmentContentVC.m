//
//  QTSegmentContentVC.m
//  QTCoreMain
//
//  Created by MasterBie on 2019/8/27.
//  Copyright © 2019 MasterBie. All rights reserved.
//

#import "QTSegmentContentVC.h"

#import "QTSegmentScrollView.h"
#import "UIView+Setup.h"
#define kSegmentBarHeight 44

@interface QTSegmentContentVC () <QTSegmentBarDelegate, UIScrollViewDelegate>

/** 内容视图 */

@end

@implementation QTSegmentContentVC
{
    BOOL isFromClick;
}
- (QTSegmentBar *)segmentBar {
    if (!_segmentBar) {
        CGRect frame = CGRectMake(0, 0, self.view.bounds.size.width, 0);
        QTSegmentBar *segmentBar = [QTSegmentBar segmentBarWithFrame:frame];
        segmentBar.multipleTouchEnabled = NO;
        segmentBar.exclusiveTouch = YES;
        segmentBar.backgroundColor = [UIColor whiteColor];
        segmentBar.delegate = self;
        [self.view addSubview:segmentBar];
        _segmentBar = segmentBar;
    }
    return _segmentBar;
}


- (UIScrollView *)contentScrollView {
    if (!_contentScrollView) {
        
        CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 0);
        UIScrollView *contentScrollView = [[UIScrollView alloc] initWithFrame:frame];
        contentScrollView.delegate = self;
        contentScrollView.pagingEnabled = YES;
        contentScrollView.showsHorizontalScrollIndicator = NO;
        contentScrollView.scrollsToTop = YES;
        [self.view addSubview:contentScrollView];
        _contentScrollView = contentScrollView;
    }
    return _contentScrollView;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.multipleTouchEnabled = NO;
    self.view.exclusiveTouch = YES;
}

- (void)setUpWith: (NSArray <NSString *>*)items andChildVCs: (NSArray <UIViewController *>*)childVCs {
    
    NSAssert(items.count == childVCs.count && items.count != 0, @"应该保证, 选项个数和子控制器个数一致, 并且不为空!");
    
    [self.childViewControllers makeObjectsPerformSelector:@selector(removeFromParentViewController)];
    
    for (UIViewController *vc in childVCs) {
        
        // 注意, 一定要添加成子控制器, 因为后期涉及到事件传递, 和父子控制器链条遍历
        [self addChildViewController:vc];
    }
    
    [self.segmentBar setUpWithDataSources:items];
    
    self.segmentBar.selectIndex = 0;
    
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    
    UIViewController *vc = self.childViewControllers.firstObject;
    
    vc.view.frame = CGRectMake(self.contentScrollView.frame.size.width * 1, 0, self.contentScrollView.frame.size.width, self.contentScrollView.frame.size.height);
    
    // 设置 滚动区域
    [self showChildVC:self.segmentBar.selectIndex isAnimated:NO];
    
    // 设置内容视图大小
    self.contentScrollView.contentSize = CGSizeMake(self.contentScrollView.bounds.size.width * self.childViewControllers.count, 0);
    
    NSLog(@"%f",self.contentScrollView.contentSize.width);
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    CGFloat contentH = 0;
    
    if (self.segmentBar.superview == self.view) {
        
        CGRect segBarFrame = CGRectMake(0, 0, self.view.bounds.size.width, kSegmentBarHeight);
        
        self.segmentBar.frame = segBarFrame;
        
        contentH = kSegmentBarHeight;
    }
    
    CGFloat tabH = (self.tabBarController.tabBar.isHidden?0:self.tabBarController.tabBar.height);
    if (@available(iOS 11.0, tvOS 11.0, *)) {
        tabH = 0;
    }
    CGRect contentFrame = CGRectMake(0, contentH, self.view.bounds.size.width, self.view.bounds.size.height - contentH - tabH);
    self.contentScrollView.frame = contentFrame;
}


- (void)showChildVC: (NSInteger)selectIndex isAnimated: (BOOL)isAnimated {
    if (self.contentScrollView.isTracking) {
        return;
    }
    if (self.childViewControllers.count == 0) {
        return;
    }
    UIViewController *vc = self.childViewControllers[selectIndex];
    CGFloat x = self.contentScrollView.bounds.size.width * selectIndex;
    vc.view.frame = (CGRect){{x ,0}, self.contentScrollView.bounds.size};
    [self.contentScrollView addSubview:vc.view];
    // 滚动到相应的位置
    [self.contentScrollView setContentOffset:CGPointMake(x, 0) animated:isAnimated];
}

#pragma mark - FYSegmentBarDelegate

-(void)segmentBar:(QTSegmentBar *)setmentBar didSelectIndex:(NSInteger)selectIndex fromIndex:(NSInteger)fromIndex isclick:(BOOL)isclick
{
    if ([self.delegate respondsToSelector:@selector(segmentContentVC:didSelectIndex:fromIndex:isclick:)]) {
        
        [self.delegate segmentContentVC:self didSelectIndex:selectIndex fromIndex:fromIndex isclick:isclick];
    }
    [self showChildVC:selectIndex isAnimated:ABS(selectIndex - fromIndex) == 1 ];
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / scrollView.bounds.size.width;
    [self setSegmentBarIndex:index];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x / scrollView.bounds.size.width;
    [self setSegmentBarIndex:index];
}

- (void)setSegmentBarIndex:(NSInteger)index{
    self.segmentBar.userInteractionEnabled = YES;
    [self.segmentBar setSelectIndex:index];
    if ([self.delegate respondsToSelector:@selector(segmentContentVC:didSelectIndex:fromIndex:isclick:)]) {
        [self.delegate segmentContentVC:self didSelectIndex:index fromIndex:index isclick:NO];
    }
    [self showChildVC:index isAnimated:YES];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.isDragging || scrollView.isDecelerating) {
        self.segmentBar.userInteractionEnabled = NO;
        CGFloat progress = scrollView.contentOffset.x/scrollView.bounds.size.width;
        NSInteger index = scrollView.contentOffset.x / scrollView.bounds.size.width;
        if (index >= self.segmentBar.itemBtns.count - 1 || index < 0 ) {
            return;
        }
        if (scrollView.contentOffset.x >= self.segmentBar.selectIndex*scrollView.bounds.size.width) {
            [self.segmentBar indicatorViewChangeFromIndex:index toIndex:index+1 progress:progress-index];
            
        }else{
            [self.segmentBar indicatorViewChangeFromIndex:index+1 toIndex:index progress:1 -(progress-index)];
        }
        
    }else{
        self.segmentBar.userInteractionEnabled = YES;
    }
}

@end
