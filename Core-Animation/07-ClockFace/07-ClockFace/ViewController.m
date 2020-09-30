//
//  ViewController.m
//  07-ClockFace
//
//  Created by 木溪鱼 on 2020/9/30.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIImageView *clockFace;
@property (nonatomic, strong) UIImageView *hourHand;
@property (nonatomic, strong) UIImageView *minuteHand;
@property (nonatomic, strong) UIImageView *secondHand;
@property (nonatomic, weak) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 表面
    self.clockFace = [[UIImageView alloc] init];
    self.clockFace.image = [UIImage imageNamed:@"ClockFace.png"];
    self.clockFace.frame = CGRectMake(0, 0, 256, 256);
    self.clockFace.center = CGPointMake(160, 284);
    [self.view addSubview:self.clockFace];
    
    // 时针
    self.hourHand = [[UIImageView alloc] init];
    self.hourHand.image = [UIImage imageNamed:@"HourHand.png"];
    self.hourHand.frame = CGRectMake(0, 0, 30, 94);
    self.hourHand.center = CGPointMake(160, 284);
    [self.view addSubview:self.hourHand];
    
    // 分针
    self.minuteHand = [[UIImageView alloc] init];
    self.minuteHand.image = [UIImage imageNamed:@"MinuteHand.png"];
    self.minuteHand.frame = CGRectMake(0, 0, 20, 106);
    self.minuteHand.center = CGPointMake(160, 284);
    [self.view addSubview:self.minuteHand];

    // 秒针
    self.secondHand = [[UIImageView alloc] init];
    self.secondHand.image = [UIImage imageNamed:@"SecondHand.png"];
    self.secondHand.frame = CGRectMake(0, 0, 8, 102);
    self.secondHand.center = CGPointMake(160, 284);
    [self.view addSubview:self.secondHand];
    
    /*
     当视图旋转的时候，frame是会发生变化的，这会导致布局上的失灵。
     原效果：钟表的图片围绕着中心旋转，而不是围绕一个支点
     现效果：正常，解决方案，使用anchorPoint属性。使得各个指针平移。
     */
    // adjust anchor points
    self.hourHand.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.minuteHand.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.secondHand.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    
    // 启动timer定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    
    // 设置初始钟表指针位置
    [self tick];
}

- (void)tick
{
    // convert time to hours, minutes and seconds
    // 'NSGregorianCalendar' is deprecated: first deprecated in iOS 8.0
    // Replace 'NSGregorianCalendar' with 'NSCalendarIdentifierGregorian'
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    // 'NSHourCalendarUnit' is deprecated: first deprecated in iOS 8.0
    // Replace 'NSHourCalendarUnit' with 'NSCalendarUnitHour'
    NSUInteger units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [calender components:units fromDate:[NSDate date]];
    // calculate hour hand angle
    CGFloat hoursAngle = (components.hour / 12.0) * M_PI * 2.0;
    // calculate minute hand angle
    CGFloat minsAngle = (components.minute / 60.0) * M_PI * 2.0;
    // calculate second hand angle
    CGFloat secsAngle = (components.second / 60.0) * M_PI * 2.0;
    // rotate hands
    self.hourHand.transform = CGAffineTransformMakeRotation(hoursAngle);
    self.minuteHand.transform = CGAffineTransformMakeRotation(minsAngle);
    self.secondHand.transform = CGAffineTransformMakeRotation(secsAngle);
}

@end
