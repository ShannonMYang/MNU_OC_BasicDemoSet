//
//  OSUnfairLockDemo.m
//  Interview07-线程同步方案
//
//  Created by 木溪鱼 on 2020/11/6.
//

#import "OSUnfairLockDemo.h"
#import <os/lock.h>

@interface OSUnfairLockDemo()

// Low-level lock
// ll lock
// lll
// Low-level lock 的特点：等不到锁就休眠
@property (nonatomic, assign) os_unfair_lock moneyLock;
@property (nonatomic, assign) os_unfair_lock ticketLock;

@end

@implementation OSUnfairLockDemo

- (instancetype)init {
    if (self = [super init]) {
        // 初始化锁
        self.ticketLock = OS_UNFAIR_LOCK_INIT;
        self.moneyLock = OS_UNFAIR_LOCK_INIT;
    }
    return self;
}

- (void)pr_saveMoney
{
    // 加锁
    os_unfair_lock_lock(&_moneyLock);
    
    [super pr_saveMoney];
    
    // 解锁
    os_unfair_lock_unlock(&_moneyLock);
}

- (void)pr_fetchMoney
{
    // 加锁
    os_unfair_lock_lock(&_moneyLock);
    
    [super pr_fetchMoney];
    
    // 解锁
    os_unfair_lock_unlock(&_moneyLock);
}

- (void)pr_saleTicket
{
    // 加锁
    os_unfair_lock_lock(&_ticketLock);
    
    [super pr_saleTicket];
    
    // 解锁
    os_unfair_lock_unlock(&_ticketLock);
}

@end
