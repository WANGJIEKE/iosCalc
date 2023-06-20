//
//  Calculator.m
//  iosCalc
//
//  Created by Tongjie Wang on 5/26/23.
//

#import "Calculator.h"

@interface Calculator ()

@property (assign, nonatomic) CalculatorOp op;
@property (strong, nonatomic) NSMutableString *currentOperand;
@property (strong, nonatomic) NSMutableString *prevOperand;

- (double)performOperation:(CalculatorOp)op prevOperand:(double)prev currentOperand:(double)current;

@end

@interface NSMutableString (SingleCharHelper)

- (void)deleteLastChar;
- (void)deleteFirstChar;

@end

@implementation Calculator

- (instancetype)init {
    if (self = [super init]) {
        self.op = CalculatorOpNone;
        self.currentOperand = [NSMutableString stringWithString:@"0"];
        self.prevOperand = [NSMutableString stringWithString:@"0"];
    }
    return self;
}

- (double)result {
    return self.currentOperand.doubleValue;
}

- (void)handleCommand:(CalculatorCommand)command {
    CalculatorOp prevOp = self.op;
    
    switch (command) {
        case CalculatorCommandOne:
        case CalculatorCommandTwo:
        case CalculatorCommandThree:
        case CalculatorCommandFour:
        case CalculatorCommandFive:
        case CalculatorCommandSix:
        case CalculatorCommandSeven:
        case CalculatorCommandEight:
        case CalculatorCommandNine:
        case CalculatorCommandZero:
            if ([self.currentOperand isEqualToString:@"0"]) {
                [self.currentOperand replaceCharactersInRange:NSMakeRange(0, 1) withString:[NSString stringWithFormat:@"%lu", command]];
            } else if ([self.currentOperand isEqualToString:@"-0"]) {
                [self.currentOperand replaceCharactersInRange:NSMakeRange(1, 1) withString:[NSString stringWithFormat:@"%lu", command]];
            } else {
                [self.currentOperand appendFormat:@"%lu", command];
            }
            break;
        case CalculatorCommandClear:
            if ([self.currentOperand isEqualToString:@"0"]) {
                self.prevOperand = [NSMutableString stringWithString:@"0"];
                self.op = CalculatorOpNone;
            } else {
                self.currentOperand = [NSMutableString stringWithString:@"0"];
            }
            break;
        case CalculatorCommandDelete:
            if ([self.currentOperand isEqualToString:@"0"]) {
                break;
            } else if ([self.currentOperand isEqualToString:@"-0"]) {
                [self.currentOperand deleteFirstChar];
            } else if (self.currentOperand.length == 1 || (self.currentOperand.length == 2 && [self.currentOperand characterAtIndex:0] == '-')) {
                self.currentOperand = [NSMutableString stringWithString:@"0"];
            } else {
                [self.currentOperand deleteLastChar];
            }
            break;
        case CalculatorCommandNegate:
            if ([self.currentOperand isEqualToString:@"0"]) {
                self.currentOperand = [NSMutableString stringWithString:@"-0"];
            } else {
                self.currentOperand = [NSMutableString stringWithFormat:@"%g", -self.currentOperand.doubleValue];
            }
            break;
        case CalculatorCommandPercentage:
            self.currentOperand = [NSMutableString stringWithFormat:@"%g", self.currentOperand.doubleValue / 100];
            break;
        case CalculatorCommandDecimalPoint:
            if ([self.currentOperand rangeOfString:@"."].location == NSNotFound) {
                [self.currentOperand appendString:@"."];
            }
            break;
        case CalculatorCommandAdd:
            self.op = CalculatorOpAdd;
            if (prevOp != CalculatorOpNone) {
                self.currentOperand = [NSMutableString stringWithFormat:@"%g", [self performOperation:self.op prevOperand:self.prevOperand.doubleValue currentOperand:self.currentOperand.doubleValue]];
            }
            self.prevOperand = self.currentOperand;
            self.currentOperand = [NSMutableString stringWithString:@"0"];
            break;
        case CalculatorCommandSubtract:
            self.op = CalculatorOpSubtract;
            if (prevOp != CalculatorOpNone) {
                self.currentOperand = [NSMutableString stringWithFormat:@"%g", [self performOperation:self.op prevOperand:self.prevOperand.doubleValue currentOperand:self.currentOperand.doubleValue]];
            }
            self.prevOperand = self.currentOperand;
            self.currentOperand = [NSMutableString stringWithString:@"0"];
            break;
        case CalculatorCommandMultiply:
            self.op = CalculatorOpMultiply;
            if (prevOp != CalculatorOpNone) {
                self.currentOperand = [NSMutableString stringWithFormat:@"%g", [self performOperation:self.op prevOperand:self.prevOperand.doubleValue currentOperand:self.currentOperand.doubleValue]];
            }
            self.prevOperand = self.currentOperand;
            self.currentOperand = [NSMutableString stringWithString:@"0"];
            break;
        case CalculatorCommandDivide:
            self.op = CalculatorOpDivide;
            if (prevOp != CalculatorOpNone) {
                self.currentOperand = [NSMutableString stringWithFormat:@"%g", [self performOperation:self.op prevOperand:self.prevOperand.doubleValue currentOperand:self.currentOperand.doubleValue]];
            }
            self.prevOperand = self.currentOperand;
            self.currentOperand = [NSMutableString stringWithString:@"0"];
            break;
        case CalculatorCommandEval:
            if (self.op != CalculatorOpNone) {
                double result = [self performOperation:self.op prevOperand:self.prevOperand.doubleValue currentOperand:self.currentOperand.doubleValue];
                self.prevOperand = self.currentOperand;
                self.currentOperand = [NSMutableString stringWithFormat:@"%g", result];
                self.op = CalculatorOpNone;
            }
            break;
    }
    
    [self.delegate commandDidHandleWithResult:self.currentOperand.doubleValue newOp:self.op];
}

- (double)performOperation:(CalculatorOp)op prevOperand:(double)prev currentOperand:(double)current {
    switch (op) {
        case CalculatorOpAdd:
            return prev + current;
        case CalculatorOpSubtract:
            return prev - current;
        case CalculatorOpMultiply:
            return prev * current;
        case CalculatorOpDivide:
            return prev / current;
        case CalculatorOpNone:
            return current;
    }
}

@end

@implementation NSMutableString (SingleCharHelper)

- (void)deleteFirstChar {
    [self deleteCharactersInRange:NSMakeRange(0, 1)];
}

- (void)deleteLastChar {
    [self deleteCharactersInRange:NSMakeRange(self.length - 1, 1)];
}

@end
