//
//  TopAnimationView.m
//  wisper
//
//  Created by MasterBie on 2019/1/21.
//  Copyright © 2019 MasterBie. All rights reserved.
//

#import "TopAnimationView.h"

#define WaveColor1 RGB(98, 92, 244)
#define WaveColor2 RGB(239 , 239, 245)

@interface TopAnimationView ()
{
    //前面的波浪
    CAShapeLayer *_waveLayer1;
    CAShapeLayer *_waveLayer2;
     CAShapeLayer *_waveLayer3;
         CAShapeLayer *_waveLayer4;
    CADisplayLink *_disPlayLink;
    
    /**
     曲线的振幅
     */
    CGFloat _waveAmplitude;
    /**
     曲线角速度
     */
    CGFloat _wavePalstance;
    /**
     曲线初相
     */
    CGFloat _waveX;
    /**
     曲线偏距
     */
    CGFloat _waveY;
    CGFloat _progress;
    /**
     曲线移动速度
     */
    CGFloat _waveMoveSpeed;
}
@end

@implementation TopAnimationView


- (void)startAnimation
{
    if (!_disPlayLink) {
        _disPlayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateWave:)];
        [_disPlayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
  
}
- (void)parseAnimation
{
    [self stop];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self buildUI];
        [self buildData];
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//初始化UI
-(void)buildUI
{
    //初始化波浪
    //底层
    _waveLayer1 = [CAShapeLayer layer];
    _waveLayer1.fillColor = [UIColor clearColor].CGColor;
    _waveLayer1.strokeColor = WaveColor2.CGColor;
    
    [self.layer addSublayer:_waveLayer1];
    
    //上层
    _waveLayer2 = [CAShapeLayer layer];
    _waveLayer2.fillColor = [UIColor clearColor].CGColor;
    _waveLayer2.strokeColor = WaveColor1.CGColor;
    [self.layer addSublayer:_waveLayer2];
    
    _waveLayer3 = [CAShapeLayer layer];
    _waveLayer3.fillColor = [UIColor clearColor].CGColor;
    _waveLayer3.strokeColor = WaveColor2.CGColor;
    [self.layer addSublayer:_waveLayer3];
    
    _waveLayer4 = [CAShapeLayer layer];
    _waveLayer4.fillColor = [UIColor clearColor].CGColor;
    _waveLayer4.strokeColor = WaveColor2.CGColor;
    [self.layer addSublayer:_waveLayer4];
    
    
}

//初始化数据
-(void)buildData
{
    _progress = 1;
    //振幅
    _waveAmplitude = 50;
    //角速度
    _wavePalstance = M_PI/self.bounds.size.width;
    //偏距
    _waveY = 40;
    //初相
    _waveX = 10;
    //x轴移动速度
    _waveMoveSpeed = _wavePalstance * 5;
    //以屏幕刷新速度为周期刷新曲线的位置
    _disPlayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateWave:)];
    [_disPlayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];

    [self updateWaveY];
    [self updateWave1];
    [self updateWave2];
    [self updateWave3];
    [self updateWave4];
    [self stop];
}
/**
 保持和屏幕的刷新速度相同，iphone的刷新速度是60Hz,即每秒60次的刷新
 */
-(void)updateWave:(CADisplayLink *)link
{
    //更新X
    _waveX += _waveMoveSpeed;
    [self updateWaveY];
    [self updateWave1];
    [self updateWave2];
      [self updateWave3];
    [self updateWave4];
}

//更新偏距的大小 直到达到目标偏距 让wave有一个匀速增长的效果
-(void)updateWaveY
{
    CGFloat targetY = self.bounds.size.height - _progress * self.bounds.size.height;
    if (_waveY < targetY) {
        _waveY += 2;
    }
    if (_waveY > targetY ) {
        _waveY -= 2;
    }
}

//更新第一层曲线
-(void)updateWave1
{
    //波浪宽度
    CGFloat waterWaveWidth = self.bounds.size.width;
    //初始化运动路径
    CGMutablePathRef path = CGPathCreateMutable();
    //设置起始位置
    CGPathMoveToPoint(path, nil, 0, _waveY * 2);
    //初始化波浪其实Y为偏距
    CGFloat y = _waveY;
    //正弦曲线公式为： y=Asin(ωx+φ)+k;
    for (float x = 0.0f; x <= waterWaveWidth ; x++) {
        y = _waveAmplitude * cos(_wavePalstance * x  + _waveX ) / 1.5 + _waveY;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    //填充底部颜色
//    CGPathAddLineToPoint(path, nil, waterWaveWidth, self.bounds.size.height);
//    CGPathAddLineToPoint(path, nil, 0, self.bounds.size.height);
    //CGPathCloseSubpath(path);
    _waveLayer1.path = path;
    CGPathRelease(path);
}

//更新第二层曲线
-(void)updateWave2
{
    //波浪宽度
    CGFloat waterWaveWidth = self.bounds.size.width;
    //初始化运动路径
    CGMutablePathRef path = CGPathCreateMutable();
    //设置起始位置
    CGPathMoveToPoint(path, nil, 0, _waveY / 2);
    //初始化波浪其实Y为偏距
    CGFloat y = _waveY * 3;
    //正弦曲线公式为： y=Asin(ωx+φ)+k;
    for (float x = 0.0f; x <= waterWaveWidth ; x++) {
        y = _waveAmplitude * sin(_wavePalstance * x  + _waveX * 1.5  ) + _waveY;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    //添加终点路径、填充底部颜色
//    CGPathAddLineToPoint(path, nil, waterWaveWidth, self.bounds.size.height);
//    CGPathAddLineToPoint(path, nil, 0, self.bounds.size.height);
//    CGPathCloseSubpath(path);
    _waveLayer2.path = path;
    CGPathRelease(path);
    
}

-(void)updateWave3
{
    //波浪宽度
    CGFloat waterWaveWidth = self.bounds.size.width;
    //初始化运动路径
    CGMutablePathRef path = CGPathCreateMutable();
    //设置起始位置
    CGPathMoveToPoint(path, nil, 0, _waveY + 50);
    //初始化波浪其实Y为偏距
    CGFloat y = _waveY * 3;
    //正弦曲线公式为： y=Asin(ωx+φ)+k;
    for (float x = 0.0f; x <= waterWaveWidth ; x++) {
        y = _waveAmplitude * cos(_wavePalstance * x + _waveX * 0.8) * 1.3 + _waveY ;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    //添加终点路径、填充底部颜色
    //    CGPathAddLineToPoint(path, nil, waterWaveWidth, self.bounds.size.height);
    //    CGPathAddLineToPoint(path, nil, 0, self.bounds.size.height);
    //    CGPathCloseSubpath(path);
    _waveLayer3.path = path;
    CGPathRelease(path);
    
}

-(void)updateWave4
{
    //波浪宽度
    CGFloat waterWaveWidth = self.bounds.size.width;
    //初始化运动路径
    CGMutablePathRef path = CGPathCreateMutable();
    //设置起始位置
    CGPathMoveToPoint(path, nil, 0, _waveY + 50);
    //初始化波浪其实Y为偏距
    CGFloat y = _waveY * 3;
    //正弦曲线公式为： y=Asin(ωx+φ)+k;
    for (float x = 0.0f; x <= waterWaveWidth ; x++) {
        y = _waveAmplitude * sin(_wavePalstance * x * 1.5 + _waveX) * 0.8 + _waveY - 20;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    //添加终点路径、填充底部颜色
    //    CGPathAddLineToPoint(path, nil, waterWaveWidth, self.bounds.size.height);
    //    CGPathAddLineToPoint(path, nil, 0, self.bounds.size.height);
    //    CGPathCloseSubpath(path);
    _waveLayer4.path = path;
    CGPathRelease(path);
    
}

//设置需要显示的进度，y轴的更新会在[updateWaveY]方法中实现
-(void)setProgress:(CGFloat)progress
{
    _progress = progress;
}

//停止动画
-(void)stop
{
    if (_disPlayLink) {
        [_disPlayLink invalidate];
        _disPlayLink = nil;
    }
}
//回收内存
-(void)dealloc
{
    [self stop];
    if (_waveLayer1) {
        [_waveLayer1 removeFromSuperlayer];
        _waveLayer1 = nil;
    }
    if (_waveLayer2) {
        [_waveLayer2 removeFromSuperlayer];
        _waveLayer2 = nil;
    }
}


@end
