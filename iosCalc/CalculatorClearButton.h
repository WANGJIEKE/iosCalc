//
//  CalculatorClearButton.h
//  iosCalc
//
//  Created by Tongjie Wang on 5/26/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
@interface CalculatorClearButton : UIButton

@property (nonatomic, assign) IBInspectable BOOL isAC;
@property (nonatomic, assign) IBInspectable BOOL shouldAdjustFontSizeToFitWidth;

@end

NS_ASSUME_NONNULL_END
