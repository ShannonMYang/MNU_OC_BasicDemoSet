//
//  MutexDemo.m
//  Interview07-线程同步方案
//
//  Created by 木溪鱼 on 2020/11/6.
//

#import "MutexDemo.h"
#import <pthread.h>

@interface MutexDemo()

@property (nonatomic, assign) pthread_mutex_t ticketMutex;
@property (nonatomic, assign) pthread_mutex_t moneyMutex;

@end

@implementation MutexDemo

- (void)pr_initMutex:(pthread_mutex_t *)mutex
{
    // 静态初始化
//    pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
    
    // 初始化属性
//    pthread_mutexattr_t attr;
//    pthread_mutexattr_init(&attr);
//    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
    
    // 初始化锁
//    pthread_mutex_init(mutex, &attr);
    
    // 销毁属性
//    pthread_mutexattr_destroy(&attr);
    
    // 初始化属性
//    pthread_mutexattr_t attr;
//    pthread_mutexattr_init(&attr);
//    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
    
    // 初始化锁
    pthread_mutex_init(mutex, NULL);
    
    // 销毁属性
//    pthread_mutexattr_destroy(&attr);
}

- (instancetype)init {
    if (self = [super init]) {
        [self pr_initMutex:&_ticketMutex];
        [self pr_initMutex:&_moneyMutex];
    }
    return  self;
}

// 死锁：永远拿不到锁
- (void)pr_saveMoney
{
    // 加锁
    pthread_mutex_lock(&_moneyMutex);
    
    [super pr_saveMoney];
    
    // 解锁
    pthread_mutex_unlock(&_moneyMutex);
}

- (void)pr_fetchMoney
{
    // 加锁
    pthread_mutex_lock(&_moneyMutex);
    
    [super pr_fetchMoney];
    
    // 解锁
    pthread_mutex_unlock(&_moneyMutex);
}

- (void)pr_saleTicket
{
    // 加锁
    pthread_mutex_lock(&_ticketMutex);
    
    [super pr_saleTicket];
    
    // 解锁
    pthread_mutex_unlock(&_ticketMutex);
}

- (void)dealloc {
    pthread_mutex_destroy(&_moneyMutex);
    pthread_mutex_destroy(&_ticketMutex);
}

@end
