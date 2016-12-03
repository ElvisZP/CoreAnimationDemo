//
//  ExplicitAnimationViewController.m
//  CoreAnimationDemo
//
//  Created by zhangpeng on 2016/12/3.
//  Copyright © 2016年 elviszp. All rights reserved.
//

#import "ExplicitAnimationViewController.h"

@interface ExplicitAnimationViewController ()
@property(nonatomic, strong) CALayer *explicitLayer;
@end

@implementation ExplicitAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.explicitLayer = [[CALayer alloc]init];
    self.explicitLayer.frame = CGRectMake(50, 200, 200, 200);
    self.explicitLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.explicitLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickBasicAnimation:(id)sender {
    self.explicitLayer.backgroundColor = [UIColor yellowColor].CGColor;
    //创建基础动画，设置property为backgroundColor
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    //基础动画提供fromValue、byValue、toValue。用于指定开始值和目标值。
    basicAnimation.fromValue = (__bridge id _Nullable)([UIColor redColor].CGColor);
    basicAnimation.toValue = (__bridge id _Nullable)([UIColor yellowColor].CGColor);
    //动画时间
    basicAnimation.duration = 5;
    //动画完成后是否移除效果
    basicAnimation.removedOnCompletion = true;
    //添加到图层上执行动画
    [self.explicitLayer addAnimation:basicAnimation forKey:nil];
}

- (IBAction)clickKeyframeAnimation:(id)sender {
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
    keyframeAnimation.values = @[(__bridge id _Nullable)([UIColor yellowColor].CGColor),(__bridge id _Nullable)([UIColor blueColor].CGColor),(__bridge id _Nullable)([UIColor purpleColor].CGColor)];
    keyframeAnimation.duration = 5;
    keyframeAnimation.removedOnCompletion = false;
    //动画默认是没有设置任何属性的值，通过fillMode来解决此问题
    keyframeAnimation.fillMode = kCAFillModeForwards;
    [self.explicitLayer addAnimation:keyframeAnimation forKey:nil];
}

- (IBAction)clickKeyframeAnimationWithPath:(id)sender {
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframeAnimation.path = [UIBezierPath bezierPathWithRoundedRect:self.explicitLayer.frame cornerRadius:50].CGPath;
    keyframeAnimation.removedOnCompletion = false;
    keyframeAnimation.fillMode = kCAFillModeForwards;
    [self.explicitLayer addAnimation:keyframeAnimation forKey:nil];
}

- (IBAction)clickGroupAnimation:(id)sender {
    CAKeyframeAnimation *keyframeAnimation1 = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
    keyframeAnimation1.values = @[(__bridge id _Nullable)([UIColor yellowColor].CGColor),(__bridge id _Nullable)([UIColor blueColor].CGColor),(__bridge id _Nullable)([UIColor purpleColor].CGColor)];
    
    CAKeyframeAnimation *keyframeAnimation2 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframeAnimation2.path = [UIBezierPath bezierPathWithRoundedRect:self.explicitLayer.frame cornerRadius:50].CGPath;
    
    CAAnimationGroup *groupAnimation = [[CAAnimationGroup alloc]init];
    groupAnimation.animations = @[keyframeAnimation1, keyframeAnimation2];
    groupAnimation.duration = 5;
    groupAnimation.removedOnCompletion = false;
    groupAnimation.fillMode = kCAFillModeForwards;
    [self.explicitLayer addAnimation:groupAnimation forKey:nil];
}

@end
