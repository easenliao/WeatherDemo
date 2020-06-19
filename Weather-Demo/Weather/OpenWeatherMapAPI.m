
#import "OpenWeatherMapAPI.h"
#import "Keys.h"
NSDictionary *cityDicionary;
@implementation OpenWeatherMapAPI
+ (OpenWeatherMapAPI *)sharedInstance {
    static OpenWeatherMapAPI *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[OpenWeatherMapAPI alloc] init];
    });
    cityDicionary = @{@"台中市":@"F-D0047-073"};
    
    return sharedInstance;
}
/// yyyy-MM-ddThh:mm:ss
- (NSString *)getNowTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hant_TW"]];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Taipei"]];
    [formatter setDateFormat:@"yyyy-MM-ddTHH:mm:ss"];
    // Date to string
    NSDate *now = [NSDate date];
    NSString *currentDateString = [formatter stringFromDate:now];
    [formatter setDateFormat:@"HH:mm:ss"];
    NSString *currentTimeString = [formatter stringFromDate:now];
    
    NSString *string = [NSString stringWithFormat:@"%@T%@",currentDateString,currentTimeString ];
    return  string;
}
- (void)fetchCurrentWeatherEveryThreeHourDataForLocation:(CLLocation *)location APIURL:(NSString *) url completion:(void(^)(Weather *weatherEveryThreeHourData))completion failure:(void(^)(NSError* error))failure{

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

                    Weather *weatherEveryThreeHour = [[Weather alloc] initWithDictionary:jsonObject];
                    completion(weatherEveryThreeHour);
                }
                
            }] resume];
        }
    }];
    
    
    
}

@end
