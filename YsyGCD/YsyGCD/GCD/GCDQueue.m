//
//  GCDQueue.m
//  YsyGCD
//
//  Created by LH on 8/15/20.
//  Copyright © 2020 ysyplay. All rights reserved.
//

#import "GCDQueue.h"
static GCDQueue *mainQueue;
static GCDQueue *globalQueue;
static GCDQueue *globalQueue_highPriority;
static GCDQueue *globalQueue_lowPriority;
static GCDQueue *globalQueue_backgroundPriority;
@interface GCDQueue ()
@property (strong, readwrite, nonatomic) dispatch_queue_t dispatchQueue;

@end
@implementation GCDQueue
+ (GCDQueue *)mainQueue {
    
    return mainQueue;
}

+ (GCDQueue *)globalQueue {
    
    return globalQueue;
}

+ (GCDQueue *)globalQueue_highPriority {
    
    return globalQueue_highPriority;
}

+ (GCDQueue *)globalQueue_lowPriority {
    
    return globalQueue_lowPriority;
}

+ (GCDQueue *)globalQueue_backgroundPriority {
    
    return globalQueue_backgroundPriority;
}
+ (void)initialize {
    /**
     Initializes the class before it receives its first message.
     
     1. The runtime sends the initialize message to classes in a
     thread-safe manner.
     
     2. initialize is invoked only once per class. If you want to
     perform independent initialization for the class and for
     categories of the class, you should implement load methods.
     */
    if (self == [GCDQueue self])  {
        
        mainQueue                      = [GCDQueue new];
        globalQueue                    = [GCDQueue new];
        globalQueue_highPriority       = [GCDQueue new];
        globalQueue_lowPriority        = [GCDQueue new];
        globalQueue_backgroundPriority = [GCDQueue new];
        
        mainQueue.dispatchQueue                = dispatch_get_main_queue();
        globalQueue.dispatchQueue              = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        globalQueue_highPriority.dispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
        globalQueue_lowPriority .dispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
        globalQueue_backgroundPriority.dispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    }
}
- (instancetype)init {
    return [self initSerial:@"com.YsyGCD"];
}
- (instancetype)initSerial:(NSString *)label {
    
    self = [super init];
    if (self)
    {
        self.dispatchQueue = dispatch_queue_create([label UTF8String], DISPATCH_QUEUE_SERIAL);
    }
    
    return self;
}
- (instancetype)initConcurrent:(NSString *)label {
    self = [super init];
    if (self)
    {
        self.dispatchQueue = dispatch_queue_create([label UTF8String], DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}
- (void)suspend {
    dispatch_suspend(self.dispatchQueue);
}

- (void)resume {
    dispatch_resume(self.dispatchQueue);
}
@end
