
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Weather.h"
#import "WeatherModel.h"
@interface OpenWeatherMapAPI : NSObject

+ (OpenWeatherMapAPI *)sharedInstance;

- (void)fetchCurrentWeatherDataForLocation:(CLLocation *)location APIURL:(NSString *) url completion:(void(^)(Weather *weatherData))completion failure:(void(^)(NSError* error))failure;

@end
