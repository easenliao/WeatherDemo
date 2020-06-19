

#import <Foundation/Foundation.h>
#import "WeaterCollevtionViewModel.h"
#import "MainPageViewModel.h"
#import "WeatherViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface WeatherModel : NSObject

+ (NSArray<WeaterCollevtionViewModel *> *) getCollectViews:(NSArray< WeatherElement * > *) element;
+ (MainPageViewModel *) getMainPageViewModel:(Location *) element;
+ (NSMutableDictionary<NSString *,WeatherViewModel *> * ) getWeatherViewModels:(Location *) element;
+ (NSString *) changeDateStringToWeek:(NSString *) dateString;
+ (NSString *) changeDateToWeek:(NSDate *) date;
+ (NSArray<NSString* > *)getSevenDayWeekFormNow;
@end
NS_ASSUME_NONNULL_END
