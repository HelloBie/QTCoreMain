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
#import "MapViewController.h"
#import "QTAudioTool.h"
#import "QTSegmentContentVC.h"
#import <Masonry.h>
#import "QTTimer.h"
@interface ViewController ()
@property(nonatomic,strong)QTThred *th;
@property(nonatomic,strong)QTTimer *timer;
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

- (void)liveThread
{
    self.th = [[QTThred alloc] init];
    [self.th executeTask:^{
        [self threadTest];
    }];
    
    [self.th executeTask:^{
        NSLog(@"thread tasl complet");
    }];
}

- (void)runtime
{
    [QTRuntimeHelper addMethodFromClass:[AppDelegate class] toClass:[self class] method:@selector(addmethTest)];
    
    [QTRuntimeHelper messgaeSentWithObject:self method:@selector(addmethTest)];
    [self performSelector:@selector(addmethTest)];
}
- (void)bt
{
    [[QTBluetoothHelper new] startSearchDevice:^(NSMutableDictionary * _Nonnull findDevicesDic) {
        NSLog(@"%@",findDevicesDic);
    }];
}
- (void)animation
{
    TopAnimationView *view = [[TopAnimationView alloc] initWithFrame:CGRectMake(0, 300, Width, Height)]
    .set_superView(self.view);
    [view startAnimation];
}


- (void)viewDidLoad {
    [super viewDidLoad];
//   NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
//    [QTAudioTool addAudio:[[NSBundle mainBundle] pathForResource:@"1.mp4" ofType:@""] toAudio:[[NSBundle mainBundle] pathForResource:@"2.mp4" ofType:@""] outputPath:[documentPath stringByAppendingString:@"/3.m4a"]];
//    
//    [QTAudioTool cutAudio:[[NSBundle mainBundle] pathForResource:@"3.m4a" ofType:@""] timeRange:CMTimeRangeFromTimeToTime(CMTimeMake(60, 30), CMTimeMake(10, 1)) outputPath:[documentPath stringByAppendingString:@"/4.m4a"]];
//    [QTAudioTool mixAudio:[[NSBundle mainBundle] pathForResource:@"1.mp4" ofType:@""] toAudio:[[NSBundle mainBundle] pathForResource:@"2.mp4" ofType:@""] outputPath:[documentPath stringByAppendingString:@"/mix.m4a"]];
//    
//    
//    NSString *wavFileName = @"wavFile";
//    wavFileName = [wavFileName stringByAppendingString:@".wav"];
//    NSString *wavFilePath = [[NSHomeDirectory() stringByAppendingFormat:@"/Documents/"] stringByAppendingPathComponent:wavFileName];
//   // [QTAudioTool audioToMp3:[[NSBundle mainBundle] pathForResource:@"3.m4a" ofType:@""]];
//    __weak typeof(wavFilePath) wekwavFilePath = wavFilePath;
//    [QTAudioTool convetM4aToWav:[[NSBundle mainBundle] pathForResource:@"3.m4a" ofType:@""] destUrl:wavFilePath completed:^(NSError *error) {
//        [QTAudioTool audioToMp3:wekwavFilePath];
//    }];
//    [self presentViewController:[MapViewController new] animated:YES completion:nil];

//    self.timer = [QTTimer timerWithTimeInterval:1 target:self selector:@selector(timerTest) userInfo:nil repeats:YES];
//    [self.timer start];
//
    
    [self creatTable];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)creatTable{
    QTSegmentContentVC * _segmentContentVC = [[QTSegmentContentVC alloc] init];
    _segmentContentVC.view.backgroundColor = [UIColor whiteColor];
    NSMutableArray <UIViewController *>*childvc = [NSMutableArray array];
    NSMutableArray <NSString *>*title = [NSMutableArray array];
    int selectIndex = -1;
    for (int i= 0; i < 5; i ++) {
        
        UIViewController *chelubVC = [MapViewController new];
        chelubVC.view.userInteractionEnabled = NO;
        [title addObject:[NSString stringWithFormat:@"%dasldjlkasdj",i]];
        
        [childvc addObject:chelubVC];
        
    }
    
 
    
    
    [_segmentContentVC setUpWith:title andChildVCs:childvc];
    
    _segmentContentVC.segmentBar.isCenterShow = YES;
    _segmentContentVC.delegate = self;
    
    [_segmentContentVC.segmentBar updateWithSegmentConfig:^(QTSegmentConfig *config) {
        config.itemNormalColor = [UIColor blackColor];
        config.itemFont = [UIFont systemFontOfSize:14];
        config.indicatorColor = [UIColor blackColor];
        config.indicatorHeight = 3.0;
        config.isShowLineBottom = YES;
    }];
    
    _segmentContentVC.segmentBar.width = self.view.width;
    
    
    
    [self.view addSubview:_segmentContentVC.view];
    [self addChildViewController:_segmentContentVC];
    [_segmentContentVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.left.right.equalTo(@0);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
    }];
    [_segmentContentVC showChildVC:selectIndex+1 isAnimated:NO];
    _segmentContentVC.segmentBar.selectIndex = selectIndex+1;
}



- (void)timerTest
{
    NSLog(@"timer test");
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
    [self presentViewController:[MapViewController new] animated:YES completion:nil];
}


@end
