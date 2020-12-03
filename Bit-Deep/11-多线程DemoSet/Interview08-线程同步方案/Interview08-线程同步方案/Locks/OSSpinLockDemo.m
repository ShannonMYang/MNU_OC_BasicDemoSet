//
//  OSSpinLockDemo.m
//  Interview07-线程同步方案
//
//  Created by 木溪鱼 on 2020/11/6.
//

#import "OSSpinLockDemo.h"
#import <libkern/OSAtomic.h>

@interface OSSpinLockDemo()
// High-leve lock
@property (nonatomic, assign) OSSpinLock moneyLock;
@property (nonatomic, assign) OSSpinLock ticketsLock;

@end

@implementation OSSpinLockDemo

- (instancetype)init {
    if (self = [super init]) {
        // 初始化锁
        self.ticketsLock = OS_SPINLOCK_INIT;
        self.moneyLock = OS_SPINLOCK_INIT;
    }
    return self;
}

- (void)pr_saveMoney
{
    // 加锁
    OSSpinLockLock(&_moneyLock);
    
    [super pr_saveMoney];
    
    // 解锁
    OSSpinLockUnlock(&_moneyLock);
}

- (void)pr_fetchMoney
{
    // 加锁
    OSSpinLockLock(&_moneyLock);
    
    [super pr_fetchMoney];
    
    // 解锁
    OSSpinLockUnlock(&_moneyLock);
}

- (void)pr_saleTicket
{
    // 加锁
    OSSpinLockLock(&_ticketsLock);
    
    [super pr_saleTicket];
    
    // 解锁
    OSSpinLockUnlock(&_ticketsLock);
}

@end
