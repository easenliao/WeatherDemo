//
//  WeekWeatherViewModel+extension.m
//  Weather
//
//  Created by 廖宜陞 on 2020/6/21.
//  Copyright © 2020 Aron Beaver. All rights reserved.
//

#import "WeekWeatherViewModel+extension.h"

@implementation WeekWeatherViewModel (extension)
+ (NSArray<WeekWeatherViewModel *> * ) getWeekWeatherViewModelsFormAPI:(Weather *) data{
    NSMutableDictionary<NSString *,WeekWeatherViewModel *> *dict = [NSMutableDictionary dictionary];
    Location *element = data.records.locations.firstObject.location.firstObject;
    NSArray<NSString* > *weeks = [DateFormaterManager getSevenDayWeekFormNow];
    for (NSString *key in weeks) {
        WeekWeatherViewModel *item = [[WeekWeatherViewModel alloc]init];
        item.dayOfWeek = key;
        [dict setObject:item forKey:key];
    }
    for (WeatherElement *item in element.weatherElement) {
        if([item.elementName isEqualToString:@"MinT"]){
            for (Time *i in item.time) {
                NSString *key = [DateFormaterManager changeDateStringToWeek:i.startTime];
                [dict objectForKey:key].minT = ([[dict objectForKey:key].minT intValue] > [i.elementValue.firstObject.value intValue] || [dict objectForKey:key].minT == nil) ? i.elementValue.firstObject.value : [dict objectForKey:key].minT;
                
            }
        }
        if([item.elementName isEqualToString:@"MaxT"]){
            for (Time *i in item.time) {
                NSString *key = [DateFormaterManager changeDateStringToWeek:i.startTime];
                [dict objectForKey:key].maxT = ([[dict objectForKey:key].maxT intValue] < [i.elementValue.firstObject.value intValue] || [dict objectForKey:key].maxT == nil) ? i.elementValue.firstObject.value : [dict objectForKey:key].maxT;
                
            }
        }
        if([item.elementName isEqualToString:@"Wx"]){
            for (Time *i in item.time) {
                NSString *key = [DateFormaterManager changeDateStringToWeek:i.startTime];
                [dict objectForKey:key].weather = i.elementValue.firstObject.value;
            }
        }
    }
    NSMutableArray<WeekWeatherViewModel *> *weatherViews = [NSMutableArray array];
    for (NSString *item in weeks) {
        WeekWeatherViewModel *m = [dict objectForKey:item];
        [weatherViews addObject: m];
    }
    return  weatherViews;
    
    
}
@end
