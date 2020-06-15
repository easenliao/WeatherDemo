
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "WeatherData.h"
#import "Weather.h"
@interface OpenWeatherMapAPI : NSObject

+ (OpenWeatherMapAPI *)sharedInstance;

- (void)fetchCurrentWeatherDataForLocation:(CLLocation *)location completion:(void(^)(Weather *weatherData))completion failure:(void(^)(NSError* error))failure;

@end
