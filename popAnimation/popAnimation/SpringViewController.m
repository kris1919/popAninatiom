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
    springAnimation.repeatCount = 0;
    [self.blueView pop_addAnimation:springAnimation forKey:kPOPViewCenter];
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
