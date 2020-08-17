//
//  GCDSemaphore.m
//  YsyGCD
//
//  Created by LH on 8/17/20.
//  Copyright © 2020 ysyplay. All rights reserved.
//

#import "GCDSemaphore.h"

@interface GCDSemaphore ()
@property (strong, readwrite, nonatomic) dispatch_semaphore_t dispatchSemaphore;
@end

@implementation GCDSemaphore
- (instancetype)initWithValue:(NSInteger)value {
    self = [super init];
    if (self) {
        self.dispatchSemaphore = dispatch_semaphore_create(value);
    }
    return self;
}

- (BOOL)signal {
    return dispatch_semaphore_signal(self.dispatchSemaphore) != 0;
}

- (void)wait {
    dispatch_semaphore_wait(self.dispatchSemaphore, DISPATCH_TIME_FOREVER);
}
@end
