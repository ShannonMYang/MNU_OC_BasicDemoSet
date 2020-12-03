//
//  ViewController.m
//  Interview03-group
//
//  Created by 木溪鱼 on 2020/11/5.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 创建队列组
    dispatch_group_t group = dispatch_group_create();
    
    // 创建并发队列
    dispatch_queue_t queue = dispatch_queue_create("my_queue", DISPATCH_QUEUE_CONCURRENT);
    
    // 添加异步任务
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i < 5; i++) {
            NSLog(@"任务1 - %@", [NSThread currentThread]);
        }
    });
    
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i < 5; i++) {
            NSLog(@"任务2 - %@", [NSThread currentThread]);
        }
    });
    
    // 等前面的任务执行完毕后，会自动执行这个任务
    dispatch_group_notify(group, queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            for (int i = 0; i < 5; i++) {
                NSLog(@"任务3 - %@", [NSThread currentThread]);
            }
        });
    });

    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
            for (int i = 0; i < 5; i++) {
                NSLog(@"任务4 - %@", [NSThread currentThread]);
            }
    });
    
//    dispatch_group_notify(group, queue, ^{
//            for (int i = 0; i < 5; i++) {
//                NSLog(@"任务5 - %@", [NSThread currentThread]);
//            }
//    });
//
//    dispatch_group_notify(group, queue, ^{
//            for (int i = 0; i < 5; i++) {
//                NSLog(@"任务6 - %@", [NSThread currentThread]);
//            }
//    });
}


@end
