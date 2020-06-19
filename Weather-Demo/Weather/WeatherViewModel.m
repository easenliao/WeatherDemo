//
//  WeatherViewModel.m
//  Weather
//
//  Created by 廖宜陞 on 2020/6/18.
//  Copyright © 2020 Aron Beaver. All rights reserved.
//

#import "WeatherViewModel.h"

@implementation WeatherViewModel
-(id)initWithWeek:(NSString *) week Weather:(NSString *) weather MaxT:(NSString *) maxT MinT:(NSString *) minT{
    if (self = [super init])
     {
         self.week = week;
         self.weather = weather;
         self.maxT = maxT;
         self.minT = minT;
     }
     return self;
}
@end
