//
//  WeekWeatherViewModel+extension.h
//  Weather
//
//  Created by 廖宜陞 on 2020/6/21.
//  Copyright © 2020 Aron Beaver. All rights reserved.
//

#import "WeekWeatherViewModel.h"
#import "Weather.h"
#import "DateFormaterManager.h"
NS_ASSUME_NONNULL_BEGIN

@interface WeekWeatherViewModel (extension)
+ (NSArray<WeekWeatherViewModel *> * ) getWeekWeatherViewModelsFormAPI:(Weather *) data;
@end

NS_ASSUME_NONNULL_END
