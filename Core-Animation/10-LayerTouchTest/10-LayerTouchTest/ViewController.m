//
//  ViewController.m
//  10-LayerTouchTest
//
//  Created by 木溪鱼 on 2020/10/3.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *layerView;
@property (nonatomic, strong) CALayer *blueLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 白色UIView
    self.layerView = [[UIView alloc] init];
    self.layerView.frame = CGRectMake(60.f, 184.f, 200.f, 200.f);
    self.layerView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.layerView];
    
    //    NSLog(@"%f - %f", self.view.frame.size.width, self.view.frame.size.height);
    
    // 蓝色CALayer
    self.blueLayer = [CALayer layer];
    self.blueLayer.frame = CGRectMake(50.f, 50.f, 100.f, 100.f);
    self.blueLayer.backgroundColor = [[UIColor blueColor] CGColor];
    [self.layerView.layer addSublayer:self.blueLayer];  // 白色的UIView内部嵌套的蓝色CALayer
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // get touch position relative to main view
    CGPoint point = [[touches anyObject] locationInView:self.view];
    
    // get touch layer
    CALayer *layer = [self.layerView.layer hitTest:point];
    
    // get layer using hitTest
    if (layer == self.blueLayer) {
        // UIAlert
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Tips"
                                                                       message:@"Inside Blue Layer"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@" 确定 "
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction * _Nonnull action) { }]];
        // 弹窗显示
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Tips"
                                                                       message:@"Inside White Layer"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@" 确定 "
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction * _Nonnull action) { }]];
        // 弹窗显示
        [self presentViewController:alert animated:YES completion:nil];
    }
}


@end
