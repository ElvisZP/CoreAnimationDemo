//
//  ELAnimatedReverseTransitioning.m
//  CoreAnimationDemo
//
//  Created by zhangpeng on 2016/12/4.
//  Copyright © 2016年 elviszp. All rights reserved.
//

#import "ELAnimatedReverseTransitioning.h"
#import "ViewController.h"
#import "TransitioningViewController.h"


@interface ELAnimatedReverseTransitioning()<CAAnimationDelegate>
@property(nonatomic, strong) id<UIViewControllerContextTransitioning> transitionContext;
@end


@implementation ELAnimatedReverseTransitioning
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    self.transitionContext = transitionContext;
    TransitioningViewController * fromViewController = (TransitioningViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    ViewController *toViewController = (ViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containView = [transitionContext containerView];
    [containView addSubview:toViewController.view];
    [containView addSubview:fromViewController.view];
    
    
    CGRect frame = toViewController.cellFrame;
    frame.origin.y += frame.size.height/2;
    frame.size.height = 1;
    UIBezierPath *startMaskPath = [UIBezierPath bezierPathWithRect:[UIScreen mainScreen].bounds];
    UIBezierPath *endMaskPath = [UIBezierPath bezierPathWithRect:frame];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    maskLayer.path = endMaskPath.CGPath;
    fromViewController.view.layer.mask = maskLayer;
    
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
    [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
}

@end
