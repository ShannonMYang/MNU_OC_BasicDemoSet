//
//  ViewController.m
//  11-ClipTest
//
//  Created by 木溪鱼 on 2020/10/10.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *layerView1;
@property (nonatomic, strong) UIView *redView1;
@property (nonatomic, strong) UIView *layerView2;
@property (nonatomic, strong) UIView *redView2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    
    [self testCornerProterty];
}

- (void)initView
{
    // 上 白 底图
    self.layerView1 = [[UIView alloc] init];
    self.layerView1.frame = CGRectMake(60.f, 56.f, 200.f, 200.f);
    self.layerView1.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.layerView1];
    
    // 上 红 视图
    self.redView1 = [[UIView alloc] init];
    self.redView1.frame = CGRectMake(-40.f, -40.f, 150.f, 150.f);
    self.redView1.backgroundColor = UIColor.redColor;
    [self.layerView1 addSubview:self.redView1];
    
//    NSLog(@"%f %f", self.view.frame.size.width, self.view.frame.size.height);
    
    // 下 白 底图
    self.layerView2 = [[UIView alloc] init];
    self.layerView2.frame = CGRectMake(60.f, 312.f, 200.f, 200.f);
    self.layerView2.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.layerView2];
    
    // 下 红 视图
    self.redView2 = [[UIView alloc] init];
    self.redView2.frame = CGRectMake(-40.f, -40.f, 150.f, 150.f);
    self.redView2.backgroundColor = UIColor.redColor;
    [self.layerView2 addSubview:self.redView2];
}

- (void)testCornerProterty
{
    // set the corner radius on our layers
    self.layerView1.layer.cornerRadius = 20.f;
    self.layerView2.layer.cornerRadius = 20.f;
    
    // enable clipping on the second layer
    self.layerView2.layer.masksToBounds = YES;
}

@end
