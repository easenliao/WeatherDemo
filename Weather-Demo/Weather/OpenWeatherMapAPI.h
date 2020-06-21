
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Weather.h"
#import "DateFormaterManager.h"
@interface OpenWeatherMapAPI : NSObject

+ (OpenWeatherMapAPI *)sharedInstance;

- (void)fetchWeekWeatherDataForLocation:(CLLocation *)location completion:(void(^)(Weather *weatherData))completion failure:(void(^)(NSError* error))failure;
- (void)fetchEveryThreeHourWeatherDataForLocation:(CLLocation *)location completion:(void(^)(Weather *weatherData))completion failure:(void(^)(NSError* error))failure;
@end
