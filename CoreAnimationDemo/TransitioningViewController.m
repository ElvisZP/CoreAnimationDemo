//
//  TransitioningViewController.m
//  CoreAnimationDemo
//
//  Created by zhangpeng on 2016/12/4.
//  Copyright © 2016年 elviszp. All rights reserved.
//

#import "TransitioningViewController.h"
#import "ELAnimatedReverseTransitioning.h"
#import "ViewController.h"


@interface TransitioningViewController ()<UINavigationControllerDelegate>

@end

@implementation TransitioningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UINavigationControllerDelegate
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if(operation == UINavigationControllerOperationPop){
        if([toVC isKindOfClass:[ViewController class]]){
            return [[ELAnimatedReverseTransitioning alloc]init];
        }else{
            return nil;
        }
    }else{
        return nil;
    }
}

@end
