//
//  ViewController.m
//  QTCoreMain
//
//  Created by MasterBie on 2018/10/18.
//  Copyright © 2018年 MasterBie. All rights reserved.
//

#import "ViewController.h"
#import "QTThred.h"
#import "AppDelegate.h"
#import "QTBluetoothHelper.h"
#import "TopAnimationView.h"
#import "QTRuntimeHelper.h"
@interface ViewController ()
@property(nonatomic,strong)QTThred *th;
@end

@implementation ViewController


- (NSInteger)digui:(NSInteger) i
{
    if (i == 1) {
        return 1;
    }
    if (i == 2) {
            return 1;
        }else
        {
            return [self digui:i - 1] + [self digui:i -2];
        }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIView new]
    .set_frame(CGRectMake(0, 0, Width, Height))
    .set_backgroundColor(RGB(100, 200, 255))
    .set_superView(self.view);
    self.th = [[QTThred alloc] init];
    for (NSInteger i = 1; i < 10 ; i++) {
        NSLog(@"%d", [self digui:i]);
    }
    [self.th executeTask:^{
        [self threadTest];
    }];
    
    [self.th executeTask:^{
        NSLog(@"thread tasl complet");
    }];
    
    [QTRuntimeHelper addMethodFromClass:[AppDelegate class] toClass:[self class] method:@selector(addmethTest)];
    
    [QTRuntimeHelper messgaeSentWithObject:self method:@selector(addmethTest)];
    [self performSelector:@selector(addmethTest)];
    [QTBluetoothHelper new];
    TopAnimationView *view = [[TopAnimationView alloc] initWithFrame:CGRectMake(0, 300, Width, Height)]
    .set_superView(self.view);
    [view startAnimation];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)threadTest
{
    for (int i = 0; i < 10; i++) {
        [NSThread sleepForTimeInterval:5];
        NSLog(@"thread %d", i);
     
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"1 _ %@",[NSThread currentThread]);
    [self.th executeTask:^{
        NSLog(@"2 _ %@",[NSThread currentThread]);
    }];
    
    TopAnimationView *view = [self.view.subviews lastObject];
    [view parseAnimation];
}


@end
