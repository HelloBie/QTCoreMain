//
//  BaseViewController.m
//  Decoration
//
//  Created by bqt on 16/10/12.
//  Copyright © 2016年 bambootech. All rights reserved.
//

#import "BaseViewController.h"
#import <MBProgressHUD.h>
@interface BaseViewController ()
@property(nonatomic, copy)void (^navletfaction)(); // 左侧返回键事件
@property(nonatomic, copy)void (^navRightaction)(); // 左侧返回键事件
@property(nonatomic, copy)void (^shopCartBlock)(); // 购物车事件
@property(nonatomic, copy)void (^searchBlock)();   // 搜索事件
@property(nonatomic, strong)MBProgressHUD *hud;
@property (nonatomic, assign)NSInteger righthidden;
@property(nonatomic, strong)UIImageView * navigationImageView;
@end

@implementation BaseViewController

- (UserModel *)userModel
{
 
    return  [UserModel getUser];
}


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        self.appDelegate = appDelegate;
        // self.view.clipsToBounds = YES;
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


-(UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}
-(void)viewWillAppear:(BOOL)animated {
    UIImageView *navigationImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];\
    self.navigationImageView = navigationImageView;
    self.navigationImageView = navigationImageView;
       self.navigationImageView.hidden = YES; // 隐藏导航栏之间的线
    [super viewWillAppear:animated];
 
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated]; self.navigationImageView.hidden = NO;// 显示导航栏之间的线
    
}





- (void)viewDidLoad {
    [super viewDidLoad];
       
    // self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:LightMainColor,NSFontAttributeName:[UIFont systemFontOfSize:17]};
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 设置常规文字titleView

- (void)setTileLabelWithTitle:(NSString *)title textColor: (UIColor *)color fontSize: (CGFloat)fontSize
{
    if (!color) {
        color = LightMainColor;
    }
    if (!fontSize) {
        fontSize = 14;
    }
    UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    titleView.text = title;
    titleView.textAlignment = NSTextAlignmentCenter;
    titleView.textColor = color;
    titleView.font = [UIFont systemFontOfSize:fontSize];
    self.navigationItem.titleView = titleView;
    
}


#pragma mark - 设置nav左侧返回键

- (void)setNavLeftBarButtonItemWith:(NSString *)titleText titleColor:(UIColor *)color image:(NSString *)image onclick:(void(^)())block
{
    if (!titleText) {
        titleText = @"";
    }
    if (!color) {
        color = [UIColor whiteColor];
    }
    if (!image) {
        image = @"nav-button-arrow";
    }
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 60, 20);
    [leftButton setTitle:titleText forState:UIControlStateNormal];
    [leftButton setTitleColor:color forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 30)];
    [leftButton addTarget:self action:@selector(navLeftAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = backItem;
    self.navletfaction = block;
}

- (void)setNavRightBarButtonItemWith:(NSString *)titleText titleColor:(UIColor *)color image:(NSString *)image onclick:(void(^)())block
{
    if (!titleText) {
        titleText = @"";
    }
    if (!color) {
        color = [UIColor whiteColor];
    }
    if (!image) {
        image = @"nav-button-arrow";
    }
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 60, 20);
    [leftButton setTitle:titleText forState:UIControlStateNormal];
    [leftButton setTitleColor:color forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 30)];
    [leftButton addTarget:self action:@selector(navRightAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.rightBarButtonItem = backItem;
    self.navRightaction = block;
}

- (void)navRightAction: (id)sender
{
    if(self.navRightaction)
    {
        self.navRightaction();
    }
}

- (void)navLeftAction: (id)sender
{
    if(self.navletfaction)
    {
        self.navletfaction();
    }
}




/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)showHudAnimitonWithView:(UIView *)view
{
    [self.hud hideAnimated:YES];
    [self.hud removeFromSuperViewOnHide];
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
     hud.mode = MBProgressHUDModeText;
    //hud.label.text = @"正在获取设备信息";
    // hud.minSize = CGSizeMake(100, 100);
    // NSString  *filePath = [[NSBundle bundleWithPath:[[NSBundle mainBundle] bundlePath]] pathForResource:@"loading" ofType:@"gif"];
    // NSData  *imageData = [NSData dataWithContentsOfFile:filePath];
    // UIImageView *loading = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    // loading.image = [UIImage sd_animatedGIFWithData:imageData];
    // hud.customView = loading;
    // hud.color = [UIColor clearColor];
    // hud.color = [hud.color colorWithAlphaComponent:0.0];
    [hud showAnimated:YES];
    self.hud = hud;
}

- (void)hidHudAnimation
{
    [self.hud hideAnimated:YES];
    [self.hud removeFromSuperViewOnHide];
}

- (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = text;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hideAnimated:YES afterDelay:1.5];
}

@end
