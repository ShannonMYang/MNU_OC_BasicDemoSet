//
//  MutexDemo3.m
//  Interview07-线程同步方案
//
//  Created by 木溪鱼 on 2020/11/6.
//

#import "MutexDemo3.h"
#import <pthread.h>

@interface MutexDemo3()

@property (nonatomic, assign) pthread_mutex_t mutex;
@property (nonatomic, assign) pthread_cond_t cond;
@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation MutexDemo3

- (instancetype)init {
    if (self = [super init]) {
        // 初始化属性
        pthread_mutexattr_t attr;
        pthread_mutexattr_init(&attr);
        pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
        
        // 初始化锁
        pthread_mutex_init(&_mutex, &attr);
        
        // 销毁属性
        pthread_mutexattr_destroy(&attr);
        
        // 初始化条件
        pthread_cond_init(&_cond, NULL);
        
        self.data = [NSMutableArray array];
    }
    return self;
}

- (void)otherTest
{
    [[[NSThread alloc] initWithTarget:self selector:@selector(pr_remove) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(pr_add) object:nil] start];
}

// 生产者-消费者模式

// 线程1
// 删除数组中的元素
- (void)pr_remove
{
    pthread_mutex_lock(&_mutex);
    
    NSLog(@"pr_remove - begin");
    
    if (self.data.count == 0) {
        // 等待
        pthread_cond_wait(&_cond, &_mutex);
    }
    
    [self.data removeLastObject];
    NSLog(@"delete an element");
    
    pthread_mutex_unlock(&_mutex);
}

// 线程2
// 往数组里添加元素
- (void)pr_add
{
    pthread_mutex_lock(&_mutex);
    
    sleep(.1);
    
    [self.data addObject:@"Test --- only one"];
    NSLog(@"add an element");
    
    // 信号
    pthread_cond_signal(&_cond);
    // 广播
//    pthread_cond_broadcast(&_cond);
    
    pthread_mutex_unlock(&_mutex);
}

- (void)dealloc {
    pthread_mutex_destroy(&_mutex);
    pthread_cond_destroy(&_cond);
}

@end
