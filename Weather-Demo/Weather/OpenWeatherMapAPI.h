
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Weather.h"
#import "WeatherModel.h"
@interface OpenWeatherMapAPI : NSObject

+ (OpenWeatherMapAPI *)sharedInstance;

- (void)fetchCurrentWeatherEveryThreeHourDataForLocation:(CLLocation *)location APIURL:(NSString *) url completion:(void(^)(Weather *weatherEveryThreeHourData))completion failure:(void(^)(NSError* error))failure;

@end
