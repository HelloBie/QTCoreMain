//
//  ViewController.m
//  QTCoreMain
//
//  Created by MasterBie on 2018/10/18.
//  Copyright © 2018年 MasterBie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIView new]
    .set_frame(CGRectMake(0, 0, Width, Height))
    .set_backgroundColor(RGB(100, 200, 255))
    .set_superView(self.view);
    // Do any additional setup after loading the view, typically from a nib.
}


@end
