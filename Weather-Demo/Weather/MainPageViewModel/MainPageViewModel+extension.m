//
//  MainPageViewModel+extension.m
//  Weather
//
//  Created by 廖宜陞 on 2020/6/21.
//  Copyright © 2020 Aron Beaver. All rights reserved.
//

#import "MainPageViewModel+extension.h"

@implementation MainPageViewModel (extension)
+ (MainPageViewModel *) weatherFormAPIToMainPageViewModel:(Weather *) data{
    Location *element = data.records.locations.firstObject.location.firstObject;
    MainPageViewModel *mainPageViewModel = [[MainPageViewModel alloc]init];
    mainPageViewModel.locationName = element.locationName;
    mainPageViewModel.dayOfWeek = [DateFormaterManager changeDateToWeek:[NSDate date]];
    for (WeatherElement *item in element.weatherElement) {
        if([item.elementName isEqualToString:@"T"]){
            mainPageViewModel.temperature = item.time.firstObject.elementValue.firstObject.value;
        }
        if([item.elementName isEqualToString:@"Wx"]){
            mainPageViewModel.weather = item.time.firstObject.elementValue.firstObject.value;
        }
        if([item.elementName isEqualToString:@"PoP6h"]){
            mainPageViewModel.probabilityOfPrecipitation = item.time.firstObject.elementValue.firstObject.value;
        }
        if([item.elementName isEqualToString:@"RH"]){
            mainPageViewModel.relativeHumidity = item.time.firstObject.elementValue.firstObject.value;
        }
        if([item.elementName isEqualToString:@"AT"]){
            mainPageViewModel.apparentTemperature = item.time.firstObject.elementValue.firstObject.value;
        }
        if([item.elementName isEqualToString:@"CI"]){
            mainPageViewModel.comfortIndex = item.time.firstObject.elementValue.firstObject.value;
        }
        if([item.elementName isEqualToString:@"WS"]){
            mainPageViewModel.windSpeed = item.time.firstObject.elementValue.firstObject.value;
        }
        if([item.elementName isEqualToString:@"WD"]){
            mainPageViewModel.windDirection = item.time.firstObject.elementValue.firstObject.value;
        }
        if([item.elementName isEqualToString:@"WeatherDescription"]){
            mainPageViewModel.weatherDescription = item.time.firstObject.elementValue.firstObject.value;
        }
    }
    return mainPageViewModel;
}

@end
