//
//  ViewController.m
//  09-LayerTouchTest
//
//  Created by 木溪鱼 on 2020/10/2.
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
    
    // convert point to the white layer's coordinates
    point = [self.layerView.layer convertPoint:point
                                     fromLayer: self.view.layer];
    
    // get layer using containsPoint:
    if ([self.layerView.layer containsPoint:point]) {
        // convert point to blueLayer's coordinates
        point = [self.blueLayer convertPoint:point
                                         fromLayer: self.layerView.layer];
        
        if ([self.blueLayer containsPoint:point]) {
            // UIAlert
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Tips"
                                                                               message:@"Inside Blue Layer"
                                                                        preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@" 确定 "
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction * _Nonnull action) {
                                                            
                                                        }]];
            // 弹窗显示
            [self presentViewController:alert animated:YES completion:nil];
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Tips"
                                                                               message:@"Inside White Layer"
                                                                        preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@" 确定 "
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction * _Nonnull action) {
                                                            
                                                        }]];
            // 弹窗显示
            [self presentViewController:alert animated:YES completion:nil];
        }
    }
}


@end
