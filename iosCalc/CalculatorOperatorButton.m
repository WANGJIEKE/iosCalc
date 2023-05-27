//
//  CalculatorOperatorButton.m
//  iosCalc
//
//  Created by Tongjie Wang on 5/25/23.
//

#import "CalculatorOperatorButton.h"

@implementation CalculatorOperatorButton

- (void)setIsActive:(BOOL)isActive {
    _isActive = isActive;
    
    UIButtonConfiguration *config = self.configuration;
    
    if (self.isActive) {
        config.background.backgroundColor = [UIColor whiteColor];
        config.background.strokeColor = [UIColor colorNamed:@"AccentColor"];
        config.background.strokeWidth = 3;
        config.baseForegroundColor = [UIColor colorNamed:@"AccentColor"];
    } else {
        config.background.backgroundColor = [UIColor colorNamed:@"AccentColor"];
        config.background.strokeColor = [UIColor clearColor];
        config.background.strokeWidth = 0;
        config.baseForegroundColor = [UIColor whiteColor];
    }
    
    self.configuration = config;
}

@end
