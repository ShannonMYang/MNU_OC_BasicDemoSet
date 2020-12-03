//
//  ViewController.m
//  Interview07-线程同步方案
//
//  Created by 木溪鱼 on 2020/11/6.
//

#import "ViewController.h"

#import "MNUBaseDemo.h"
#import "OSSpinLockDemo.h"
#import "OSSpinLockDemo2.h"
#import "OSUnfairLockDemo.h"
#import "MutexDemo.h"
#import "MutexDemo2.h"
#import "MutexDemo3.h"
#import "NSLockDemo.h"
#import "NSConditionDemo.h"

@interface ViewController ()

@property (nonatomic, strong) MNUBaseDemo *demo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MNUBaseDemo *demo = [[NSConditionDemo alloc] init];
    
//    [demo ticketTest];
//    [demo moneyTest];
    
    [demo otherTest];
}


@end
