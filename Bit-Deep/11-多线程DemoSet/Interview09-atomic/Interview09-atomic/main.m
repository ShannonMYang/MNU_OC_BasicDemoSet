//
//  main.m
//  Interview09-atomic
//
//  Created by 木溪鱼 on 2020/12/3.
//

#import <Foundation/Foundation.h>
#import "MNUPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MNUPerson *p = [[MNUPerson alloc] init];
        
        
        for (int i = 0; i < 10; i++) {
            dispatch_async(NULL, ^{
                // 加锁
                p.data = [NSMutableArray array];
                // 解锁
            });
        }
        
        NSMutableArray *array = p.data;
        // 加锁
        [array addObject:@"1"];
        [array addObject:@"2"];
        [array addObject:@"3"];
        // 解锁
    }
    return 0;
}
