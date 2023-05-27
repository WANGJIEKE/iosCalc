//
//  CalculatorClearButton.m
//  iosCalc
//
//  Created by Tongjie Wang on 5/26/23.
//

#import "CalculatorClearButton.h"

@implementation CalculatorClearButton

- (void)setIsAC:(BOOL)isAC {
    _isAC = isAC;
    
    UIButtonConfiguration *config = self.configuration;
    
    if (self.isAC) {
        config.attributedTitle = [[NSAttributedString alloc] initWithString:@"AC" attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:35 weight:UIFontWeightMedium]}];
    } else {
        config.attributedTitle = [[NSAttributedString alloc] initWithString:@"C" attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:35 weight:UIFontWeightMedium]}];
    }
    
    self.configuration = config;
}

@end
