//
//  CustomAlertView.h
//  MerchantDecoration
//
//  Created by admin on 16/11/22.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomAlertView : UIView
@property (nonatomic,strong)UIView *blackView;
@property (strong,nonatomic)UIView * alertview;
@property (strong,nonatomic)NSString * title;
@property (nonatomic,copy)NSString *contentStr;
@property (nonatomic,strong)UILabel *tipLable;
@property(nonatomic,strong)UIButton * confirmButton;
@property(nonatomic,strong)UIButton * cancelButton;
@property (nonatomic,retain)NSArray *btnTitleArr;

-(void)initWithTitle:(NSString *) title contentStr:(NSString *)content;

- (id)initWithFrame:(CGRect)frame;

@end
