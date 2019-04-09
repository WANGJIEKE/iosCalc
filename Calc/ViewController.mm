//
//  ViewController.m
//  Calc
//
//  Created by Tongjie Wang on 4/8/19.
//  Copyright © 2019 Tongjie Wang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    Calculator calculator;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNeedsStatusBarAppearanceUpdate];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
