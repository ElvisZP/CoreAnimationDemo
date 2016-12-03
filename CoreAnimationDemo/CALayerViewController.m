//
//  CALayerViewController.m
//  CoreAnimationDemo
//
//  Created by zhangpeng on 2016/12/3.
//  Copyright © 2016年 elviszp. All rights reserved.
//

#import "CALayerViewController.h"

@interface CALayerViewController ()
@property(nonatomic, strong) UIView *layerView;
@end

@implementation CALayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.layerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 192)];
    self.layerView.center = self.view.center;
    [self.view addSubview:self.layerView];
    
    [self testContents];
    [self testBorder];
    [self testCornerRadius];
    [self testMask];
    
}

-(void)testContents{
    self.layerView.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"gyy"].CGImage);
    //图片填充类型：类似于UIImageView的contentMode属性
    self.layerView.layer.contentsGravity = kCAGravityResizeAspect;
}

-(void)testBorder{
    //添加边框
    self.layerView.layer.borderColor = [UIColor blueColor].CGColor;
    self.layerView.layer.borderWidth = 2;
}

-(void)testCornerRadius{
    //设置圆角会造成离屏渲染，如果页面有多个圆角，则使用CoreGraphcies来进入圆角绘制。
    self.layerView.layer.cornerRadius = 30;
    self.layerView.layer.masksToBounds = true;
}

-(void)testMask{
    //设置图层蒙板。
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"gyy"]];
    imageView.frame = CGRectMake(50, 50, 300, 192);
    [self.view addSubview:imageView];
    
    CALayer *maskLayer = [[CALayer alloc]init];
    maskLayer.contents =(id)[[UIImage imageNamed:@"logo"] CGImage];
    maskLayer.frame = CGRectMake(50, 40, 100, 100);
    imageView.layer.mask = maskLayer;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
