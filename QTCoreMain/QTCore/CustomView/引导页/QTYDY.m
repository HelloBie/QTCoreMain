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

typedef NS_ENUM(NSInteger, YDYType) {
    // 引导页类型
    YDYTypeOnlyImage = 1,// 只包含图片的引导页
    YDYTypeImageWithNextButton // 带有下一步按钮的引导页
};


@interface QTYDY ()<UIScrollViewDelegate>
@property(nonatomic,strong)NSMutableArray *imageViews;// 引导页图片数组
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,assign)YDYType type;
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
    //懒加载ImageView数组
    if (!_imageViews) {
        
        _imageViews = [NSMutableArray array];
    }
    return _imageViews;
}


- (UIScrollView *)scrollView
{
    //初始化scrollView
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, QTYDYWidth, QTYDYHeight)];
        _scrollView.delegate = self;
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.contentSize = CGSizeMake(QTYDYWidth * (self.imageViews.count + 1), 0);
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        if (self.type == YDYTypeImageWithNextButton) {
            self.scrollView.scrollEnabled = NO;
        }
        
        [self addSubview:_scrollView];
    }
    return _scrollView;
}

+ (BOOL)needShow
{
    //根据版本号判断是否需要显示引导页
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSString *appOldVerson = [[NSUserDefaults standardUserDefaults] valueForKey:@"QTYDYAppVersion"];
    return ![appVersion isEqualToString:appOldVerson];
}

+ (void)saveAppVersion
{
    //保存版本号
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    [[NSUserDefaults standardUserDefaults] setValue:appVersion forKey:@"QTYDYAppVersion"];
}


+ (void)addToWindowWithImageNames:(NSArray *)imageNames;
{
    // appdelegate里调用 传图片名字数组,自带版本号判断,侧滑移除,适用于不带按钮的引导页
    if ([QTYDY needShow]) {
        QTYDY *qt = [[QTYDY alloc] initWithFrame:CGRectMake(0, 0, QTYDYWidth, QTYDYHeight)];
        qt.type = YDYTypeOnlyImage;
        for (NSString *imgName in imageNames) {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]];
            imageView.contentMode = UIViewContentModeScaleAspectFill;//保证图片比例不被拉伸
            [qt.imageViews addObject:imageView];
        }
        if (qt.imageViews.count) {
            [qt addImageViewToScrollView];
            UIWindow *window = [UIApplication sharedApplication].delegate.window;
            [window addSubview:qt];
        }
        
    }
}

+ (void)addToWindowWithImageNames:(NSArray *)imageNames nextButtons:(NSMutableArray <UIButton *> *)buttons
{
    // appdelegate里调用 传图片名字数组,按钮数组(前面按钮功能为进入下一页,最后一页按钮移除引导页) ,自带版本号判断,无侧滑移除,适用于有下一步按钮的引导页
    if ([QTYDY needShow]) {
        if (imageNames.count == buttons.count) {
            QTYDY *qt = [[QTYDY alloc] initWithFrame:CGRectMake(0, 0, QTYDYWidth, QTYDYHeight)];
            qt.type = YDYTypeImageWithNextButton;
            for (int i = 0; i < imageNames.count; i++) {
                NSString *imgName = imageNames[i];
                UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]];
                imageView.frame = CGRectMake(0, 0, QTYDYWidth, QTYDYHeight);
                imageView.contentMode = UIViewContentModeScaleAspectFill;//保证图片比例不被拉伸
                UIView *view = [UIView new];
                [view addSubview:imageView];
                UIButton *nextButton = buttons[i];
                [view addSubview:nextButton];
                [nextButton addTarget:qt action:@selector(nextButtonClick:) forControlEvents:UIControlEventTouchUpInside];
                [qt.imageViews addObject:view];
                
            }
            if (qt.imageViews.count) {
                [qt addImageViewToScrollView];
                UIWindow *window = [UIApplication sharedApplication].delegate.window;
                [window addSubview:qt];
            }
        }else
        {
            NSLog(@"error: 图片与按钮数量不一致 (QTYDY)");
        }
    }
}

- (void)nextButtonClick:(UIButton *)nextButton
{
    // 下一页按钮点击事件
    
    [UIView animateWithDuration:0.3 animations:^{
        self.scrollView.contentOffset = CGPointMake(self.scrollView.contentOffset.x + QTYDYWidth, 0);
    } completion:^(BOOL finished) {
        if (self.scrollView.contentOffset.x == self.scrollView.contentSize.width - QTYDYWidth) {
            [QTYDY saveAppVersion];
            [self removeFromSuperview];
        }
    }];
    
}

- (void)addImageViewToScrollView
{
    // 将传入的图片添加到scrollerView上
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



#pragma mark - scllowViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (self.type == YDYTypeOnlyImage) {
        if (scrollView.contentOffset.x >= self.imageViews.count * QTYDYWidth) {
            [QTYDY saveAppVersion];
            self.userInteractionEnabled = YES;
            [self removeFromSuperview];
        }
    }
}

@end
