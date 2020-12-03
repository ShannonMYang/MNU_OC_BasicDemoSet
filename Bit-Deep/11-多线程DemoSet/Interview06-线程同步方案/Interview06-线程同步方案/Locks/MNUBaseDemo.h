//
//  MNUBaseDemo.h
//  Interview06-线程同步方案
//
//  Created by 木溪鱼 on 2020/11/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MNUBaseDemo : NSObject

- (void)moneyTest;
- (void)ticketTest;

#pragma mark - 暴露给子类使用的接口
- (void)pr_saveMoney;
- (void)pr_fetchMoney;

- (void)pr_saleTicket;

@end

NS_ASSUME_NONNULL_END
