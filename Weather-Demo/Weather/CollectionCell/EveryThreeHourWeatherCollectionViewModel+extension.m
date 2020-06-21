//
//  everyThreeHourWeatherCollectionViewModel+extension.m
//  Weather
//
//  Created by 廖宜陞 on 2020/6/21.
//  Copyright © 2020 Aron Beaver. All rights reserved.
//

#import "EveryThreeHourWeatherCollectionViewModel+extension.h"

@implementation EveryThreeHourWeatherCollectionViewModel (extension)
+ (NSArray<EveryThreeHourWeatherCollectionViewModel *> *) gwtCollectViewsFormAPIData:(Weather *) data{
    NSArray< WeatherElement * > *element = data.records.locations.firstObject.location.firstObject.weatherElement;
        NSMutableArray<EveryThreeHourWeatherCollectionViewModel *> *temp = [NSMutableArray array];
        for (WeatherElement *item in element) {
            if ([item.elementName isEqualToString:@"Wx"]){
                for (int i =0; i < [item.time count]; i++){
                    if ([temp count] <= i){
                        EveryThreeHourWeatherCollectionViewModel *model = [[EveryThreeHourWeatherCollectionViewModel alloc]init];
                        model.weatherDescription = item.time[i].elementValue.firstObject.value;
                        model.time = [DateFormaterManager changeDateFormat:item.time[i].startTime];
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
                        EveryThreeHourWeatherCollectionViewModel *model = [[EveryThreeHourWeatherCollectionViewModel alloc]init];
                        model.temperature = item.time[i].elementValue.firstObject.value;
                        [temp insertObject:model atIndex:i];
                    }else{
                        
                        
                        temp[i].temperature = item.time[i].elementValue.firstObject.value;
                        
                    }
                }
            }
        }
        return  temp;
    

}
@end
