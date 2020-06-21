//
//  WeatherModel.m
//  Weather
//
//  Created by 廖宜陞 on 2020/6/17.
//  Copyright © 2020 Aron Beaver. All rights reserved.
//

#import "DateFormaterManager.h"
#import "Weather.h"
@implementation DateFormaterManager
+ (NSMutableDictionary<NSString *,WeekWeatherViewModel *> * ) getWeatherViewModels:(Location *) element{
    NSMutableDictionary<NSString *,WeekWeatherViewModel *> *dict = [NSMutableDictionary dictionary];
    NSArray<NSString* > *weeks = [self getSevenDayWeekFormNow];
    for (NSString *key in weeks) {
        WeekWeatherViewModel *item = [[WeekWeatherViewModel alloc]init];
        item.dayOfWeek = key;
        [dict setObject:item forKey:key];
    }
    for (WeatherElement *item in element.weatherElement) {
        if([item.elementName isEqualToString:@"MinT"]){
            for (Time *i in item.time) {
                NSString *key = [self changeDateStringToWeek:i.startTime];
                [dict objectForKey:key].minT = ([[dict objectForKey:key].minT intValue] > [i.elementValue.firstObject.value intValue] || [dict objectForKey:key].minT == nil) ? i.elementValue.firstObject.value : [dict objectForKey:key].minT;
                
            }
        }
        if([item.elementName isEqualToString:@"MaxT"]){
            for (Time *i in item.time) {
                NSString *key = [self changeDateStringToWeek:i.startTime];
                [dict objectForKey:key].maxT = ([[dict objectForKey:key].maxT intValue] < [i.elementValue.firstObject.value intValue] || [dict objectForKey:key].maxT == nil) ? i.elementValue.firstObject.value : [dict objectForKey:key].maxT;
                
            }
        }
        if([item.elementName isEqualToString:@"Wx"]){
            for (Time *i in item.time) {
                NSString *key = [self changeDateStringToWeek:i.startTime];
                [dict objectForKey:key].weather = i.elementValue.firstObject.value;
            }
        }
    }
    return  dict;
}
/// yyyy-MM-dd HH:mm:ss -> dd號HH點
+(NSString *)changeDateFormat:(NSString *) date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hant_TW"]];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Taipei"]];
    // Make sure it's matched format!
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *nsDate = [[NSDate alloc] init];
    
    nsDate = [dateFormatter dateFromString:date];
    [dateFormatter setDateFormat:@"dd號HH點"];

    NSString *twelveHourString = [dateFormatter stringFromDate:nsDate];
    return twelveHourString;
}
///yyyy-MM-dd HH:mm:ss
+(NSString *)changeDateStringToWeek:(NSString *) dateString{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hant_TW"]];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Taipei"]];
    // Make sure it's matched format!
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *nsDate = [[NSDate alloc] init];
    nsDate = [dateFormatter dateFromString:dateString];
    NSString *weekSeting = [self changeDateToWeek:nsDate];
    return weekSeting;
}
+ (NSString *)changeDateToWeek:(NSDate *) date{
    NSArray *weekday =  @[[NSNull null],@"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六"];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [calendar setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hant_TW"]];
    [calendar setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Taipei"]];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:date];
    NSString *weekStr = [weekday objectAtIndex:components.weekday];
    return weekStr;
}
+(NSArray<NSString* > *)getSevenDayWeekFormNow{
    NSDate *nsDate = [NSDate date];

    NSMutableArray *weeks = [NSMutableArray array];
    for (int i = 0; i < 7 ;i++){
        NSDate *date = [nsDate dateByAddingTimeInterval:(i * 86400)];
        NSString *weekStr = [self changeDateToWeek:date];
        [weeks addObject:weekStr];
    }
    return  weeks;
}

@end
