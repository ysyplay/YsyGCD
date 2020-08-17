//
//  GCDTimer.h
//  YsyGCD
//
//  Created by LH on 8/17/20.
//  Copyright © 2020 ysyplay. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GCDQueue;
NS_ASSUME_NONNULL_BEGIN

@interface GCDTimer : NSObject
@property (strong, readonly, nonatomic) dispatch_source_t dispatchSource;

- (instancetype)initInQueue:(GCDQueue *)queue;
- (void)event:(dispatch_block_t)block timeIntervalWithSecs:(float)secs;
- (void)event:(dispatch_block_t)block timeIntervalWithSecs:(float)secs delaySecs:(float)delaySecs;
- (void)start;
- (void)destroy;
@end

NS_ASSUME_NONNULL_END
