//
//  ViewController.m
//  03-ContentsGravity
//
//  Created by 木溪鱼 on 2020/9/30.
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
    
    // 加载一张图片
    UIImage *img = [UIImage imageNamed:@"Snowman.png"];
    
    // 把view0的宿主图层的contents属性设置为图片
    /*
     此处要赋值给contents的类型应该是CGImageRef，它是一个指向CGImage结构的指针。
     UIImage有一个CGImage属性，它返回一个“CGImageref”。如果直接赋值给CALayer的contents，将会得到一个编译错误。
     因为CGImageRef并不是真正的Cocoa对象，而是一个Core Foundation类型。
     尽管Core Foundation类型根Cocoa对象在运行时貌似很像，但他们并不是类型兼容的。不过，可以通过bridged关键字转换。
     */
    view0.layer.contents = (__bridge id)(img.CGImage);  // 利用CALayer在一个普通的UIView中显示了一张图片
    
    // 在图层中等比例拉伸以适应图层的边界
    // contentsGravity是CALayer与contentMode对应的属性，但是是一个NSString类型
    view0.layer.contentsGravity = kCAGravityCenter;
    
    // contentsScale属性定义了寄宿图的像素尺寸和视图大小的比例，默认情况下它是一个值为1.0的浮点数
    view0.layer.contentsScale = img.scale;
//    view0.layer.contentsScale = [UIScreen mainScreen].scale;
    
    // 默认情况下，UIView仍然会绘制超过边界的内容或者子视图，在CALayer下也是这样的。
    // CALayer对应的属性maskToBounds；UIView对应的属性clipsToBounds，决定是否显示超出边界的内容
//    view0.layer.masksToBounds = YES;
    
    view0.layer.contentsRect = CGRectMake(0, 0, 1, 1);  // 意味着这个寄宿图都是可见的，如果是{0, 0, 0.5, 0.5}，则是局部可见。
}

@end
