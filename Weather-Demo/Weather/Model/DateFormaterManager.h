

#import <Foundation/Foundation.h>
#import "EveryThreeHourWeatherCollectionViewModel.h"
#import "MainPageViewModel.h"
#import "WeekWeatherViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface DateFormaterManager : NSObject

+ (NSString *)changeDateFormat:(NSString *) date;
+ (NSString *) changeDateStringToWeek:(NSString *) dateString;
+ (NSString *) changeDateToWeek:(NSDate *) date;
+ (NSArray<NSString* > *)getSevenDayWeekFormNow;
@end
NS_ASSUME_NONNULL_END
