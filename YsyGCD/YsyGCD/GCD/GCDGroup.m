//
//  GCDGroup.m
//  YsyGCD
//
//  Created by LH on 8/17/20.
//  Copyright © 2020 ysyplay. All rights reserved.
//

#import "GCDGroup.h"
#import "GCDQueue.h"
@interface GCDGroup()
@property (strong, nonatomic, readwrite) dispatch_group_t dispatchGroup;
@end

@implementation GCDGroup

- (instancetype)init {
    self = [super init];
    if (self) {
        self.dispatchGroup = dispatch_group_create();
    }
    return self;
}
- (void)enter {
    dispatch_group_enter(self.dispatchGroup);
}

- (void)leave {
    dispatch_group_leave(self.dispatchGroup);
}

- (void)wait {
    dispatch_group_wait(self.dispatchGroup, DISPATCH_TIME_FOREVER);
}

- (void)notify:(GCDQueue *)queue execute:(dispatch_block_t)block{
    NSParameterAssert(block);
    dispatch_group_notify(self.dispatchGroup, queue.dispatchQueue, block);
}

@end
