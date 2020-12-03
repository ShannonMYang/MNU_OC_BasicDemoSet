//
//  NSLockDemo.m
//  Interview07-线程同步方案
//
//  Created by 木溪鱼 on 2020/11/6.
//

#import "NSLockDemo.h"

@interface NSLockDemo()

@property (nonatomic, strong) NSLock *ticketLock;
@property (nonatomic, strong) NSLock *moneyLock;

@end

@implementation NSLockDemo

- (instancetype)init {
    if (self = [super init]) {
        self.ticketLock = [[NSLock alloc] init];
        self.moneyLock = [[NSLock alloc] init];
    }
    return self;
}

// 死锁：永远拿不到锁
- (void)pr_saveMoney
{
    [self.moneyLock lock];
    
    [super pr_saveMoney];
    
    [self.moneyLock unlock];
}

- (void)pr_fetchMoney
{
    [self.moneyLock lock];
    
    [super pr_fetchMoney];
    
    [self.moneyLock unlock];
}

- (void)pr_saleTicket
{
    [self.ticketLock lock];
    
    [super pr_saleTicket];
    
    [self.ticketLock unlock];
}

@end
