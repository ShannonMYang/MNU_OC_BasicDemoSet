//
//  ViewController.m
//  06-DrawingTest
//
//  Created by 木溪鱼 on 2020/9/30.
//

#import "ViewController.h"

@interface ViewController () <CALayerDelegate>

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
    
    
    // 设置当前控制器为layer的代理
    blueLayer.delegate = self;
    
    // 确保图层背景图像使用正确的比例
    blueLayer.contentsScale = [UIScreen mainScreen].scale;
    
    // 添加layer（图层）到我们自己当前的视图
    [view0.layer addSublayer:blueLayer];  // 白色的UIView内部嵌套的蓝色CALayer
    
    // 强制layer（图层）进行重绘
    [blueLayer display];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    // 画一个有一定环宽的红色圆圈
    CGContextSetLineWidth(ctx, 10.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
    // 效果就是，你发现圆环超出view0的部分被裁剪了。
    // 这是因为，当你使用CALayerDelegate绘制寄宿图的时候，并没有对超出边界外的内容提供绘制支持
}


@end
