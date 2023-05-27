//
//  CalculatorOperatorButton.h
//  iosCalc
//
//  Created by Tongjie Wang on 5/25/23.
//

#import <UIKit/UIKit.h>

#import "Calculator.h"

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
@interface CalculatorOperatorButton : UIButton

@property (nonatomic, assign) IBInspectable BOOL isActive;

@end

NS_ASSUME_NONNULL_END
