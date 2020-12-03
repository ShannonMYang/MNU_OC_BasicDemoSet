//
//  MNUBaseDemo.m
//  Interview07-线程同步方案
//
//  Created by 木溪鱼 on 2020/11/6.
//

#import "MNUBaseDemo.h"

@interface MNUBaseDemo()

@property (nonatomic, assign) int ticketsCount;
@property (nonatomic, assign) int money;

@end

@implementation MNUBaseDemo

- (void)otherTest
{
    
}

/*
 存钱、取钱 演示
 */
- (void)moneyTest
{
    self.money = 100;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self pr_saveMoney];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self pr_fetchMoney];
        }
    });
}

/*
 存钱
 */
- (void)pr_saveMoney
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
- (void)pr_fetchMoney
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
    
//    此段代码的加入，会导致卖票演示的线程同步再次乱掉
//    for (int i = 0; i < 5; i++) {
//        [[[NSThread alloc] initWithTarget:self selector:@selector(pr_saleTicket) object:nil] start];
//    }
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self pr_saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self pr_saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self pr_saleTicket];
        }
    });
}

/*
 卖 1 张票
 */
- (void)pr_saleTicket
{
    int oldTicketsCount = self.ticketsCount;
    sleep(.2);
    oldTicketsCount--;
    self.ticketsCount = oldTicketsCount;
    
    NSLog(@"还剩 %d 张票 --- %@", oldTicketsCount, [NSThread currentThread]);
}

@end
