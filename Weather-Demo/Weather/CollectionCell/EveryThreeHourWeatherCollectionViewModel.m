

#import "EveryThreeHourWeatherCollectionViewModel.h"

@implementation EveryThreeHourWeatherCollectionViewModel
- (id) init:(NSString *) time WeatherDescription:(NSString *)weatherDescription Temperature:(NSString *)temperature{
    if (self = [super init])
    {
        self.weatherDescription = weatherDescription;
        self.time = time;
        self.temperature = temperature;
    }
    
    return self;
}

@end
