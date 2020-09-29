//
//  ViewController.m
//  LayerTest0
//
//  Created by 木溪鱼 on 2020/9/29.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 白色UIView
    UIView *view0 = [[UIView alloc] init];
    view0.frame = CGRectMake(60.f, 184.f, 200.f, 200.f);
    view0.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:view0];
    
//    NSLog(@"%f - %f", self.view.frame.size.width, self.view.frame.size.height);
    
    // 蓝色CALayer
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50.f, 50.f, 100.f, 100.f);
    blueLayer.backgroundColor = [[UIColor blueColor] CGColor];
    [view0.layer addSublayer:blueLayer];  // 白色的UIView内部嵌套的蓝色CALayer
}


@end
