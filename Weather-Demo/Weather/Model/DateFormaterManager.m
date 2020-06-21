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
