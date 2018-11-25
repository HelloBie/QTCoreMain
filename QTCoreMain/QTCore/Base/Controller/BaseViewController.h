//
//  BaseViewController.h
//  Decoration
//
//  Created by bqt on 16/10/12.
//  Copyright © 2016年 bambootech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "AppDelegate.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "AppDelegate.h"
#import "NetWorkingTool.h"
#import "UIButton+AutoFontSize.h"
#import "UserModel.h"


@interface BaseViewController : UIViewController
@property(weak, nonatomic)AppDelegate *appDelegate;
@property(weak, nonatomic)UserModel *userModel;
@property(nonatomic, strong)UIImageView *titleImage; // 跟视图的装库图片
- (void)setNavLeftBarButtonItemWith:(NSString *)titleText titleColor:(UIColor *)color image:(NSString *)image onclick:(void(^)(void))block;
- (void)setNavRightBarButtonItemWith:(NSString *)titleText titleColor:(UIColor *)color image:(NSString *)image onclick:(void(^)(void))block;
- (void)setTileLabelWithTitle:(NSString *)title textColor: (UIColor *)color fontSize: (CGFloat)fontSize;
- (void)showHudAnimitonWithView;
- (void)hidHudAnimation;
-(void)showMessage:(NSString *)message;
- (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view;

+ (instancetype)loadWithXib;


@end
