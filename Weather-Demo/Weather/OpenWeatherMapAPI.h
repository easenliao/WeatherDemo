
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "WeatherData.h"
#import "Weather.h"
@interface OpenWeatherMapAPI : NSObject

+ (OpenWeatherMapAPI *)sharedInstance;

- (void)fetchCurrentWeatherEveryThreeHourDataForLocation:(CLLocation *)location completion:(void(^)(Weather *weatherEveryThreeHourData))completion failure:(void(^)(NSError* error))failure;

@end
