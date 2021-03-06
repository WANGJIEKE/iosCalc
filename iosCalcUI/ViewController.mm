//
//  ViewController.m
//  Calc
//
//  Created by Tongjie Wang on 4/8/19.
//  Copyright © 2019 Tongjie Wang. All rights reserved.
//

#import "ViewController.h"

const UIColor* OP_INACTIVE_BG_COLOR = [UIColor colorWithRed:0.0 green:0.678 blue:0.709 alpha:1.0];
const UIColor* TEXT_COLOR = [UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1.0];

@interface ViewController () {
    Calculator calculator;
}

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UIButton *divideButton;
@property (weak, nonatomic) IBOutlet UIButton *percentButton;
@property (weak, nonatomic) IBOutlet UIButton *negateButton;
@property (weak, nonatomic) IBOutlet UIButton *clearResetButton;
@property (weak, nonatomic) IBOutlet UIButton *multiplyButton;
@property (weak, nonatomic) IBOutlet UIButton *digit9Button;
@property (weak, nonatomic) IBOutlet UIButton *digit8Button;
@property (weak, nonatomic) IBOutlet UIButton *digit7Button;
@property (weak, nonatomic) IBOutlet UIButton *minusButton;
@property (weak, nonatomic) IBOutlet UIButton *digit6Button;
@property (weak, nonatomic) IBOutlet UIButton *digit5Button;
@property (weak, nonatomic) IBOutlet UIButton *digit4Button;
@property (weak, nonatomic) IBOutlet UIButton *plusButton;
@property (weak, nonatomic) IBOutlet UIButton *digit3Button;
@property (weak, nonatomic) IBOutlet UIButton *digit2Button;
@property (weak, nonatomic) IBOutlet UIButton *digit1Button;
@property (weak, nonatomic) IBOutlet UIButton *evalButton;
@property (weak, nonatomic) IBOutlet UIButton *decimalPointButton;
@property (weak, nonatomic) IBOutlet UIButton *digit0Button;
@property (assign) char previousActiveOperator;

@end

@implementation ViewController

#pragma mark UI-initializing methods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.previousActiveOperator = '\0';
    [self addBorderToAllButtons];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    // This method is used for setting status bar to white
    return UIStatusBarStyleLightContent;
}

- (void)addBorderToAllButtons {
    [self addBorderToButton: self.divideButton];
    [self addBorderToButton: self.percentButton];
    [self addBorderToButton: self.negateButton];
    [self addBorderToButton: self.clearResetButton];
    [self addBorderToButton: self.multiplyButton];
    [self addBorderToButton: self.digit9Button];
    [self addBorderToButton: self.digit8Button];
    [self addBorderToButton: self.digit7Button];
    [self addBorderToButton: self.minusButton];
    [self addBorderToButton: self.digit6Button];
    [self addBorderToButton: self.digit5Button];
    [self addBorderToButton: self.digit4Button];
    [self addBorderToButton: self.plusButton];
    [self addBorderToButton: self.digit3Button];
    [self addBorderToButton: self.digit2Button];
    [self addBorderToButton: self.digit1Button];
    [self addBorderToButton: self.evalButton];
    [self addBorderToButton: self.decimalPointButton];
    [self addBorderToButton: self.digit0Button];
}

- (void)addBorderToButton:(UIButton*)button {
    button.layer.borderColor = UIColor.blackColor.CGColor;
    button.layer.borderWidth = 1.0;
}

- (void)updateCalculatorResultDisplay {
    [self updateResultField];
    [self updateActiveButton];
}

- (void)updateResultField {
    self.resultLabel.text = [NSString stringWithCString:calculator.getResult().c_str() encoding:NSUTF8StringEncoding];
}

- (void)makeOpButtonInactive:(char)op {
    UIButton* button = nil;
    switch (op) {
        case '+':
            button = self.plusButton;
            break;
        case '-':
            button = self.minusButton;
            break;
        case '*':
            button = self.multiplyButton;
            break;
        case '/':
            button = self.divideButton;
            break;
        default:
            return;
    }
    [button setBackgroundColor:[[UIColor alloc] initWithCGColor:OP_INACTIVE_BG_COLOR.CGColor]];
    [button setTitleColor:[[UIColor alloc] initWithCGColor:TEXT_COLOR.CGColor] forState:UIControlStateNormal];
}

- (void)makeOpButtonActive:(char)op {
    UIButton* button = nil;
    switch (op) {
        case '+':
            button = self.plusButton;
            break;
        case '-':
            button = self.minusButton;
            break;
        case '*':
            button = self.multiplyButton;
            break;
        case '/':
            button = self.divideButton;
            break;
        default:
            return;
    }
    [button setBackgroundColor:[[UIColor alloc] initWithCGColor:TEXT_COLOR.CGColor]];
    [button setTitleColor:[[UIColor alloc] initWithCGColor:OP_INACTIVE_BG_COLOR.CGColor] forState:UIControlStateNormal];
}

- (void)updateActiveButton {
    char currentOp;
    if ((currentOp = calculator.getActiveOperator()) != self.previousActiveOperator) {
        [self makeOpButtonInactive:self.previousActiveOperator];
        [self makeOpButtonActive:currentOp];
        self.previousActiveOperator = currentOp;
    }
}

- (void)setClearResetButtonTextToC {
    [self.clearResetButton setTitle:@"C" forState:UIControlStateNormal];
}

- (void)setClearResetButtonTextToAC {
    [self.clearResetButton setTitle:@"AC" forState:UIControlStateNormal];
}

#pragma mark Calculator related methods

- (IBAction)onDigit0Tapped:(id)sender {
    calculator.makeInput(Calculator::Command::Zero);
    [self setClearResetButtonTextToC];
    [self updateCalculatorResultDisplay];
}

- (IBAction)onDigit1Tapped:(id)sender {
    calculator.makeInput(Calculator::Command::One);
    [self setClearResetButtonTextToC];
    [self updateCalculatorResultDisplay];
}

- (IBAction)onDigit2Tapped:(id)sender {
    calculator.makeInput(Calculator::Command::Two);
    [self setClearResetButtonTextToC];
    [self updateCalculatorResultDisplay];
}

- (IBAction)onDigit3Tapped:(id)sender {
    calculator.makeInput(Calculator::Command::Three);
    [self setClearResetButtonTextToC];
    [self updateCalculatorResultDisplay];
}

- (IBAction)onDigit4Tapped:(id)sender {
    calculator.makeInput(Calculator::Command::Four);
    [self setClearResetButtonTextToC];
    [self updateCalculatorResultDisplay];
}

- (IBAction)onDigit5Tapped:(id)sender {
    calculator.makeInput(Calculator::Command::Five);
    [self setClearResetButtonTextToC];
    [self updateCalculatorResultDisplay];
}

- (IBAction)onDigit6Tapped:(id)sender {
    calculator.makeInput(Calculator::Command::Six);
    [self setClearResetButtonTextToC];
    [self updateCalculatorResultDisplay];
}

- (IBAction)onDigit7Tapped:(id)sender {
    calculator.makeInput(Calculator::Command::Seven);
    [self setClearResetButtonTextToC];
    [self updateCalculatorResultDisplay];
}

- (IBAction)onDigit8Tapped:(id)sender {
    calculator.makeInput(Calculator::Command::Eight);
    [self setClearResetButtonTextToC];
    [self updateCalculatorResultDisplay];
}

- (IBAction)onDigit9Tapped:(id)sender {
    calculator.makeInput(Calculator::Command::Nine);
    [self setClearResetButtonTextToC];
    [self updateCalculatorResultDisplay];
}

- (IBAction)onDecimalPointTapped:(id)sender {
    calculator.makeInput(Calculator::Command::DecimalPoint);
    [self setClearResetButtonTextToC];
    [self updateCalculatorResultDisplay];
}

- (IBAction)onEvalTapped:(id)sender {
    calculator.makeInput(Calculator::Command::Eval);
    [self setClearResetButtonTextToC];
    [self updateCalculatorResultDisplay];
}

- (IBAction)onPlusTapped:(id)sender {
    calculator.makeInput(Calculator::Command::Plus);
    [self setClearResetButtonTextToC];
    [self updateCalculatorResultDisplay];
}

- (IBAction)onMinusTapped:(id)sender {
    calculator.makeInput(Calculator::Command::Minus);
    [self setClearResetButtonTextToC];
    [self updateCalculatorResultDisplay];
}

- (IBAction)onMultiplyTapped:(id)sender {
    calculator.makeInput(Calculator::Command::Multiply);
    [self setClearResetButtonTextToC];
    [self updateCalculatorResultDisplay];
}

- (IBAction)onDivideTapped:(id)sender {
    calculator.makeInput(Calculator::Command::Divide);
    [self setClearResetButtonTextToC];
    [self updateCalculatorResultDisplay];
}

- (IBAction)onPercentTapped:(id)sender {
    calculator.makeInput(Calculator::Command::Percent);
    [self setClearResetButtonTextToC];
    [self updateCalculatorResultDisplay];
}

- (IBAction)onNegateTapped:(id)sender {
    calculator.makeInput(Calculator::Command::Negate);
    [self setClearResetButtonTextToC];
    [self updateCalculatorResultDisplay];
}

- (IBAction)onACTapped:(id)sender {
    if ([self.resultLabel.text isEqualToString:@"0"]) {
        calculator.makeInput(Calculator::Command::Reset);
    } else {
        calculator.makeInput(Calculator::Command::Clear);
    }
    [self setClearResetButtonTextToAC];
    [self updateCalculatorResultDisplay];
}

@end
