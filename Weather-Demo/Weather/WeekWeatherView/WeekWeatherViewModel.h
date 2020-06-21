//
//  WeatherViewModel.h
//  Weather
//
//  Created by 廖宜陞 on 2020/6/18.
//  Copyright © 2020 Aron Beaver. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeekWeatherViewModel : NSObject
@property (strong, nonatomic) NSString *dayOfWeek;
@property (strong, nonatomic) NSString *weather;
@property (strong, nonatomic) NSString *maxT;
@property (strong, nonatomic) NSString *minT;
-(id)initWithWeek:(NSString *) week Weather:(NSString *) weather MaxT:(NSString *) maxT MinT:(NSString *) minT;
@end

NS_ASSUME_NONNULL_END
