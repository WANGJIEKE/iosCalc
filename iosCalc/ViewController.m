//
//  ViewController.m
//  iosCalc
//
//  Created by Tongjie Wang on 5/25/23.
//

#import "ViewController.h"
#import "CalculatorClearButton.h"
#import "CalculatorOperatorButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onResultLabelSwipe:(UISwipeGestureRecognizer *)sender {
    switch (sender.direction) {
        case UISwipeGestureRecognizerDirectionRight:
        case UISwipeGestureRecognizerDirectionLeft:
            NSLog(@"Swipe detected");
            break;
        default:
            return;
    }
}

- (IBAction)onClearButtonTap:(CalculatorClearButton *)sender {
    sender.isAC = !sender.isAC;
}

- (IBAction)onNegateButtonTap:(UIButton *)sender {
    NSLog(@"+/- tapped");
}

- (IBAction)onPercentageButtonTap:(UIButton *)sender {
    NSLog(@"%% tapped");
}

- (IBAction)onOperatiorButtonTap:(CalculatorOperatorButton *)sender {
    sender.isActive = !sender.isActive;
}

- (IBAction)onDigitButtonTap:(UIButton *)sender {
    NSLog(@"digit tapped: %@", sender.titleLabel.text);
}

- (IBAction)onDecimalPointButtonTap:(UIButton *)sender {
    NSLog(@". tapped");
}

- (IBAction)onEqualButtonTap:(UIButton *)sender {
    NSLog(@"= tapped");
}

@end
