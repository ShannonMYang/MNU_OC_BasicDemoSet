//
//  ViewController.m
//  Interview02-打印
//
//  Created by 木溪鱼 on 2020/11/5.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", [NSThread currentThread]);
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        NSLog(@"1");
        // 这句代码的本质，是往 Runloop 中 添加定时器
        [self performSelector:@selector(test) withObject:nil afterDelay:.0];
        NSLog(@"3");
        
//        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
//        如果不启动runloop，子线程中的定时器永远不会启用的，test方法也就无从调起。子线程的runloop需要手动启动。
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    });
}

- (void)test
{
    NSLog(@"2");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSThread *thread = [[NSThread alloc] initWithBlock:^{
        NSLog(@"1 - 1");
        
        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }];
    
    [thread start];
    
//    thread 依旧是子线程，仍需要手动启动runloop
    NSLog(@"%@", thread);
    
    [self performSelector:@selector(test) onThread:thread withObject:nil waitUntilDone:YES];
}


@end
