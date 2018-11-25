//
//  GCGAsyncSoctketManager.h
//  CarControl
//
//  Created by bqt on 2017/8/2.
//  Copyright © 2017年 bambootech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GCDAsyncSocket.h>
@interface GCGAsyncSoctketManager : NSObject
@property (strong, nonatomic) GCDAsyncSocket *socket;

+ (instancetype)shareSocketManager;
- (BOOL)connectToServer;
- (void)cutOffSocket;
- (void)sendDataToServer:(NSData *)data; 
@end
