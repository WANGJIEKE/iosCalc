//
//  CalculatorClearButton.m
//  iosCalc
//
//  Created by Tongjie Wang on 5/26/23.
//

#import "CalculatorClearButton.h"

@implementation CalculatorClearButton

- (void)setIsAC:(BOOL)isAC {
    static NSAttributedString *AC, *C;
    static dispatch_once_t token;
    
    dispatch_once(&token, ^{
        AC = [[NSAttributedString alloc] initWithString:@"AC" attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:35 weight:UIFontWeightMedium]}];
        C = [[NSAttributedString alloc] initWithString:@"C" attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:35 weight:UIFontWeightMedium]}];
    });
    
    _isAC = isAC;
    
    UIButtonConfiguration *config = self.configuration;
    
    if (self.isAC) {
        config.attributedTitle = AC;
    } else {
        config.attributedTitle = C;
    }
    
    self.configuration = config;
}

@end
