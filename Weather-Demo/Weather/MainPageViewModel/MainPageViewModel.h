//
//  MainPageViewModel.h
//  Weather
//
//  Created by 廖宜陞 on 2020/6/17.
//  Copyright © 2020 Aron Beaver. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface MainPageViewModel : NSObject
@property (strong, nonatomic) NSString *locationName;
@property (strong, nonatomic) NSString *temperature;
@property (strong, nonatomic) NSString *weather;
@property (strong, nonatomic) NSString *probabilityOfPrecipitation;
@property (strong, nonatomic) NSString *relativeHumidity;
@property (strong, nonatomic) NSString *apparentTemperature;
@property (strong, nonatomic) NSString *comfortIndex;
@property (strong, nonatomic) NSString *windSpeed;
@property (strong, nonatomic) NSString *windDirection;
@property (strong, nonatomic) NSString *weatherDescription;
@property (strong, nonatomic) NSString *dayOfWeek
;
@end

NS_ASSUME_NONNULL_END
