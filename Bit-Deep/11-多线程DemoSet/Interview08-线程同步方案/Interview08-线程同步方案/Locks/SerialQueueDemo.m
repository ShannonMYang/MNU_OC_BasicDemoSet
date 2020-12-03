//
//  SerialQueueDemo.m
//  Interview08-线程同步方案
//
//  Created by 木溪鱼 on 2020/12/2.
//

#import "SerialQueueDemo.h"

@interface SerialQueueDemo()

@property (nonatomic, strong) dispatch_queue_t ticketQueue;
@property (nonatomic, strong) dispatch_queue_t moneyQueue;

@end

@implementation SerialQueueDemo

- (instancetype)init {
    if (self = [super init]) {
        self.ticketQueue = dispatch_queue_create("ticketQueue", DISPATCH_QUEUE_SERIAL);
        self.moneyQueue = dispatch_queue_create("moneyQueue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)pr_fetchMoney
{
    dispatch_sync(self.moneyQueue, ^{
        [super pr_fetchMoney];
    });
}

- (void)pr_saveMoney
{
    dispatch_sync(self.moneyQueue, ^{
        [super pr_saveMoney];
    });
}

- (void)pr_saleTicket
{
    dispatch_sync(self.ticketQueue, ^{
        [super pr_saleTicket];
    });
}

@end
