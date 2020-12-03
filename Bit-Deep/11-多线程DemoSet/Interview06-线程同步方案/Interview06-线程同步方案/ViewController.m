//
//  ViewController.m
//  Interview06-线程同步方案
//
//  Created by 木溪鱼 on 2020/11/5.
//

#import "ViewController.h"

#import "MNUBaseDemo.h"
#import "OSSpinLockDemo.h"
#import "OSSpinLockDemo2.h"

@interface ViewController ()

@property (nonatomic, strong) MNUBaseDemo *demo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MNUBaseDemo *demo = [[OSSpinLockDemo2 alloc] init];
    [demo ticketTest];
    [demo moneyTest];
    
    for (int i = 0; i < 10; i++) {
        [[[NSThread alloc] initWithTarget:self selector:@selector(test) object:nil] start];
    }
}

- (int)test
{
    int a = 11;
    int b = 22;
    
    NSLog(@"%p", &_demo);
    NSLog(@"%p", self.demo);
    
    int c = a + b;
    return c;
}


@end
