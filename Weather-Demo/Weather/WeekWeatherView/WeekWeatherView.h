//
//  WeatherView.h
//  Weather
//
//  Created by 廖宜陞 on 2020/6/16.
//  Copyright © 2020 Aron Beaver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeekWeatherViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface WeekWeatherView : UIView
-(void)setModel:(WeekWeatherViewModel *) model;
@end

NS_ASSUME_NONNULL_END
