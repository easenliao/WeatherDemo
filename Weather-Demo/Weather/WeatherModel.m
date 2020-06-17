//
//  WeatherModel.m
//  Weather
//
//  Created by 廖宜陞 on 2020/6/17.
//  Copyright © 2020 Aron Beaver. All rights reserved.
//

#import "WeatherModel.h"

@implementation WeatherModel
+ (NSArray<WeaterCollevtionViewModel *> *)getCollectViews:(NSArray< WeatherElement * > *)element{
    NSArray<WeaterCollevtionViewModel *> *data;
    NSMutableArray<WeaterCollevtionViewModel *> *temp = [[NSMutableArray alloc]init];
    for (WeatherElement *item in element) {
        if ([item.elementName isEqualToString:@"Wx"]){
            for (int i =0; i < [item.time count]; i++){
                if ([temp count] <= i){
                    WeaterCollevtionViewModel *model = [[WeaterCollevtionViewModel alloc]init];
                    model.weatherDescription = item.time[i].elementValue.firstObject.value;
                    model.time = [self changeDateFormat:item.time[i].startTime];
                    [temp insertObject:model atIndex:i];
                    
                }else{
                    temp[i].weatherDescription = item.time[i].elementValue.firstObject.value;
                    temp[i].time = item.time[i].startTime;
                }
                
            }
        }
        if ([item.elementName isEqualToString:@"T"]){
            for (int i =0; i < [item.time count]; i++){
                if ([temp count] <= i){
                    WeaterCollevtionViewModel *model = [[WeaterCollevtionViewModel alloc]init];
                    model.temperature = item.time[i].elementValue.firstObject.value;
                    [temp insertObject:model atIndex:i];
                }else{
                    
                    
                    temp[i].temperature = item.time[i].elementValue.firstObject.value;
                    
                }
            }
        }
    }
    data = [temp copy];
    return  data;
}
+ (MainPageViewModel *)getMainPageViewModel:(Location *)element{
    MainPageViewModel *mainPageViewModel = [[MainPageViewModel alloc]init];
    mainPageViewModel.locationName = element.locationName;
    
    for (WeatherElement *item in element.weatherElement) {
        if([item.elementName isEqualToString:@"T"]){
            mainPageViewModel.t = item.time.firstObject.elementValue.firstObject.value;
        }
        if([item.elementName isEqualToString:@"Wx"]){
            mainPageViewModel.wx = item.time.firstObject.elementValue.firstObject.value;
        }
        
    }
    return mainPageViewModel;
}
/// yyyy-MM-dd HH:mm:ss -> hh
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
@end
