//
//  ViewController.m
//  Interview10-读写安全
//
//  Created by 木溪鱼 on 2020/12/3.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

@property (assign, nonatomic) pthread_rwlock_t lock;

@property (strong, nonatomic) dispatch_queue_t queue;

@end

@implementation ViewController


#pragma mark - 情况1⃣️ 解决多读单写情况，使用 异步栅栏调用
- (void)viewDidLoad {
    [super viewDidLoad];

//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    queue.maxConcurrentOperationCount = 5;

//    dispatch_semaphore_create(5);

    self.queue = dispatch_queue_create("rw_queue", DISPATCH_QUEUE_CONCURRENT);

    for (int i = 0; i < 10; i++) {
        dispatch_async(self.queue, ^{
            [self read];
        });

        dispatch_async(self.queue, ^{
            [self read];
        });

        dispatch_async(self.queue, ^{
            [self read];
        });

        dispatch_barrier_async(self.queue, ^{
            [self write];
        });
    }
}


- (void)read {
    sleep(1);
    NSLog(@"read");
}

- (void)write
{
    sleep(1);
    NSLog(@"write");
}

#pragma mark - 情况2⃣️ 解决多读单写情况，使用 异步栅栏调用
//- (void)viewDidLoad {
//    [super viewDidLoad];
//
//    self.queue = dispatch_queue_create("rw_queue", DISPATCH_QUEUE_CONCURRENT);
//
//    for (int i = 0; i < 10; i++) {
//        [self read];
//        [self read];
//        [self read];
//        [self write];
//    }
//}
//
//
//- (void)read {
//    dispatch_async(self.queue, ^{
//        sleep(1);
//        NSLog(@"read");
//    });
//}
//
//- (void)write
//{
//    dispatch_barrier_async(self.queue, ^{
//        sleep(1);
//        NSLog(@"write");
//    });
//}

#pragma mark - 情况3⃣️ 解决多读单写情况，使用 读写锁
//- (void)viewDidLoad {
//    [super viewDidLoad];
//
//    // 初始化锁
//    pthread_rwlock_init(&_lock, NULL);
//
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//
//    for (int i = 0; i < 10; i++) {
//        dispatch_async(queue, ^{
//            [self read];
//        });
//        dispatch_async(queue, ^{
//            [self write];
//        });
//    }
//}
//
//- (void)read {
//    pthread_rwlock_rdlock(&_lock);
//
//    sleep(1);
//    NSLog(@"%s", __func__);
//
//    pthread_rwlock_unlock(&_lock);
//}
//
//- (void)write
//{
//    pthread_rwlock_wrlock(&_lock);
//
//    sleep(1);
//    NSLog(@"%s", __func__);
//
//    pthread_rwlock_unlock(&_lock);
//}
//
//- (void)dealloc
//{
//    pthread_rwlock_destroy(&_lock);
//}


@end
