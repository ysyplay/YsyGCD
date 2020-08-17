//
//  GCDGroup.h
//  YsyGCD
//
//  Created by LH on 8/17/20.
//  Copyright © 2020 ysyplay. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GCDQueue;
NS_ASSUME_NONNULL_BEGIN

@interface GCDGroup : NSObject
@property (strong, nonatomic, readonly) dispatch_group_t dispatchGroup;

- (void)enter;
- (void)leave;
- (void)wait;
- (void)notify:(GCDQueue *)queue execute:(dispatch_block_t)block;
@end

NS_ASSUME_NONNULL_END
