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

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet CalculatorClearButton *clearButton;
@property (weak, nonatomic) IBOutlet CalculatorOperatorButton *divideButton;
@property (weak, nonatomic) IBOutlet CalculatorOperatorButton *multiplyButton;
@property (weak, nonatomic) IBOutlet CalculatorOperatorButton *subtractButton;
@property (weak, nonatomic) IBOutlet CalculatorOperatorButton *addButton;

@property (strong, nonatomic) Calculator *calculator;

@end

@implementation ViewController

- (void)viewDidLoad {
    self.calculator = [Calculator new];
    self.calculator.delegate = self;
}

- (IBAction)onResultLabelSwipe:(UISwipeGestureRecognizer *)sender {
    switch (sender.direction) {
        case UISwipeGestureRecognizerDirectionRight:
        case UISwipeGestureRecognizerDirectionLeft:
            [self.calculator handleCommand:CalculatorCommandDelete];
            break;
        default:
            return;
    }
}

- (IBAction)onClearButtonTap:(CalculatorClearButton *)sender {
    [self.calculator handleCommand:CalculatorCommandClear];
}

- (IBAction)onNegateButtonTap:(UIButton *)sender {
    [self.calculator handleCommand:CalculatorCommandNegate];
}

- (IBAction)onPercentageButtonTap:(UIButton *)sender {
    [self.calculator handleCommand:CalculatorCommandPercentage];
}

- (IBAction)onOperatiorButtonTap:(CalculatorOperatorButton *)sender {
    if ([sender.titleLabel.text isEqualToString:@"+"]) {
        [self.calculator handleCommand:CalculatorCommandAdd];
    } else if ([sender.titleLabel.text isEqualToString:@"-"]) {
        [self.calculator handleCommand:CalculatorCommandSubtract];
    } else if ([sender.titleLabel.text isEqualToString:@"×"]) {
        [self.calculator handleCommand:CalculatorCommandMultiply];
    } else if ([sender.titleLabel.text isEqualToString:@"÷"]) {
        [self.calculator handleCommand:CalculatorCommandDivide];
    }
}

- (IBAction)onDigitButtonTap:(UIButton *)sender {
    switch ([sender.titleLabel.text characterAtIndex:0]) {
        case '0':
            [self.calculator handleCommand:CalculatorCommandZero];
            break;
        case '1':
            [self.calculator handleCommand:CalculatorCommandOne];
            break;
        case '2':
            [self.calculator handleCommand:CalculatorCommandTwo];
            break;
        case '3':
            [self.calculator handleCommand:CalculatorCommandThree];
            break;
        case '4':
            [self.calculator handleCommand:CalculatorCommandFour];
            break;
        case '5':
            [self.calculator handleCommand:CalculatorCommandFive];
            break;
        case '6':
            [self.calculator handleCommand:CalculatorCommandSix];
            break;
        case '7':
            [self.calculator handleCommand:CalculatorCommandSeven];
            break;
        case '8':
            [self.calculator handleCommand:CalculatorCommandEight];
            break;
        case '9':
            [self.calculator handleCommand:CalculatorCommandNine];
            break;
        default:
            break;
    }
}

- (IBAction)onDecimalPointButtonTap:(UIButton *)sender {
    [self.calculator handleCommand:CalculatorCommandDecimalPoint];
}

- (IBAction)onEqualButtonTap:(UIButton *)sender {
    [self.calculator handleCommand:CalculatorCommandEval];
}

- (void)commandDidHandleWithResult:(double)result newOp:(CalculatorOp)op {
    self.resultLabel.text = [NSString stringWithFormat:@"%g", result];
    
    self.divideButton.isActive = self.multiplyButton.isActive = self.subtractButton.isActive = self.addButton.isActive = NO;
    
    switch (op) {
        case CalculatorOpAdd:
            self.addButton.isActive = YES;
            break;
        case CalculatorOpSubtract:
            self.subtractButton.isActive = YES;
            break;
        case CalculatorOpMultiply:
            self.multiplyButton.isActive = YES;
            break;
        case CalculatorOpDivide:
            self.divideButton.isActive = YES;
            break;
        default:
            break;
    }
    
    self.clearButton.isAC = result == 0;
}

@end
