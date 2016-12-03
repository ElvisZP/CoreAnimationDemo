//
//  ImplicitAnimationViewController.m
//  CoreAnimationDemo
//
//  Created by zhangpeng on 2016/12/3.
//  Copyright © 2016年 elviszp. All rights reserved.
//

#import "ImplicitAnimationViewController.h"

@interface ImplicitAnimationViewController ()
@property(nonatomic, strong) CALayer *implicitLayer;
@end

@implementation ImplicitAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.implicitLayer = [[CALayer alloc]init];
    self.implicitLayer.frame = CGRectMake(50, 200, 200, 200);
    self.implicitLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.implicitLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickChangeFrame:(id)sender {
    CGRect frame = self.implicitLayer.frame;
    frame.size.width = frame.size.width * 1.2;
    frame.size.height = frame.size.height * 1.2;
    self.implicitLayer.frame = frame;
}

- (IBAction)clickChangeColor:(id)sender {
    self.implicitLayer.backgroundColor = [UIColor yellowColor].CGColor;
}

- (IBAction)clickTransaction:(id)sender {
    [CATransaction begin];
    [CATransaction setAnimationDuration:5];
    CGRect frame = self.implicitLayer.frame;
    frame.size.width = frame.size.width * 1.2;
    frame.size.height = frame.size.height * 1.2;
    self.implicitLayer.frame = frame;
    [CATransaction commit];
}
@end


/* If defined, called by the default implementation of the -display
 * method, in which case it should implement the entire display
 * process (typically by setting the `contents' property). */

//- (void)displayLayer:(CALayer *)layer;

/* If defined, called by the default implementation of -drawInContext: */

//- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx;

/* If defined, called by the default implementation of the -display method.
 * Allows the delegate to configure any layer state affecting contents prior
 * to -drawLayer:InContext: such as `contentsFormat' and `opaque'. It will not
 * be called if the delegate implements -displayLayer. */

//- (void)layerWillDraw:(CALayer *)layer
CA_AVAILABLE_STARTING (10.12, 10.0, 10.0, 3.0);

/* Called by the default -layoutSublayers implementation before the layout
 * manager is checked. Note that if the delegate method is invoked, the
 * layout manager will be ignored. */

//- (void)layoutSublayersOfLayer:(CALayer *)layer;

/* If defined, called by the default implementation of the
 * -actionForKey: method. Should return an object implementating the
 * CAAction protocol. May return 'nil' if the delegate doesn't specify
 * a behavior for the current event. Returning the null object (i.e.
 * '[NSNull null]') explicitly forces no further search. (I.e. the
 * +defaultActionForKey: method will not be called.) */

//- (nullable id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event;
