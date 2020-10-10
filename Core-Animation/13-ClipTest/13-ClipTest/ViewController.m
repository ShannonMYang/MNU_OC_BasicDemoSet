//
//  ViewController.m
//  13-ClipTest
//
//  Created by 木溪鱼 on 2020/10/10.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *layerView1;
@property (nonatomic, strong) UIView *redView1;
@property (nonatomic, strong) UIView *layerView2;
@property (nonatomic, strong) UIView *redView2;
@property (nonatomic, strong) UIView *shadowView;
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
    
    // 下 阴影 视图
    self.shadowView = [[UIView alloc] init];
    self.shadowView.frame = CGRectMake(60.f, 312.f, 200.f, 200.f);
    self.shadowView.backgroundColor = UIColor.systemGray3Color;
    [self.view addSubview:self.shadowView];
    
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
    self.shadowView.layer.cornerRadius = 20.f;
    
    // add a border to our layers
    // 边框是跟随图层的边界变化的，而不是图层里面的内容
    self.layerView1.layer.borderWidth = 5.f;
    self.layerView2.layer.borderWidth = 5.f;
    
    // add a shadow to layerView1
    self.layerView1.layer.shadowOpacity = 0.5f;
    self.layerView1.layer.shadowOffset = CGSizeMake(0.f, 5.f);
    self.layerView1.layer.shadowRadius = 5.f;
    
    // add a shadow to shadowView (not layerView2)
    self.shadowView.layer.shadowOpacity = 0.5f;
    self.shadowView.layer.shadowOffset = CGSizeMake(0.f, 5.f);
    self.shadowView.layer.shadowRadius = 5.f;
    
//    self.layerView2.layer.shadowOpacity = 0.5f;
//    self.layerView2.layer.shadowOffset = CGSizeMake(0.f, 5.f);
//    self.layerView2.layer.shadowRadius = 5.f;
    
    // enable clipping on the second layer
    self.layerView2.layer.masksToBounds = YES;
}


@end
