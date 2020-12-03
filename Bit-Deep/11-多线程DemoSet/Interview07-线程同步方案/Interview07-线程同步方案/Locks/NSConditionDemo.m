//
//  NSConditionDemo.m
//  Interview07-线程同步方案
//
//  Created by 木溪鱼 on 2020/11/6.
//

#import "NSConditionDemo.h"

@interface NSConditionDemo()

@property (nonatomic, strong) NSCondition *condition;
@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation NSConditionDemo

- (instancetype)init {
    if (self = [super init]) {
        self.condition = [[NSCondition alloc] init];
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
    [self.condition lock];
    
    NSLog(@"pr_remove - begin");
    
    if (self.data.count == 0) {
        // 等待
        [self.condition wait];
    }
    
    [self.data removeLastObject];
    NSLog(@"delete an element");
    
    [self.condition unlock];
}

// 线程2
// 往数组里添加元素
- (void)pr_add
{
    [self.condition lock];
    
    sleep(.1);
    
    [self.data addObject:@"Test --- only one"];
    NSLog(@"add an element");
    
    // 信号
    [self.condition signal];
    // 广播
//    [self.condition broadcast];
    
    [self.condition unlock];
}

@end
