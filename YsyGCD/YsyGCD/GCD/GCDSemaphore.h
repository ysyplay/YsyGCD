//
//  GCDSemaphore.h
//  YsyGCD
//
//  Created by LH on 8/17/20.
//  Copyright © 2020 ysyplay. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GCDSemaphore : NSObject
@property (strong, readonly, nonatomic) dispatch_semaphore_t dispatchSemaphore;
- (instancetype)initWithValue:(NSInteger)value;
- (BOOL)signal;
- (void)wait;
@end

NS_ASSUME_NONNULL_END
