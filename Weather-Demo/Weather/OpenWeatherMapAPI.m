
#import "OpenWeatherMapAPI.h"
#import "Keys.h"
@implementation OpenWeatherMapAPI
+ (OpenWeatherMapAPI *)sharedInstance {
    static OpenWeatherMapAPI *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[OpenWeatherMapAPI alloc] init];
    });
    
    return sharedInstance;
}
- (void)fetchWeekWeatherDataForLocation:(CLLocation *)location completion:(void(^)(Weather *weatherData))completion failure:(void(^)(NSError* error))failure{
    [self fetchCurrentWeatherDataForLocation:location APIURL:@"F-D0047-075" completion:^(Weather *weatherData) {
        completion(weatherData);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
- (void)fetchEveryThreeHourWeatherDataForLocation:(CLLocation *)location completion:(void(^)(Weather *weatherData))completion failure:(void(^)(NSError* error))failure{
    [self fetchCurrentWeatherDataForLocation:location APIURL:@"F-D0047-073" completion:^(Weather *weatherData) {
        completion(weatherData);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
- (void)fetchCurrentWeatherDataForLocation:(CLLocation *)location APIURL:(NSString *) url completion:(void(^)(Weather *weatherData))completion failure:(void(^)(NSError* error))failure{

    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_TW"];
    [geocoder reverseGeocodeLocation:location preferredLocale:locale completionHandler:^(NSArray *placemarks, NSError *error) {
        if (!placemarks) {
            // handle error
        }
        
        if(placemarks && placemarks.count > 0)
        {
            CLPlacemark *placemark= [placemarks objectAtIndex:0];
            NSString *urlString = [NSString stringWithFormat:@"https://opendata.cwb.gov.tw/api/v1/rest/datastore/%@?Authorization=%s&locationName=%@",url,kOpenWeatherMapAPIKey,placemark.locality ];

            NSURLSession *session = [NSURLSession sharedSession];
            NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]]];
            
            [[session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
                if(error) {
                    failure(error);
                } else {
                    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];

                    Weather *weather = [[Weather alloc] initWithDictionary:jsonObject];
                    completion(weather);
                }
                
            }] resume];
        }
    }];
    
    
    
}

@end
