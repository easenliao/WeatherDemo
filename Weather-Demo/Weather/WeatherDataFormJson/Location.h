#import <UIKit/UIKit.h>
#import "WeatherElement.h"

@interface Location : NSObject

@property (nonatomic, strong) NSString * geocode;
@property (nonatomic, strong) NSString * lat;
@property (nonatomic, strong) NSString * locationName;
@property (nonatomic, strong) NSString * lon;
@property (nonatomic, strong) NSArray<WeatherElement *> * weatherElement;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
