//
//  GCDQueue.h
//  YsyGCD
//
//  Created by LH on 8/15/20.
//  Copyright © 2020 ysyplay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCDQueue : NSObject
@property (strong, readonly, nonatomic) dispatch_queue_t dispatchQueue;


#pragma mark - 获取系统队列
+ (GCDQueue *)mainQueue;
+ (GCDQueue *)globalQueue;
+ (GCDQueue *)globalQueue_highPriority;
+ (GCDQueue *)globalQueue_lowPriority;
+ (GCDQueue *)globalQueue_backgroundPriority;

#pragma mark - 创建队列
///创建串行队列
- (instancetype)initSerial:(NSString *)label;
///创建并行队列
- (instancetype)initConcurrent:(NSString *)label;

///队列挂起
- (void)suspend;
///队列恢复
- (void)resume;
@end


