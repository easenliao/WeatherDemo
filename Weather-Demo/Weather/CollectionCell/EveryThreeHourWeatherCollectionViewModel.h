

#import <Foundation/Foundation.h>
#import "Weather.h"
NS_ASSUME_NONNULL_BEGIN

@interface EveryThreeHourWeatherCollectionViewModel : NSObject
@property (strong, nullable) NSString *time;
@property (strong, nullable) NSString *weatherDescription;
@property (strong, nullable) NSString *temperature;
@end

NS_ASSUME_NONNULL_END
