//
//  DecayViewController.m
//  popAnimation
//
//  Created by tsfa on 2018/9/13.
//  Copyright © 2018年 marco. All rights reserved.
//

#import "DecayViewController.h"
#import <pop/POP.h>

@interface DecayViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *blueSquare;
@property (weak, nonatomic) IBOutlet UIImageView *purpleSquare;
@end

@implementation DecayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.blueSquare.userInteractionEnabled = YES;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CGPoint velocity = CGPointMake(500, 500);
        POPDecayAnimation *decayAnimation = [POPDecayAnimation animationWithPropertyNamed:kPOPViewCenter];
        decayAnimation.velocity = [NSValue valueWithCGPoint:velocity];
        [self.purpleSquare pop_addAnimation:decayAnimation forKey:@"purpleAnimation"];
    });
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    pan.minimumNumberOfTouches = 1;
    pan.maximumNumberOfTouches = 1;
    [self.blueSquare addGestureRecognizer:pan];
}

- (void)pan:(UIPanGestureRecognizer *)pan{
    if (pan.state == UIGestureRecognizerStateBegan || pan.state == UIGestureRecognizerStateChanged) {
        CGPoint point = [pan locationInView:self.blueSquare];
        CGPoint pointView = [self.blueSquare convertPoint:point toView:self.view];
        self.blueSquare.center = pointView;
    }else if(pan.state == UIGestureRecognizerStateEnded){
        CGPoint velocity = [pan velocityInView:self.view];
        POPDecayAnimation *decayAnimation = [POPDecayAnimation animationWithPropertyNamed:kPOPViewCenter];
        decayAnimation.velocity = [NSValue valueWithCGPoint:velocity];
        decayAnimation.deceleration = 0.998;//defult is 0.998
        [self.blueSquare pop_addAnimation:decayAnimation forKey:@"center"];
        decayAnimation.completionBlock = ^(POPAnimation *anim, BOOL finished) {
            CGPoint center = self.blueSquare.center;
            if (!CGRectContainsPoint(self.view.frame, center)) {
                self.blueSquare.center = CGPointMake(100, 100);
            }
        };
        
        
        //怎么样不出去屏幕
        decayAnimation.animationDidApplyBlock = ^(POPAnimation *anim) {
            CGSize size = self.view.bounds.size;
            NSLog(@"%s--%d--%@",__FUNCTION__,__LINE__,NSStringFromCGRect(self.blueSquare.frame));
            if (CGRectGetMinX(self.blueSquare.frame) < 0 || CGRectGetMaxX(self.blueSquare.frame) > size.width || CGRectGetMinY(self.blueSquare.frame) < 0 || CGRectGetMaxY(self.blueSquare.frame) > size.height) {
                [self.blueSquare pop_removeAllAnimations];
            }
        };
        
        
    }
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
