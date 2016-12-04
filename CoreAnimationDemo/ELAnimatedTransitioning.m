//
//  ELAnimatedTransitioning.m
//  CoreAnimationDemo
//
//  Created by zhangpeng on 2016/12/4.
//  Copyright © 2016年 elviszp. All rights reserved.
//

#import "ELAnimatedTransitioning.h"
#import "ViewController.h"
#import "TransitioningViewController.h"

@interface ELAnimatedTransitioning()<CAAnimationDelegate>
@property(nonatomic, strong) id<UIViewControllerContextTransitioning> transitionContext;
@end

@implementation ELAnimatedTransitioning

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    self.transitionContext = transitionContext;
    //根据UITransitionContextFromViewControllerKey获取fromVC
    ViewController * fromViewController = (ViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    //根据UITransitionContextToViewControllerKey获取toVC
    TransitioningViewController *toViewController = (TransitioningViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //根据containerView获取当前转场上下文中的容器View
    UIView *containView = [transitionContext containerView];
    //将前后页面按顺序添加进容器
    [containView addSubview:fromViewController.view];
    [containView addSubview:toViewController.view];
    
    UIBezierPath *startMaskPath = [UIBezierPath bezierPathWithRect:fromViewController.cellFrame];
    UIBezierPath *endMaskPath = [UIBezierPath bezierPathWithRect:[UIScreen mainScreen].bounds];
    //通过CALayer的mask属性，来逐渐将上传页面显示出来。
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    maskLayer.path = endMaskPath.CGPath;
    toViewController.view.layer.mask = maskLayer;
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    basicAnimation.fromValue = (__bridge id _Nullable)(startMaskPath.CGPath);
    basicAnimation.toValue = (__bridge id _Nullable)(endMaskPath.CGPath);
    basicAnimation.duration = [self transitionDuration:transitionContext];
    basicAnimation.delegate = self;
    basicAnimation.timingFunction = [CAMediaTimingFunction  functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [maskLayer addAnimation:basicAnimation forKey:@"path"];
}

#pragma mark - CAAnimationDelegate
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self.transitionContext completeTransition:true];
    [self.transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view.layer.mask = nil;
}

@end
