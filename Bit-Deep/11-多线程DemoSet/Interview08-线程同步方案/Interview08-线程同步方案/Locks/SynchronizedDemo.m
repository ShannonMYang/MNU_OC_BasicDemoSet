//
//  SynchronizedDemo.m
//  Interview08-线程同步方案
//
//  Created by 木溪鱼 on 2020/12/2.
//

#import "SynchronizedDemo.h"

// @synchronized 是对 mutex 递归锁的封装
@implementation SynchronizedDemo

- (void)pr_fetchMoney
{
    @synchronized ([self class]) {
        [super pr_fetchMoney];
    }
}

- (void)pr_saveMoney
{
    @synchronized ([self class]) {  // objc_sync_enter
        [super pr_saveMoney];
    }  // objc_sync_exit
}

- (void)pr_saleTicket
{
    static NSObject *lock;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lock = [[NSObject alloc] init];
    });
    
    @synchronized ([self class]) {
        [super pr_saleTicket];
    }
}

- (void)otherTest
{
    @synchronized ([self class]) {
        NSLog(@"1-2-3");
        [self otherTest];
    }
}

@end
