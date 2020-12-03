//
//  ViewController.m
//  Interview04-安全隐患
//
//  Created by 木溪鱼 on 2020/11/5.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) int ticketsCount;
@property (nonatomic, assign) int money;

@end

@implementation ViewController

/*
 不做线程同步的多线程竞争读、写操作，是会出现数据混乱的
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self moneyTest];
    [self ticketTest];
}

#pragma mark - 就是个分割线而已

/*
 存钱、取钱 演示
 */
- (void)moneyTest
{
    self.money = 100;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self saveMoney];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self drawMoney];
        }
    });
}

/*
 存钱
 */
- (void)saveMoney
{
    int oldMoney = self.money;
    sleep(.2);
    oldMoney += 50;
    self.money = oldMoney;
    
    NSLog(@"存 50 元，还剩 %d 元 --- %@", oldMoney, [NSThread currentThread]);
}

/*
 取钱
 */
- (void)drawMoney
{
    int oldMoney = self.money;
    sleep(.2);
    oldMoney -= 30;
    self.money = oldMoney;
    
    NSLog(@"取 20 元，还剩 %d 元 --- %@", oldMoney, [NSThread currentThread]);
}

#pragma mark - 就是个分割线而已

/*
 买票演示
 */
- (void)ticketTest
{
    self.ticketsCount = 15;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self saleTicket];
        }
    });
}

/*
 卖 1 张票
 */
- (void)saleTicket
{
    int oldTicketsCount = self.ticketsCount;
    sleep(.2);
    oldTicketsCount--;
    self.ticketsCount = oldTicketsCount;
    
    NSLog(@"还剩 %d 张票 --- %@", oldTicketsCount, [NSThread currentThread]);
}


@end
