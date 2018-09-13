//
//  ViewController.m
//  popAnimation
//
//  Created by tsfa on 2018/9/12.
//  Copyright © 2018年 marco. All rights reserved.
//

#import "ViewController.h"
#import "SpringViewController.h"
#import "DecayViewController.h"
#import "BasicViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self popBasic];
    });
}

- (void)popBasic{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    BasicViewController *basicVC = [sb instantiateViewControllerWithIdentifier:@"basic"];
    [self.navigationController pushViewController:basicVC animated:YES];
}

- (void)popDecay{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DecayViewController *decayVC = [sb instantiateViewControllerWithIdentifier:@"decay"];
    [self.navigationController pushViewController:decayVC animated:YES];
}

- (void)popSpring{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SpringViewController *springVC = [sb instantiateViewControllerWithIdentifier:@"spring"];
    [self.navigationController pushViewController:springVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
