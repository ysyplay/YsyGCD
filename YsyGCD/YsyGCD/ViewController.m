//
//  ViewController.m
//  YsyGCD
//
//  Created by LH on 8/15/20.
//  Copyright © 2020 ysyplay. All rights reserved.
//  关于GCD的知识点归纳可以参考我在简书上的文章https://www.jianshu.com/p/c55883ab52b5

#import "ViewController.h"
#import "GCD.h"
@interface ViewController ()
///
@property (nonatomic, strong) GCDQueue *concurrentQueue;
@property (nonatomic, strong) GCDQueue *serialQueue;
@property (nonatomic, strong) GCDTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _concurrentQueue = [[GCDQueue alloc] initConcurrent:@"com.1"];
    _serialQueue     = [[GCDQueue alloc] initSerial:@"com.2"];

//    [self groupTest];
//    [self semaphoreTest];
//    [self barrierTest];
    [self timerTest];
}
- (void)groupTest{
    GCDGroup *group = [[GCDGroup alloc] init];
    [group enter];
    [GCDDispatch async:_concurrentQueue execute:^{
        NSLog(@"任务1开始");
        [NSThread sleepForTimeInterval:5];
        NSLog(@"任务1结束");
        [group leave];
    }];
    [group enter];
    [GCDDispatch async:_concurrentQueue execute:^{
        NSLog(@"任务2开始");
        [NSThread sleepForTimeInterval:2];
        NSLog(@"任务2结束");
        [group leave];
    }];
        
    [group notify:[GCDQueue mainQueue] execute:^{
        NSLog(@"任务都完成了");
    }];
}
- (void)semaphoreTest{
    GCDSemaphore *semaphore = [[GCDSemaphore alloc] initWithValue:2];
    [GCDDispatch async:_concurrentQueue execute:^{
        [semaphore wait];
        NSLog(@"任务1开始");
        [NSThread sleepForTimeInterval:2];
        NSLog(@"任务1结束");
        [semaphore signal];
    }];
    [GCDDispatch async:_concurrentQueue execute:^{
        [semaphore wait];
        NSLog(@"任务2开始");
        [NSThread sleepForTimeInterval:8];
        NSLog(@"任务2结束");
        [semaphore signal];
    }];
    [GCDDispatch async:_concurrentQueue execute:^{
        [semaphore wait];
        NSLog(@"任务3开始");
        [NSThread sleepForTimeInterval:2];
        NSLog(@"任务3结束");
        [semaphore signal];
    }];
}
- (void)barrierTest{
    [GCDDispatch async:_concurrentQueue execute:^{
        NSLog(@"栅栏前的任务1开始");
        [NSThread sleepForTimeInterval:2];
        NSLog(@"栅栏前的任务1结束");
    }];
    [GCDDispatch async:_concurrentQueue execute:^{
        NSLog(@"栅栏前的任务2开始");
        [NSThread sleepForTimeInterval:5];
        NSLog(@"栅栏前的任务2结束");
    }];
    [GCDDispatch barrier_async:_concurrentQueue execute:^{
        NSLog(@"这是个栅栏,等待2s后放行");
        [NSThread sleepForTimeInterval:2];
    }];
    [GCDDispatch async:_concurrentQueue execute:^{
        NSLog(@"栅栏后的任务开始");
        [NSThread sleepForTimeInterval:2];
        NSLog(@"栅栏后的任务结束");
    }];
}
- (void)timerTest{
    self.timer = [[GCDTimer alloc] initInQueue:[GCDQueue mainQueue]];
    __block int a = -1;
    [_timer event:^{
        a += 1;
        NSLog(@"gcd定时器定时任务 %d",a);
    } timeIntervalWithSecs:1];
    [_timer start];
}
@end
