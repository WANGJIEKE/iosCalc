//
//  CalculatorOperatorButton.m
//  iosCalc
//
//  Created by Tongjie Wang on 5/25/23.
//

#import "CalculatorOperatorButton.h"

@implementation CalculatorOperatorButton

- (void)setIsActive:(BOOL)isActive {
    static UIColor *accentColor;
    static dispatch_once_t token;
    
    dispatch_once(&token, ^{
        accentColor = [UIColor colorNamed:@"AccentColor"];
    });
    
    _isActive = isActive;
    
    UIButtonConfiguration *config = self.configuration;
    
    if (self.isActive) {
        config.background.backgroundColor = [UIColor whiteColor];
        config.background.strokeColor = accentColor;
        config.background.strokeWidth = 3;
        config.baseForegroundColor = accentColor;
    } else {
        config.background.backgroundColor = accentColor;
        config.background.strokeColor = [UIColor clearColor];
        config.background.strokeWidth = 0;
        config.baseForegroundColor = [UIColor whiteColor];
    }
    
    self.configuration = config;
}

@end
