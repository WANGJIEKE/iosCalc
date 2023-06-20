//
//  iosCalcUITests.m
//  iosCalcUITests
//
//  Created by Tongjie Wang on 6/19/23.
//

#import <XCTest/XCTest.h>

@interface iosCalcUITests : XCTestCase

@property (nonatomic, strong) XCUIApplication *app;

@end

@implementation iosCalcUITests

- (void)setUp {
    self.continueAfterFailure = NO;
    self.app = [XCUIApplication new];
}

- (void)tearDown {
    self.app = nil;
}

- (void)testInputAndDelete {
    [self.app launch];
    
    XCTAssertEqualObjects(@"AC", self.app.buttons[@"Clear Button"].label);
    
    [self.app.buttons[@"1"] tap];
    XCTAssertEqualObjects(@"1", self.app.staticTexts[@"Result Label"].label);
    XCTAssertEqualObjects(@"C", self.app.buttons[@"Clear Button"].label);
    
    [self.app.buttons[@"2"] tap];
    XCTAssertEqualObjects(@"12", self.app.staticTexts[@"Result Label"].label);
    XCTAssertEqualObjects(@"C", self.app.buttons[@"Clear Button"].label);
    
    [self.app.buttons[@"6"] tap];
    XCTAssertEqualObjects(@"126", self.app.staticTexts[@"Result Label"].label);
    XCTAssertEqualObjects(@"C", self.app.buttons[@"Clear Button"].label);
    
    [self.app.staticTexts[@"Result Label"] swipeLeft];
    XCTAssertEqualObjects(@"12", self.app.staticTexts[@"Result Label"].label);
    XCTAssertEqualObjects(@"C", self.app.buttons[@"Clear Button"].label);
    
    [self.app.staticTexts[@"Result Label"] swipeRight];
    XCTAssertEqualObjects(@"1", self.app.staticTexts[@"Result Label"].label);
    XCTAssertEqualObjects(@"C", self.app.buttons[@"Clear Button"].label);
    
    [self.app.staticTexts[@"Result Label"] swipeRight];
    XCTAssertEqualObjects(@"0", self.app.staticTexts[@"Result Label"].label);
    XCTAssertEqualObjects(@"AC", self.app.buttons[@"Clear Button"].label);
}

@end
