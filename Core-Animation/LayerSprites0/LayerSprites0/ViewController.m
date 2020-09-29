//
//  ViewController.m
//  LayerSprites0
//
//  Created by 木溪鱼 on 2020/9/29.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *coneView;
@property (nonatomic, strong) UIView *shipView;
@property (nonatomic, strong) UIView *iglooView;
@property (nonatomic, strong) UIView *anchorView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 白色UIView
    self.coneView = [[UIView alloc] init];
    self.coneView.frame = CGRectMake(40.f, 68.f, 100.f, 100.f);
    self.coneView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.coneView];
    
    // shipView
    self.shipView = [[UIView alloc] init];
    self.shipView.frame = CGRectMake(40.f, 268.f, 100.f, 100.f);
    self.shipView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.shipView];
    
    // iglooView
    self.iglooView = [[UIView alloc] init];
    self.iglooView.frame = CGRectMake(180.f, 168.f, 100.f, 100.f);
    self.iglooView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.iglooView];
    
    // anchorView
    self.anchorView = [[UIView alloc] init];
    self.anchorView.frame = CGRectMake(180.f, 368.f, 100.f, 100.f);
    self.anchorView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.anchorView];
}

- (void)addSpriteImage:(UIImage *)image withContentRect:(CGRect)rect toLayer:(CALayer *)layer  // set image
{
    
}


@end
