//
//  NSConditionLockDemo.m
//  Interview08-线程同步方案
//
//  Created by 木溪鱼 on 2020/12/1.
//

#import "NSConditionLockDemo.h"

@interface NSConditionLockDemo()

@property (nonatomic, strong) NSConditionLock *conditionLock;

@end

@implementation NSConditionLockDemo

- (instancetype)init {
    if (self = [super init]) {
        self.conditionLock = [[NSConditionLock alloc] initWithCondition:1];
    }
    return self;
}

- (void)otherTest
{
    [[[NSThread alloc] initWithTarget:self selector:@selector(pr_one) object:nil] start];
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(pr_two) object:nil] start];
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(pr_three) object:nil] start];
}

- (void)pr_one
{
    [self.conditionLock lock];
    
    NSLog(@"pr_one");
    sleep(1);
    
    [self.conditionLock unlockWithCondition:2];
}

- (void)pr_two
{
    [self.conditionLock lockWhenCondition:2];
    
    NSLog(@"pr_two");
    sleep(1);
    
    [self.conditionLock unlockWithCondition:3];
}

- (void)pr_three
{
    [self.conditionLock lockWhenCondition:3];
    
    NSLog(@"pr_three");
    sleep(1);
    
    [self.conditionLock unlock];
}

@end
