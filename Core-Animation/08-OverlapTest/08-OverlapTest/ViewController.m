//
//  ViewController.m
//  08-OverlapTest
//
//  Created by 木溪鱼 on 2020/9/30.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *greenView = [[UIView alloc] init];
    greenView.frame = CGRectMake(40, 40, 150, 150);
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    
    UIView *redView = [[UIView alloc] init];
    redView.frame = CGRectMake(140, 140, 150, 150);
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    // 默认情况下，绿色视图置于红色视图下方
    // 现在，要通过改变zPosition来改变视图Z轴上的位置顺序
    greenView.layer.zPosition = 1.f;
}


@end
