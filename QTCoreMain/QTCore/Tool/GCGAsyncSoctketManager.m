//
//  GCGAsyncSoctketManager.m
//  CarControl
//
//  Created by bqt on 2017/8/2.
//  Copyright © 2017年 bambootech. All rights reserved.
//

#import "GCGAsyncSoctketManager.h"
#define SocketHost @"47.92.37.228"
#define SocketPort 9391

#define YaotuoUp @[@"0D", @"01"]
#define YaotuoDown @[@"0D", @"03"]
#define YaotuoGo @[@"0D", @"05"]
#define YaotuoBack @[@"0D", @"07"]

#define ZuoyiUp @[@"08", @"01"]
#define ZuoyiDown @[@"08", @"03"]
#define ZuoyiGo @[@"0A", @"01"]
#define ZuoyiBack @[@"0A", @"03"]
#define KaobeiGo @[@"09", @"03"]
#define KaobeiBack @[@"09", @"01"]

#define CoolingBeg @[@"03", @"02"]
#define CoolingEND @[@"03", @"D0"]
#define Cooling1st @[@"03", @"95"]
#define Cooling2nd @[@"03", @"C6"]

#define HeatingBeg @[@"04", @"02"]
#define HeatingEND @[@"04", @"D0"]
#define Heating1st @[@"03", @"95"]
#define Heating2nd @[@"03", @"C6"]

#define SBROff @[@"0C", @"03"]
#define SBROn @[@"0C", @"01"]

#define MAC @[@"D8", @"B0", @"4C", @"D4", @"AC", @"A6"]
#define XFZ @[@"58", @"46", @"5A"]
#define PageLength @"11"
#define END @[@"45", @"4E", @"44"]
@interface GCGAsyncSoctketManager ()<GCDAsyncSocketDelegate>
@property (assign, nonatomic)NSInteger pushCount;
@property (strong, nonatomic)NSTimer *timer;
@property (assign, nonatomic)NSInteger reconnectCount;
@property (strong, nonatomic)NSTimer *connectTimer;
@end
@implementation GCGAsyncSoctketManager
+ (instancetype)shareSocketManager
{
    static GCGAsyncSoctketManager *_instance = nil;
  
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (BOOL)connectToServer
{
    self.pushCount = 0;
    self.socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    NSError *error = nil;
    BOOL isc = [self.socket connectToHost:SocketHost onPort:SocketPort error:&error];
    if (isc) {
        NSLog(@"success");

        NSMutableData *data2 = [NSMutableData data];
        NSMutableArray *array2 = [self appdenData2];
        
        for (int i = 0; i < array2.count; i++) {
            [data2 appendData:[self convertHexStrToData:array2[i]]];
        }
            [self sendDataToServer:data2];
        // [self.socket readDataWithTimeout:-1 tag:250];
    }else
    {
        NSLog(@"faild");
    }
    

    if (error) {
        return  NO;
    }else
    {
        self.connectTimer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(sendDataToServer) userInfo:nil repeats:YES];
        [self.connectTimer fire];
        return YES;
    }
    

}

- (NSMutableData *)convertHexStrToData:(NSString *)str {
    if (!str || [str length] == 0) {
        return nil;
    }
    
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:8];
    NSRange range;
    if ([str length] %2 == 0) {
        range = NSMakeRange(0,2);
    } else {
        range = NSMakeRange(0,1);
    }
    for (NSInteger i = range.location; i < [str length]; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [str substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        
        range.location += range.length;
        range.length = 2;
    }
    
    return hexData;
}

- (void)cutOffSocket
{
    self.pushCount = 0;
    self.reconnectCount = 0;
    [self.timer invalidate];
    self.timer = nil;
    [self.connectTimer invalidate];
    self.connectTimer = nil;
    [self.socket disconnect];
}

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port
{
    NSLog(@"%@", host);
    [self sendDataToServer];
}

- (NSMutableArray *)appdenData2
{
    NSMutableArray *array = [NSMutableArray array];
    [array addObjectsFromArray:XFZ];
    [array addObject:@"11"];
    [array addObjectsFromArray:@[@"F1", @"7E"]];
    [array addObjectsFromArray:@[@"D8",@"B0",@"4C",@"D4",@"AC",@"A6"]];
    NSMutableArray *array2 = array.mutableCopy;
    [array2 removeObjectAtIndex:2];
    [array2 removeObjectAtIndex:1];
    [array2 removeObjectAtIndex:0];
    [array addObjectsFromArray:[self jiayanhe:array2 lowOrHeight:YES]];
    [array addObjectsFromArray:END];
    return array;
    
}



- (NSArray *)jiayanhe:(NSArray *)array lowOrHeight:(BOOL )lowOrhigh
{
    if (!array.count) {
        return @"";
    }
    int total = 0;
    for (int i = 0; i < array.count; i++) {
        NSString *str = array[i];
        NSString *str2 = [NSString stringWithFormat:@"%ld",strtoul([str UTF8String],0,16)];
        total += [str2 integerValue];
    }
    unsigned short short3 = total >> 8;
    unsigned short short2 = total & 0xff;
    NSString *jiaoyanhe = [[NSString stringWithFormat:@"%lx", short3] uppercaseString];
    NSString *jiaoyanhe2 = [[NSString stringWithFormat:@"%lx", short2] uppercaseString];
    while (jiaoyanhe.length < 2) {
        jiaoyanhe = [[NSString stringWithFormat:@"0%@", jiaoyanhe] uppercaseString];
    }
    while (jiaoyanhe2.length < 2) {
        jiaoyanhe2 = [[NSString stringWithFormat:@"0%@", jiaoyanhe2] uppercaseString];
    }
    return @[jiaoyanhe, jiaoyanhe2];
}




- (void)sendDataToServer
{
//    NSMutableData *data = [NSMutableData data];
//                   // @"58 46 5A 11 02 81 D8 B0 4C D4 4E AD 04 37 45 4E 44"
//    NSString *str = @"58 46 5A 11 F1 7E D8 B0 4C D4 4E AD 05 80 45 4E 44";
//    NSArray *array = [str componentsSeparatedByString:@" "];
//    for (int i = 0; i < array.count; i++) {
//        [data appendData:[self convertHexStrToData:array[i]]];
//    }
//    [self sendDataToServer:data];
    
    NSMutableData *data = [NSMutableData data];
    NSMutableArray *array = [self appdenData2];
    
    for (int i = 0; i < array.count; i++) {
        [data appendData:[self convertHexStrToData:array[i]]];
    }
    [self sendDataToServer:data];
   // [self.socket writeData:[self convertHexStrToData:@"1"]  withTimeout:-1  tag:1];
    [self.socket readDataWithTimeout:-1 tag:1];
}

- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag
{
     // NSLog(@"数据成功发送到服务器 %ld", tag);
  
    //，自己调用一下读取数据的方法, 发送数据成功后，接着_socket才会执行下面的方法,
    [_socket readDataWithTimeout:-1 tag:tag];
  }

- (void)sendDataToServer:(NSData *)data
{
    
    [self.socket writeData:data withTimeout:-1  tag:1];
      NSLog(@"数据 %@ 成功发送到服务器 1",data);
    [self.socket readDataWithTimeout:-1 tag:1];
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
       [[NSNotificationCenter defaultCenter] postNotificationName:@"grpsBack" object:[self bytesToHex:data]];

    [self.socket readDataWithTimeout:-1 tag:1];
    self.pushCount++;
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err
{
    
    
    
}

- (void)begenReConnect
{
    self.pushCount = 0;
    
    self.reconnectCount ++;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 *self.reconnectCount target:self selector:@selector(reconnetcServer) userInfo:nil repeats:YES];
    self.timer = timer;
}

- (void)reconnetcServer
{
    self.pushCount = 0;
    self.reconnectCount = 0;
    NSError *error = nil;
    [self.socket connectToHost:SocketHost onPort:SocketPort error:&error];
    if (error) {
        NSLog(@"connect error: %@", error);
    }

}


- (NSString*)bytesToHex:(NSData*) data{
    Byte *bytes = (Byte*)[data bytes];
    NSString *str = @"";
    NSString *str1 = @"";
    for (int i=0; i<data.length; i++) {
        str1 = [NSString stringWithFormat:@"%02X",bytes[i]];
        // str1 = [str1 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        if([str1 isEqualToString:@"0A"]){
            str = [str stringByAppendingString:@"0D 0A "];
        }else
            str = [str stringByAppendingFormat:@"%@ ",str1];
    }
    return str;
}

@end
