//
//  ViewController.m
//  CoreAnimationDemo
//
//  Created by zhangpeng on 2016/12/2.
//  Copyright © 2016年 elviszp. All rights reserved.
//

#import "ViewController.h"
#import "ELAnimatedTransitioning.h"
#import "TransitioningViewController.h"

@interface ViewController ()<UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //将UINavigationControllerDelegate指向自身
    self.navigationController.delegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    if(indexPath.row == 3){
        //获取当前cell的frame，用来指定动画起始位置
        CGRect frame = [tableView rectForRowAtIndexPath:indexPath];
        self.cellFrame = [tableView convertRect:frame toView:self.navigationController.view];
    }
}

#pragma mark - UINavigationControllerDelegate
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if(operation == UINavigationControllerOperationPush){
        if([toVC isKindOfClass:[TransitioningViewController class]]){
            //返回指定动画
            return [[ELAnimatedTransitioning alloc] init];
        }else{
            return nil;
        }
    }else{
        return nil;
    }
}

@end
