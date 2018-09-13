//
//  SpringViewController.m
//  popAnimation
//
//  Created by tsfa on 2018/9/12.
//  Copyright © 2018年 marco. All rights reserved.
//

#import "SpringViewController.h"
#import <pop/POP.h>

@interface SpringViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *blueView;
@property (weak, nonatomic) IBOutlet UIImageView *purpleView;

@end

@implementation SpringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    springAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(width - self.blueView.center.x, self.blueView.center.y)];
    springAnimation.beginTime = CACurrentMediaTime();//开始时间
    springAnimation.springSpeed = 1.0f; //[0-20] 速度越大  越快结束
    springAnimation.springBounciness = 0; //[0-20] 弹力越大 震动幅度越大
//    springAnimation.dynamicsTension = 5;//弹簧张力
//    springAnimation.dynamicsFriction = 5;//弹簧的摩擦力
//    springAnimation.dynamicsMass = 5;//物体质量
//    springAnimation.repeatCount = NSIntegerMax;//重复次数
    springAnimation.repeatForever = YES;
    springAnimation.autoreverses = YES;
    [self.blueView pop_addAnimation:springAnimation forKey:kPOPViewCenter];
    __weak typeof (self) weakSelf = self;
    springAnimation.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        if (finished) {
            NSLog(@"%s--%d--%@",__FUNCTION__,__LINE__,NSStringFromCGRect(weakSelf.blueView.frame));
        }
    };
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.blueView pop_removeAllAnimations];
    });
    
    
//    [UIView animateWithDuration:2.0f delay:0.0f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
//        weakSelf.purpleView.center = CGPointMake(width - CGRectGetMidX(weakSelf.purpleView.frame), CGRectGetMidY(weakSelf.purpleView.frame));
//    } completion:nil];
    
    [UIView animateWithDuration:1.0f delay:0.0f options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
        weakSelf.purpleView.center = CGPointMake(width - CGRectGetMidX(weakSelf.purpleView.frame), CGRectGetMidY(weakSelf.purpleView.frame));
    } completion:nil];
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
