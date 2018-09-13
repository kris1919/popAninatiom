//
//  BasicViewController.m
//  popAnimation
//
//  Created by tsfa on 2018/9/13.
//  Copyright © 2018年 marco. All rights reserved.
//

#import "BasicViewController.h"
#import <pop/POP.h>

@interface BasicViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *blueSquare;

@end

@implementation BasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.blueSquare.alpha = 0;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        POPBasicAnimation *basicAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
        basicAnimation.fromValue = @0;
        basicAnimation.toValue = @1;
        basicAnimation.duration = 2.5f;
        [self.blueSquare pop_addAnimation:basicAnimation forKey:@"alphaAniamtion"];
        
        
        POPBasicAnimation *basicAnimation1 = [POPBasicAnimation animationWithPropertyNamed:kPOPViewBounds];
        basicAnimation1.fromValue = [NSValue valueWithCGRect:self.blueSquare.bounds];
        basicAnimation1.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)];
        basicAnimation1.duration = 2.5f;
        [self.blueSquare pop_addAnimation:basicAnimation1 forKey:@"sizeAniamtion"];
        
    });
    
    
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
