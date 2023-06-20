//
//  Calculator.h
//  iosCalc
//
//  Created by Tongjie Wang on 5/26/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, CalculatorCommand) {
    CalculatorCommandZero, CalculatorCommandOne, CalculatorCommandTwo, CalculatorCommandThree, CalculatorCommandFour,
    CalculatorCommandFive, CalculatorCommandSix, CalculatorCommandSeven, CalculatorCommandEight, CalculatorCommandNine,
    CalculatorCommandClear, CalculatorCommandDelete, CalculatorCommandNegate, CalculatorCommandPercentage, CalculatorCommandDecimalPoint,
    CalculatorCommandAdd, CalculatorCommandSubtract, CalculatorCommandMultiply, CalculatorCommandDivide,
    CalculatorCommandEval
};

typedef NS_ENUM(NSUInteger, CalculatorOp) {
    CalculatorOpNone, CalculatorOpAdd, CalculatorOpSubtract, CalculatorOpMultiply, CalculatorOpDivide
};

@protocol CalculatorDelegate

- (void)commandDidHandleWithResult:(double)result newOp:(CalculatorOp)op;

@end

@interface Calculator : NSObject

@property (weak, nonatomic) id<CalculatorDelegate> delegate;
@property (assign, nonatomic, readonly) CalculatorOp op;

- (instancetype)init;
- (double)result;
- (void)handleCommand:(CalculatorCommand)command;

@end

NS_ASSUME_NONNULL_END
