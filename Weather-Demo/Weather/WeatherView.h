//
//  WeatherView.h
//  Weather
//
//  Created by 廖宜陞 on 2020/6/16.
//  Copyright © 2020 Aron Beaver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface WeatherView : UIView
-(void)setModel:(WeatherViewModel *) model;
@end

NS_ASSUME_NONNULL_END
