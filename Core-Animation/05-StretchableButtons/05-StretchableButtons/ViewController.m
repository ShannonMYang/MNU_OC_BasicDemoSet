//
//  ViewController.m
//  05-StretchableButtons
//
//  Created by 木溪鱼 on 2020/9/30.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *button1;
@property (nonatomic, strong) UIView *button2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUIView];
    
    [self setStretchable];
}

- (void)createUIView
{
    self.button1 = [[UIView alloc] init];
    self.button1.frame = CGRectMake(50.f, 68.f, 200.f, 100.f);
    self.button1.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.button1];
    
    self.button2 = [[UIView alloc] init];
    self.button2.frame = CGRectMake(50.f, 268.f, 100.f, 200.f);
    self.button2.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.button2];
}

- (void)addStretchableImage:(UIImage *)image withContentCenter:(CGRect)rect toLayer:(CALayer *)layer
{
    // set image
    layer.contents = (__bridge id)image.CGImage;
    
    // set contentsCenter
    layer.contentsCenter = rect;
}

- (void)setStretchable
{
    // load button image
    UIImage *image = [UIImage imageNamed:@"Button.png"];
    
    // set button1
    [self addStretchableImage:image withContentCenter:CGRectMake(0.25, 0.25, 0.5, 0.5) toLayer:self.button1.layer];
    
    // set button2
    [self addStretchableImage:image withContentCenter:CGRectMake(0.25, 0.25, 0.5, 0.5) toLayer:self.button2.layer];
}

@end
