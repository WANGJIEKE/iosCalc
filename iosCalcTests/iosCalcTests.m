//
//  iosCalcTests.m
//  iosCalcTests
//
//  Created by Tongjie Wang on 6/19/23.
//

#import <XCTest/XCTest.h>
#import "Calculator.h"

@interface iosCalcTests : XCTestCase

@property (nonatomic, strong) Calculator *calculator;

@end

@implementation iosCalcTests
- (void)setUp {
    self.calculator = [Calculator new];
}

- (void)tearDown {
    self.calculator = nil;
}

- (void)testCalcuoatorPlus {
    [self.calculator handleCommand:CalculatorCommandTwo];
    XCTAssertEqual(2.0, self.calculator.result);
    [self.calculator handleCommand:CalculatorCommandAdd];
    XCTAssertEqual(0.0, self.calculator.result);
    [self.calculator handleCommand:CalculatorCommandThree];
    XCTAssertEqual(3.0, self.calculator.result);
    [self.calculator handleCommand:CalculatorCommandEval];
    XCTAssertEqual(5.0, self.calculator.result);
}

- (void)testCalcuoatorPlusWithNegation {
    [self.calculator handleCommand:CalculatorCommandTwo];
    XCTAssertEqual(2.0, self.calculator.result);
    [self.calculator handleCommand:CalculatorCommandAdd];
    XCTAssertEqual(0.0, self.calculator.result);
    [self.calculator handleCommand:CalculatorCommandThree];
    XCTAssertEqual(3.0, self.calculator.result);
    [self.calculator handleCommand:CalculatorCommandNegate];
    XCTAssertEqual(-3.0, self.calculator.result);
    [self.calculator handleCommand:CalculatorCommandEval];
    XCTAssertEqual(-1.0, self.calculator.result);
}

- (void)testPercentage {
    [self.calculator handleCommand:CalculatorCommandFive];
    XCTAssertEqual(5.0, self.calculator.result);
    [self.calculator handleCommand:CalculatorCommandPercentage];
    XCTAssertEqual(0.05, self.calculator.result);
}

@end
