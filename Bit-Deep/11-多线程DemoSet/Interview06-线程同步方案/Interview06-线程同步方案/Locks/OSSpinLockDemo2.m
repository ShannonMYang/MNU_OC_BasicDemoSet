//
//  OSSpinLockDemo2.m
//  Interview06-线程同步方案
//
//  Created by 木溪鱼 on 2020/11/6.
//

#import "OSSpinLockDemo2.h"
#import <libkern/OSAtomic.h>

@interface OSSpinLockDemo2()

@property (nonatomic, assign) OSSpinLock moneyLock;

@end

@implementation OSSpinLockDemo2

static OSSpinLock moneyLock_;

+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        moneyLock_ = 0;
    });
}

//- (instancetype)init {
//    if (self = [super init]) {
//        // 初始化锁
//        self.moneyLock = OS_SPINLOCK_INIT;
//    }
//    return self;
//}

- (void)pr_saveMoney
{
    // 加锁
    OSSpinLockLock(&moneyLock_);
    
    [super pr_saveMoney];
    
    // 解锁
    OSSpinLockUnlock(&moneyLock_);
}

- (void)pr_fetchMoney
{
    // 加锁
    OSSpinLockLock(&moneyLock_);
    
    [super pr_fetchMoney];
    
    // 解锁
    OSSpinLockUnlock(&moneyLock_);
}

- (void)pr_saleTicket
{
//    static NSString *str = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        str = [NSString stringWithFormat:@"123456"];
//    });
    
    // 静态初始化，不能调用函数进行初始化，必须是直接赋值初始化
    static OSSpinLock ticketLock = OS_SPINLOCK_INIT;
    // 加锁
    OSSpinLockLock(&ticketLock);
    
    [super pr_saleTicket];
    
    // 解锁
    OSSpinLockUnlock(&ticketLock);
}

@end
