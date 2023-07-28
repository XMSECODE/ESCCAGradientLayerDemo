//
//  ViewController.m
//  ESCCAGradientLayerDemo
//
//  Created by xiatian on 2023/7/28.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self createGradientLayer];
    
    
}

- (void)createGradientLayer {
    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
    gradientLayer.frame = CGRectMake(100, 100, 200, 400);
//    设置渐变的颜色组
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor yellowColor].CGColor,(__bridge id)[UIColor blueColor].CGColor];
    [self.view.layer addSublayer:gradientLayer];
    gradientLayer.startPoint = CGPointMake(1, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
    
    gradientLayer.locations = @[@(0),@(0.5),@(1)];
    
//    添加遮罩
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 400)];
    
    UIBezierPath *maskPath = [UIBezierPath bezierPath];
    [maskPath moveToPoint:CGPointMake(0, 0)];
    [maskPath addLineToPoint:CGPointMake(200, 200)];
    [maskPath addLineToPoint:CGPointMake(100, 400)];
    [maskPath addLineToPoint:CGPointMake(0, 200)];
    [maskPath addLineToPoint:CGPointMake(0, 0)];
    
    maskLayer.path = maskPath.CGPath;
    gradientLayer.mask = maskLayer;
    
    
}


@end
