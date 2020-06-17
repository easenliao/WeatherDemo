

#import <Foundation/Foundation.h>
#import "WeaterCollevtionViewModel.h"
#import "MainPageViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface WeatherModel : NSObject

+ (NSArray<WeaterCollevtionViewModel *> *) getCollectViews:(NSArray< WeatherElement * > *) element;
+ (MainPageViewModel *) getMainPageViewModel:(Location *) element;

@end
NS_ASSUME_NONNULL_END
