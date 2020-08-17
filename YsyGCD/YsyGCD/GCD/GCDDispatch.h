//
//  GCDDispatch.h
//  YsyGCD
//
//  Created by LH on 8/15/20.
//  Copyright © 2020 ysyplay. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^dispatch_block_num)(size_t i);
@class GCDQueue;
@class GCDGroup;
@interface GCDDispatch : NSObject
///同步执行
+ (void)sync:(GCDQueue *)queue execute:(dispatch_block_t)block;
///异步执行
+ (void)async:(GCDQueue *)queue execute:(dispatch_block_t)block;
///延迟执行
+ (void)afterSecs:(float)delta queue:(GCDQueue *)queue execute:(dispatch_block_t)block;
///重复执行
+ (void)apply:(NSInteger)times queue:(GCDQueue *)queue execute:(dispatch_block_num)block;
///栅栏(使用的队列应该是你自己创建的并发队列)
+ (void)barrier_async:(GCDQueue *)queue execute:(dispatch_block_t)block;
///同步栅栏(使用的队列应该是你自己创建的并发队列)
+ (void)barrier_sync:(GCDQueue *)queue execute:(dispatch_block_t)block;

@end


