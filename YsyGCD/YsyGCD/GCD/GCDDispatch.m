//
//  GCDDispatch.m
//  YsyGCD
//
//  Created by LH on 8/15/20.
//  Copyright © 2020 ysyplay. All rights reserved.
//

#import "GCDDispatch.h"
#import "GCDQueue.h"
@implementation GCDDispatch
+ (void)sync:(GCDQueue *)queue  execute:(dispatch_block_t)block{
    NSParameterAssert(block);
    dispatch_sync(queue.dispatchQueue, block);
}
+ (void)async:(GCDQueue *)queue  execute:(dispatch_block_t)block{
    NSParameterAssert(block);
    dispatch_async(queue.dispatchQueue, block);
}
+ (void)afterSecs:(float)delta queue:(GCDQueue *)queue execute:(dispatch_block_t)block{
    NSParameterAssert(block);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), queue.dispatchQueue,block);
}
+ (void)apply:(NSInteger)times queue:(GCDQueue *)queue execute:(dispatch_block_num)block{
    NSParameterAssert(block);
    dispatch_apply(times, queue.dispatchQueue,block);
}
+ (void)barrier_async:(GCDQueue *)queue execute:(dispatch_block_t)block{
    NSParameterAssert(block);
    dispatch_barrier_async(queue.dispatchQueue, block);
}
+ (void)barrier_sync:(GCDQueue *)queue execute:(dispatch_block_t)block{
    NSParameterAssert(block);
    dispatch_barrier_sync(queue.dispatchQueue, block);
}
@end


