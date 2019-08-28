//
//  AppDelegate.m
//  QTCoreMain
//
//  Created by MasterBie on 2018/10/18.
//  Copyright © 2018年 MasterBie. All rights reserved.
//

#import "AppDelegate.h"
#import "QTYDY.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BMKLocationkit/BMKLocationComponent.h>
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)addmethTest
{
    NSLog(@"methadd success");
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // Override point for customization after application launch.
    BMKMapManager *mapManager = [[BMKMapManager alloc] init];
    // 如果要关注网络及授权验证事件，请设定generalDelegate参数
    BOOL ret = [mapManager start:@"WBxYqm4huBGfAePvaADzaiuwV3rYkZT0"  generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    
    
    self.window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.window makeKeyAndVisible];
    ViewController *vc = [ViewController new];
    self.window.rootViewController = vc;
    NSMutableArray *buttons = [NSMutableArray array];
    
    for (int i = 0; i < 2; i++) {
        UIButton *button = [UIButton new]
        .set_frame(CGRectMake(0, 0, 200, 50))
        .set_radius(25)
        .set_center(CGPointMake(Width / 2.0, 300 + 30 * i))
        .set_title(@[@"下一步",@"立即使用"][i])
        .set_backgroundColor(@[[UIColor blueColor],[UIColor yellowColor]][i])
        .set_titleColor([UIColor whiteColor]);
        [buttons addObject:button];
    }
    
    [QTYDY addToWindowWithImageNames:@[@"timg.jpeg",@"timg2.jpeg"] nextButtons:buttons];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
