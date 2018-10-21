//
//  QTYDY.m
//  YDY
//
//  Created by MasterBie on 2018/10/21.
//  Copyright © 2018年 MasterBie. All rights reserved.
//

#import "QTYDY.h"
#import "AppDelegate.h"

#define QTYDYWidth  [UIScreen mainScreen].bounds.size.width
#define QTYDYHeight  [UIScreen mainScreen].bounds.size.height

@interface QTYDY ()<UIScrollViewDelegate>
@property(nonatomic,strong)NSMutableArray *imageViews;// 引导页图片数组
@property(nonatomic,strong)UIScrollView *scrollView;
@end


@implementation QTYDY

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (NSMutableArray *)imageViews
{
    if (!_imageViews) {
        
        _imageViews = [NSMutableArray array];
    }
    return _imageViews;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, QTYDYWidth, QTYDYHeight)];
        _scrollView.delegate = self;
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.pagingEnabled = YES;
        _scrollView.contentSize = CGSizeMake(QTYDYWidth * (self.imageViews.count + 1), 0);
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_scrollView];
    }
    return _scrollView;
}

// appdelegate里调用 传图片名字数组,自带版本号判断,侧滑移除,适用于不带按钮的引导页
+ (void)addToWindowWithImageNames:(NSArray *)imageNames;
{
    //根据版本号判断是否需要显示引导页
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSString *appOldVerson = [[NSUserDefaults standardUserDefaults] valueForKey:@"appVersion"];
    
    if (![appVersion isEqualToString:appOldVerson]) {
         QTYDY *qt = [[QTYDY alloc] initWithFrame:CGRectMake(0, 0, QTYDYWidth, QTYDYHeight)];
    
        for (NSString *imgName in imageNames) {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]];
            imageView.contentMode = UIViewContentModeScaleAspectFill;//保证图片比例不被拉伸
            [qt.imageViews addObject:imageView];
        }
        [qt addImageViewToScrollView];
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        [window addSubview:qt];
        
    }
    
   
}

- (void)addImageViewToScrollView
{
    for (int i = 0; i < self.imageViews.count + 1; i++) {
        if (i < self.imageViews.count) {
            UIImageView *imageView = self.imageViews[i];
            imageView.frame = CGRectMake(QTYDYWidth * i, 0, QTYDYWidth, QTYDYHeight);
            [self.scrollView addSubview:imageView];
        }else
        {
            UIView *clearView = [[UIView alloc] initWithFrame:CGRectMake(QTYDYWidth * i, 0, QTYDYWidth, QTYDYHeight)];
            clearView.backgroundColor = [UIColor yellowColor];
            clearView.alpha = 0;
            [self.scrollView addSubview:clearView];
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x >= self.imageViews.count * QTYDYWidth) {
        //保存版本号
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *appVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        [[NSUserDefaults standardUserDefaults] setValue:appVersion forKey:@"appVersion"];
        
        self.userInteractionEnabled = YES;
        [self removeFromSuperview];
        
       
    }
}

@end
