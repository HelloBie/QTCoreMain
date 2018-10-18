//
//  CustomAlertView.m
//  MerchantDecoration
//
//  Created by admin on 16/11/22.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "CustomAlertView.h"
@interface CustomAlertView()

@end
@implementation CustomAlertView
- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        //创建遮罩
        _blackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, Height)];
        _blackView.backgroundColor = [UIColor blackColor];
        _blackView.alpha = 0.5;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(blackClick)];
        [self.blackView addGestureRecognizer:tap];
        [self addSubview:_blackView];
        //创建alert
        self.alertview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 270, 190)];
        self.alertview.center = self.center;
        self.alertview.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.alertview];
        
        
        [self exChangeOut:self.alertview dur:0.6];
        
        [self createBtnTitle:_btnTitleArr];

        
      
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.alertview.frame = CGRectMake(0, 0, 270, 150);
    self.alertview.center = CGPointMake(self.center.x, self.center.y);
    
    _tipLable = [[UILabel alloc]initWithFrame:CGRectMake(20,0,270,34)];
    _tipLable.text = _title;
    [_tipLable setFont:[UIFont systemFontOfSize:14]];
    [_tipLable setTextColor:[UIColor lightGrayColor]];
    
    
    UILabel * yellowLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _tipLable.frame.size.height + 2, 270, 2)];
    yellowLabel.backgroundColor = RGB(243, 193, 74);
    
   
    
    [self.alertview addSubview:_tipLable];
    [self.alertview addSubview:yellowLabel];
    
    [self creatViewInAlert];
    
   
}

//设置button
- (void)createBtnTitle:(NSArray *)titleArr
{
    CGFloat m = self.alertview.frame.size.width;
    self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cancelButton.frame = CGRectMake(20,self.alertview.frame.size.height-88, (m-60)/2, 33);
    self.confirmButton.frame = CGRectMake(20+(20+(m-60)/2), self.alertview.frame.size.height-88, (m-60)/2, 33);
    [self.cancelButton setBackgroundColor:RGB(207, 207, 207)];
    [self.confirmButton setBackgroundColor:RGB(243, 193, 74)];
    [self.cancelButton setTitleColor:RGB(38, 38, 38) forState:UIControlStateNormal];
    
    [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [self.confirmButton setTitle:@"确定" forState:UIControlStateNormal];
    
    [self.cancelButton.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [self.confirmButton.titleLabel setFont:[UIFont systemFontOfSize:16]];
    
    
    
    
    [self.cancelButton addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.alertview addSubview:self.cancelButton];
    [self.alertview addSubview:self.confirmButton];
    
}


//是否确认发货
- (void)creatViewInAlert
{
    UILabel *attenL = [[UILabel alloc]initWithFrame:CGRectMake(0, (_tipLable.frame.origin.y + 18 * OffWidth + _tipLable.frame.size.height) * OffHeight, self.alertview.frame.size.width , 30 * OffHeight)];
    attenL.font = [UIFont systemFontOfSize:16];
    attenL.text = _contentStr;
    attenL.numberOfLines = 0;
    attenL.textAlignment = NSTextAlignmentCenter;
    attenL.textColor = RGB(38, 38, 38);
    [self.alertview addSubview:attenL];
}




//点击黑色区域事件
- (void)blackClick
{
    [self cancleView];
}
//点击取消按钮对应事件
- (void)cancleView
{
        [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        self.alertview = nil;
    }];
}
//点击取消按钮的响应事件
-(void)cancelClick:(UIButton *)button
{
    [self cancleView];
    
}

-(void)initWithTitle:(NSString *) title contentStr:(NSString *)content {
    _title = title;
    _contentStr = content;

}




//动画效果
-(void)exChangeOut:(UIView *)changeOutView dur:(CFTimeInterval)dur{
    
    CAKeyframeAnimation * animation;
    
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    animation.duration = dur;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 0.9)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    animation.timingFunction = [CAMediaTimingFunction functionWithName: @"easeInEaseOut"];
    [changeOutView.layer addAnimation:animation forKey:nil];
}


@end
