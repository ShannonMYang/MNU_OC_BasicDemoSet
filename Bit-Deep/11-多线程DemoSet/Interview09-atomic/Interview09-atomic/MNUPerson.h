//
//  MNUPerson.h
//  Interview09-atomic
//
//  Created by 木溪鱼 on 2020/12/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MNUPerson : NSObject

@property (assign, nonatomic) int age;
@property (copy, atomic) NSString *name;
@property (strong, atomic) NSMutableArray *data;

@end

/*
 nonatomic和atomic
 atom：原子，不可再分割的单位
 atomic：原子性
 
 给属性加上atomic修饰，可以保证属性的setter和getter都是原子性操作，也就是保证setter和gette内部是线程同步的
 
 // 加锁
 int a = 10;
 int b = 20;
 int c = a + b;
 // 解锁
 
 */

NS_ASSUME_NONNULL_END
